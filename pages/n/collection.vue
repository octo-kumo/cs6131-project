<template>
  <form
    class="max-w-md mx-auto bg-slate-100 rounded-xl border-2 p-4 mt-2"
    @submit.prevent="submit()"
  >
    <h1 class="text-center text-2xl">
      New Collection
    </h1>
    <div class="grid grid-cols-2 m-2">
      <label class="text-right px-4">ID</label>
      <input v-model="id" name="id" placeholder="URL safe please" required>
    </div>
    <div class="grid grid-cols-2 m-2">
      <label class="text-right px-4">Name</label>
      <input v-model="name" name="name" placeholder="You will give it a beautiful name" required>
    </div>
    <div class="grid grid-cols-2 gap-4">
      <button class="btn success" type="submit">
        Save
      </button>
      <nuxt-link to="/" class="btn danger">
        Cancel
      </nuxt-link>
    </div>
  </form>
</template>

<script lang="ts">
import {Component, Vue} from 'nuxt-property-decorator'

@Component
export default class newCollection extends Vue {
  id = ''
  name = ''

  submit() {
    fetch("/api/n/c", {
      method: "POST",
      body: JSON.stringify({
        name: this.name,
        id: this.id
      }),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }
    }).then(res => res.json()).then((res) => {
      if (res.status === "success") {
        this.$router.push(`/c/${this.id}`)
      } else alert(res.error)
    })
  }
}
</script>
