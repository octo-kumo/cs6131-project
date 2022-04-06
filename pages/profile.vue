<template>
  <form
    class="max-w-md mx-auto bg-slate-100 rounded-xl border-2 p-4 mt-2"
    @submit.prevent="profileSubmit()"
  >
    <h1 class="text-center text-2xl">
      Profile Edit
    </h1>
    <div class="grid grid-cols-2 m-2">
      <label class="text-right px-4">Name</label>
      <input v-model="name" name="name" placeholder="Your Beautiful Name">
    </div>
    <div class="grid grid-cols-2 m-2">
      <label class="text-right px-4">Email</label>
      <input v-model="email" name="email" placeholder="user@example.com" readonly disabled>
    </div>
    <div class="grid grid-cols-2 m-2">
      <label class="text-right px-4">Old Password</label>
      <input v-model="opassword" name="password" type="password" minlength="8" placeholder="Password">
    </div>
    <div class="grid grid-cols-2 m-2">
      <label class="text-right px-4">New Password</label>
      <input v-model="npassword" name="password" type="password" minlength="8" placeholder="New Password">
      <label/>
      <input v-model="rpassword" name="password" type="password" minlength="8" placeholder="Repeat Password">
    </div>
    <div class="m-2">
      <label>Profile Picture</label>
      <img class="object-cover w-32 h-32" :src="pfp||(user&&user.pfp)||'/images/guest.png'" alt="">
      <input v-model="pfp" class="w-full" name="pfp" type="url" placeholder="https://example.com/image.png">
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
import {Component, Vue, Watch} from 'nuxt-property-decorator'
import User from "~/model/user"

@Component
export default class profile extends Vue {
  name = ''
  pfp = ''
  email = ""
  opassword = ""
  npassword = ""
  rpassword = ""

  @Watch('user', {immediate: true})
  onUserChange(user?: User) {
    this.name = user?.name || ''
    this.pfp = user?.pfp || ''
    this.email = user?.email || ''
  }

  profileSubmit() {
    if (this.npassword !== this.rpassword) return alert("Password mismatch")
    if (!this.opassword) return alert("Old password must be supplied")
    fetch("/api/auth/profile", {
      method: "POST",
      body: JSON.stringify({
        name: this.name,
        email: this.email,
        pfp: this.pfp,
        password: this.opassword,
        ...(this.npassword ? {
          npassword: this.npassword
        } : {})
      }),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }
    }).then(res => res.json()).then((res) => {
      if (res.status === "success") {
        alert("Updated")
      } else alert(res.error)
    })
  }

  get user(): User | null {
    return this.$store.state.user
  }
}
</script>

<style scoped>
</style>
