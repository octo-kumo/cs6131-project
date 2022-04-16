<template>
  <div class="max-w-3xl mx-auto p-2">
    <div class="m-2 p-4 rounded-t-2xl rounded-b border border-gray-500">
      <h6 class="uppercase font-bold text-gray-200 select-none">
        Container name
      </h6>
      <h1 class="text-4xl -mt-4" v-text="container&&container.name"/>
      <h6 class="uppercase font-bold text-gray-200 select-none">
        Container ID
      </h6>
      <h1 class="text-2xl font-mono -mt-4" v-text="container&&container.cid"/>
      <hr v-if="!editing" class="my-2">
      <button v-if="!editing" class="btn primary" @click="editing=!!(editedContainer={...container})">
        Edit
      </button>
    </div>
    <form v-if="editing" class="m-2 p-4 rounded border border-gray-500" @submit.prevent="save">
      <fieldset :disabled="disabled" class="mb-2">
        <label class="block">Container ID</label>
        <input v-model="editedContainer.cid" name="id" placeholder="URL safe please" required>
        <label class="block">Container Name</label>
        <input v-model="editedContainer.name" name="name" placeholder="A beautiful name to replace one" required>
      </fieldset>

      <button class="btn success" type="submit">
        Save
      </button>
      <button class="btn danger" @click="deleteCol">
        Delete
      </button>
      <button class="btn" @click="editing=false">
        Cancel
      </button>
    </form>
    <div v-if="diagrams" class="grid lg:grid-cols-3 md:grid-cols-2 sm:grid-cols-1 grid-flow-row-dense">
      <div
        v-for="(d, i) in diagrams"
        :key="i"
        class="p-4 border border-black rounded m-2"
      >
        <nuxt-link :to="`/d/${d.did}`">
          <pre class="text-blue-500" v-text="d.did"/>
        </nuxt-link>
        <h1 v-text="d.name"/>
      </div>
      <nuxt-link
        :to="`/n/diagram?cid=${$route.params.cid}`"
        class="block p-4 border border-black rounded m-2 hover:text-blue-500 hover:border-blue-500"
      >
        <h1 class="text-4xl text-center">
          +
        </h1>
      </nuxt-link>
    </div>
    <button
      class="btn primary rounded-full w-12 h-12 fixed transform right-4 bottom-2 ease-in-out transition-all duration-300 z-30"
      :class="chatOpen?['-translate-x-96']:['translate-x-0']"
      @click="chatOpen = !chatOpen"
    >
      <svg class="w-8 h-8" viewBox="0 0 24 24">
        <path
          fill="currentColor"
          d="M12,3C17.5,3 22,6.58 22,11C22,15.42 17.5,19 12,19C10.76,19 9.57,18.82 8.47,18.5C5.55,21 2,21 2,21C4.33,18.67 4.7,17.1 4.75,16.5C3.05,15.07 2,13.13 2,11C2,6.58 6.5,3 12,3Z"
        />
      </svg>
    </button>
    <aside
      :class="chatOpen ? 'translate-x-0' : 'translate-x-full'"
      class="transform bottom-2 right-2 w-96 bg-white fixed rounded-xl ring-1 ring-gray-500 p-2 overflow-auto ease-in-out transition-all duration-300 z-30"
    >
      <h1 class="text-xl m-2">
        Chat
      </h1>
      <div class="h-64" style="overflow:auto; display:flex; flex-direction:column-reverse;">
        <ul class="m-2">
          <li
            v-for="(c,i) in messages"
            :key="i"
            class="message relative pl-12 hover:bg-gray-100"
            :class="c.pending?'opacity-50':''"
            @contextmenu.prevent.stop="handleClick($event, c)"
          >
            <div v-if="!(i>0&&messages[i-1]&&messages[i-1].uid===c.uid&&closeInTime(messages[i-1], c))">
              <img
                :src="c.pfp||'/images/guest.png'"
                class="rounded-full w-10 h-10 absolute top-1 left-1 message-pfp"
                alt=""
              >
              <h3 class="message-info">
                <span class="font-bold" v-text="c.name"/>
                <span class="text-gray-500 text-sm" v-text="formatTime(c.datetime)"/>
              </h3>
            </div>
            <p class="message-body" v-html="process(c.text)"/>
          </li>
        </ul>
      </div>
      <form class="flex mx-2" @submit.prevent="sendMessage">
        <textarea
          v-model="message"
          rows="1"
          class="block p-2 ring-1 ring-gray-500 w-full bg-gray-50 focus:bg-white resize-none"
          placeholder="Chat here..."
          @keydown="keydown"
        />
      </form>
    </aside>
    <context-menu
      ref="contextMenu"
      element-id="context-menu"
      :options="menuOptions"
      @option-clicked="optionClicked"
    >
      <li>Delete</li>
    </context-menu>
  </div>
