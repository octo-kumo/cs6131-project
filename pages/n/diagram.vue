<template>
  <form
    class="max-w-md mx-auto bg-slate-100 rounded-xl border-2 p-4 mt-2"
    @submit.prevent="submit()"
  >
    <h1 class="text-center text-2xl">
      New Diagram
    </h1>
    <div class="grid grid-cols-2 m-2">
      <label class="text-right px-4">Container</label>
      <select v-model="cid" name="cid" required>
        <option v-for="(o,i) in containers" :key="i" :value="o.cid" v-text="o.name"/>
      </select>
    </div>
    <div class="grid grid-cols-2 m-2">
      <label class="text-right px-4">ID</label>
      <input v-model="id" name="id" placeholder="URL safe please" required>
    </div>
    <div class="grid grid-cols-2 m-2">
      <label class="text-right px-4">Name</label>
      <input v-model="name" name="name" placeholder="You will give it a beautiful name" required>
    </div>
    <div class="grid grid-cols-2 m-2">
      <label class="text-right px-4">Type</label>
      <select v-model="type" name="cid" required>
        <option value="er">
          Entity Relation
        </option>
        <option value="rs">
          Relational Schema
        </option>
      </select>
    </div>
    <div class="grid grid-cols-2 gap-4">
      <button class="btn success" type="submit">
        Save
      </button>
      <nuxt-link :to="`/c/${cid}`" class="btn danger">
        Cancel
      </nuxt-link>
    </div>
  </form>
</template>

<script lang="ts">
import {Component, Vue} from 'nuxt-property-decorator'
import {containerEntity} from "~/types/data-types"

@Component
export default class newDiagram extends Vue {
  cid = this.$route.query.cid ?? ''
  id = ''
  name = ''
  type = 'er'

  submit() {
    fetch("/api/n/d", {
      method: "POST",
      body: JSON.stringify({
        cid: this.cid,
        type: this.type,
        name: this.name,
        id: this.id
      }),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }
    }).then(res => res.json()).then((res) => {
      if (res.status === "success") {
        this.$router.push(`/d/${this.id}`)
      } else alert(res.error)
    })
  }

  get containers(): containerEntity[] {
    return this.$store.state.containers || []
  }
}
</script>
