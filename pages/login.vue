<template>
  <form
    v-if="isLogin"
    class="max-w-md mx-auto bg-slate-100 rounded-xl border-2 p-4 mt-2"
    @submit.prevent="loginSubmit()"
  >
    <h1 class="text-center text-2xl">
      Login
    </h1>
    <div class="grid grid-cols-2 m-2">
      <label class="text-right px-4">Email</label>
      <input v-model="email" name="email" placeholder="user@example.com" required>
    </div>
    <div class="grid grid-cols-2 m-2">
      <label class="text-right px-4">Password</label>
      <input
        v-model="password"
        name="password"
        type="password"
        minlength="8"
        placeholder="Password"
        required
      >
    </div>
    <div class="grid grid-cols-2 gap-4">
      <button class="btn" @click="isLogin=false">
        Register
      </button>
      <button class="btn success" type="submit">
        Login
      </button>
    </div>
  </form>
  <form v-else class="max-w-md mx-auto my-2 bg-slate-100 rounded-xl border-2 p-4" @submit.prevent="registerSubmit()">
    <h1 class="text-center text-2xl">
      Register
    </h1>
    <div class="grid grid-cols-2 m-2">
      <label class="text-right px-4">Name</label>
      <input v-model="name" name="name" placeholder="Your Name" required>
    </div>
    <div class="grid grid-cols-2 m-2">
      <label class="text-right px-4">Email</label>
      <input v-model="email" name="email" placeholder="user@example.com" required>
    </div>
    <div class="grid grid-cols-2 m-2">
      <label class="text-right px-4">Password</label>
      <input
        v-model="password"
        name="password"
        type="password"
        minlength="8"
        placeholder="Password"
        required
      >
    </div>
    <div class="grid grid-cols-2 m-2">
      <label class="text-right px-4">Repeat</label>
      <input
        v-model="rpassword"
        name="password"
        type="password"
        minlength="8"
        placeholder="Repeat Password"
        required
      >
    </div>
    <div class="grid m-2">
      <div class="grid grid-cols-2 gap-4">
        <button class="btn" @click="isLogin=true">
          Login
        </button>
        <button class="btn success" type="submit">
          Register
        </button>
      </div>
    </div>
  </form>
</template>

<script lang="ts">
import {Component, Vue, Watch} from 'nuxt-property-decorator'
import User from "~/model/user"

@Component
export default class login extends Vue {
  name = ''
  isLogin = true
  email = ""
  password = ""
  rpassword = ""

  get user() {
    return this.$store.state.user
  }

  @Watch('user', {immediate: true})
  onUserChange(user?: User) {
    if (user) this.$router.push("/")
  }

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
        console.log("success")
        this.$store.dispatch("populate")
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