</template>

<script lang="ts">
import {Component, Ref, Vue} from 'nuxt-property-decorator'
import moment from "moment"
import sanitizeHtml from 'sanitize-html'
import MarkdownIt from "markdown-it"
import {Socket} from "socket.io-client"
// @ts-ignore
import VueSimpleContextMenu from 'vue-simple-context-menu'
import {del, get, post} from "~/plugins/api"
import {containerEntity, diagramEntity, messageEntity, userEntity, vuserEntity} from "~/types/data-types"
import client from "~/socket/client"
import 'vue-simple-context-menu/dist/vue-simple-context-menu.css'

@Component({
  components: {ContextMenu: VueSimpleContextMenu}
})
export default class containerView extends Vue {
  @Ref('contextMenu') contextMenu!: VueSimpleContextMenu
  md!: MarkdownIt
  io!: Socket
  name = 'containerView'
  editing = false
  disabled = false
  chatOpen = false
  container: containerEntity | null = null
  diagrams: diagramEntity[] = []
  messages: (messageEntity & vuserEntity & { pending?: boolean })[] = []

  editedContainer: containerEntity = {cid: "", name: ""}
  message = ''

  created() {
    this.md = new MarkdownIt({
      html: true,
      breaks: true,
      linkify: true
    })
    this.io = client()
    this.io.connect()
    this.io.on("new.message", (obj: messageEntity & vuserEntity) => {
      if (obj.cid !== this.$route.params.cid) return
      const index = this.messages.findIndex(m => m.text === obj.text && m.pending)
      if (index > -1) this.messages.splice(index, 1)
      this.messages.push(obj)
    })
    this.io.on("delete.message", (obj: messageEntity & vuserEntity) => {
      if (obj.cid !== this.$route.params.cid) return
      const index = this.messages.findIndex(m => m.mid === obj.mid)
      if (index > -1) this.messages.splice(index, 1)
    })
  }

  mounted() {
    get(`/api/c/${this.$route.params.cid}`).then(res => this.container = res.container)
    get(`/api/c/${this.$route.params.cid}/d`).then(res => this.diagrams = res.diagrams)
    get(`/api/c/${this.$route.params.cid}/c`).then(res => this.messages = res.messages)
  }

  save() {
    this.disabled = true
    post(`/api/c/${this.$route.params.cid}`, this.editedContainer).then((res) => {
      if (res.container.cid !== this.container?.cid) this.$router.push(`/c/${res.container.cid}`)
      this.container = res.container
    }).catch(alert).finally(() => this.editing = this.disabled = false)
  }

  deleteCol() {
    if (confirm("Are you sure?")) del(`/api/c/${this.$route.params.cid}`).then(() => this.$router.push("/c")).catch(alert)
  }

  formatTime(timestamp: Date | string) {
    const now = moment()
    const time = moment(timestamp)
    if (now.isSame(time, 'day')) return "Today at " + time.format("HH:mm")
    if (now.subtract(1, 'day').isSame(time, 'day')) return "Yesterday at " + time.format("HH:mm")
    return time.format("DD/MM/YYYY")
  }

  process(markdown: string) {
    return sanitizeHtml(this.md.render(markdown ?? ''))
  }

  sendMessage() {
    if (!this.message) return
    this.messages.push({
      email: this.user?.email,
      isAdmin: this.user?.isAdmin,
      name: this.user?.name,
      pfp: this.user?.pfp,
      uid: this.user?.uid ?? '',
      cid: this.$route.params.cid,
      mid: '',
      datetime: new Date(),
      pending: true,
      text: this.message
    })
    post(`/api/c/${this.$route.params.cid}/c`, {message: this.message}).catch(alert)
    this.message = ''
  }

  keydown(e: KeyboardEvent) {
    if (e.code === "Enter" && !e.shiftKey) {
      e.preventDefault()
      this.sendMessage()
    }
  }

  handleClick(e: MouseEvent, item: messageEntity) {
    this.contextMenu.showMenu(e, item)
  }

  optionClicked({item, option}: { item: messageEntity, option: { name: string } }) {
    if (option.name === "Delete") del(`/api/c/${this.$route.params.cid}/c/${item.mid}`).catch(alert)
  }

  readonly menuOptions = [{
    name: "Delete"
  }]

  get user(): userEntity {
    return this.$store.state.user
  }

  closeInTime(m1: messageEntity, m2: messageEntity) {
    return moment(m1.datetime).isSame(moment(m2.datetime), 'minute')
  }
}
</script>

<style lang="scss">
.context-menu {
  @apply hidden z-50;
}

.message {
  a {
    @apply text-blue-500 hover:text-blue-700;
  }

  ul {
    list-style-type: disc;
    padding-left: 1em;
  }

  ol {
    list-style-type: decimal;
    padding-left: 1em;
  }
}
</style>
