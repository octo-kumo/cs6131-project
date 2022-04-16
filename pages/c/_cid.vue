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
    <div v-if="diagrams">
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
    <hr>
    <h1 class="text-xl m-2">
      Chat
    </h1>
    <ul class="m-2">
      <li
        v-for="(c,i) in messages"
        :key="i"
        class="message relative pl-12 hover:bg-gray-100"
        :class="c.pending?'opacity-50':''"
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
    <ul class="context-menu">
      <li>Delete</li>
    </ul>
    <form class="flex mx-2" @submit.prevent="sendMessage">
      <textarea
        v-model="message"
        class="block p-2 ring-1 ring-gray-500 w-full bg-gray-50 focus:bg-white resize-none"
        placeholder="Chat here..."
        @keydown="keydown"
      />
    </form>
  </div>
</template>

<script lang="ts">
import {Component, Vue} from 'nuxt-property-decorator'
import moment from "moment"
import sanitizeHtml from 'sanitize-html'
import MarkdownIt from "markdown-it"
import {Socket} from "socket.io-client"
import {del, get, post} from "~/plugins/api"
import {containerEntity, diagramEntity, messageEntity, userEntity, vuserEntity} from "~/types/data-types"
import client from "~/socket/client"

@Component
export default class containerView extends Vue {
  md!: MarkdownIt
  io!: Socket
  name = 'containerView'
  editing = false
  disabled = false
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
    post(`/api/c/${this.$route.params.cid}/c`, {message: this.message}).then((res) => {
      this.message = ''
    }).catch(alert)
  }

  keydown(e: KeyboardEvent) {
    if (e.code === "Enter" && !e.shiftKey) {
      e.preventDefault()
      this.sendMessage()
    }
  }

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
