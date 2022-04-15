<template>
  <div class="max-w-3xl mx-auto p-2">
    <div class="m-2 p-4 rounded-t-2xl rounded-b border border-gray-500">
      <h6 class="uppercase font-bold text-gray-200 select-none">
        Container name
      </h6>
      <h1 class="text-4xl -mt-4" v-text="container&&container.name"/>
      <h6 class="uppercase font-bold text-gray-200 select-none">
        ID
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
  </div>
</template>

<script lang="ts">
import {Component, Vue} from 'nuxt-property-decorator'
import {del, get, post} from "~/plugins/api"
import {containerEntity} from "~/types/data-types";

@Component
export default class containerView extends Vue {
  name = 'containerView'
  editing = false
  disabled = false
  container: containerEntity | null = null
  diagrams = []

  editedContainer: containerEntity = {cid: "", name: ""}

  mounted() {
    get(`/api/c/${this.$route.params.cid}`).then(res => this.container = res.container)
    get(`/api/c/${this.$route.params.cid}/d`).then(res => this.diagrams = res.diagrams)
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
}
</script>

<style scoped>
</style>
