<template>
  <div class="container">
    <form
      v-if="isLogin"
      class="max-w-md mx-auto my-2 bg-slate-100 rounded-xl border-2 p-4"
      @submit.prevent="loginSubmit()"
    >
      <h1 class="text-center text-2xl">
        Login
      </h1>
      <div class="grid grid-cols-2 m-2">
        <label class="text-right px-4">Email</label>
        <input v-model="email" name="email" placeholder="user@example.com">
      </div>
      <div class="grid grid-cols-2 m-2">
        <label class="text-right px-4">Password</label>
        <input v-model="password" name="password" type="password" minlength="8" placeholder="Password">
      </div>
      <div class="grid grid-cols-2 gap-4">
        <button class="rounded-xl px-3 py-1 bg-green-500 text-white " type="submit">
          Login
        </button>
        <button class="rounded-xl px-3 py-1 bg-yellow-500 text-white" @click="isLogin=false">
          Goto Register
        </button>
      </div>
    </form>
    <form v-else class="max-w-md mx-auto my-2 bg-slate-100 rounded-xl border-2 p-4" @submit.prevent="registerSubmit()">
      <h1 class="text-center text-2xl">
        Register
      </h1>
      <div class="grid grid-cols-2 m-2">
        <label class="text-right px-4">Name</label>
        <input v-model="name" name="name" placeholder="Your Name">
      </div>
      <div class="grid grid-cols-2 m-2">
        <label class="text-right px-4">Email</label>
        <input v-model="email" name="email" placeholder="user@example.com">
      </div>
      <div class="grid grid-cols-2 m-2">
        <label class="text-right px-4">Password</label>
        <input v-model="password" name="password" type="password" minlength="8" placeholder="Password">
      </div>
      <div class="grid grid-cols-2 m-2">
        <label class="text-right px-4">Repeat</label>
        <input v-model="rpassword" name="password" type="password" minlength="8" placeholder="Repeat Password">
      </div>
      <div class="grid m-2">
        <div class="grid grid-cols-2 gap-4">
          <button class="rounded-xl px-3 py-1 bg-red-500 text-white" @click="isLogin=true">
            Goto Login
          </button>
          <button class="rounded-xl px-3 py-1 bg-green-500 text-white" type="submit">
            Register
          </button>
        </div>
      </div>
    </form>
  </div>
</template>

<script lang="ts">
import {Component, Vue} from 'nuxt-property-decorator'

@Component
export default class login extends Vue {
  name = ''
  isLogin = true
  email = ""
  password = ""
  rpassword = ""

  loginSubmit() {
    fetch("/api/auth/login", {
      method: "POST",
      body: JSON.stringify({email: this.email, password: this.password}),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }
    }).then(res => res.json()).then((res) => {
      if (res.status === "success") {
        this.$router.push("/")
      } else alert(res.error)
    })
  }

  registerSubmit() {
    if (this.rpassword !== this.password) return alert("Password mismatch")
    fetch("/api/auth/register", {
      method: "POST",
      body: JSON.stringify({
        name: this.name,
        email: this.email,
        password: this.password
      }),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }
    }).then(res => res.json()).then((res) => {
      if (res.status === "success") {
        this.isLogin = true
        alert("Please login")
      } else alert(res.error)
    })
  }
}
</script>

<style scoped>
</style>
