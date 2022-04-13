<template>
  <nav
    class="flex fixed w-full items-center justify-between px-6 h-16 bg-white text-gray-700 border-b border-gray-200 z-10"
  >
    <div class="flex items-center">
      <button class="mr-2" aria-label="Open Menu" @click="isOpen=!isOpen">
        <svg
          fill="none"
          stroke="currentColor"
          stroke-linecap="round"
          stroke-linejoin="round"
          stroke-width="2"
          viewBox="0 0 24 24"
          class="w-8 h-8"
        >
          <path d="M4 6h16M4 12h16M4 18h16"/>
        </svg>
      </button>
      <h1 class="text-2xl">
        Evil ER
      </h1>
    </div>
    <div class="flex items-center">
      <div class="cursor-pointer w-16 h-16 hover:bg-gray-200 flex items-center justify-center" @click="isOpen=true">
        <img class="rounded-full w-10 h-10 object-cover" :src="(user&&user.pfp)||'/images/guest.png'" alt="avatar">
      </div>
    </div>
    <transition
      enter-class="opacity-0"
      enter-active-class="ease-out transition-medium"
      enter-to-class="opacity-100"
      leave-class="opacity-100"
      leave-active-class="ease-out transition-medium"
      leave-to-class="opacity-0"
    >
      <div
        v-show="isOpen"
        class="z-10 fixed inset-0 transition-opacity"
        @keydown.esc="isOpen = false"
      >
        <div
          class="absolute inset-0 bg-black opacity-50"
          tabindex="0"
          @click="isOpen = false"
        />
      </div>
    </transition>
    <aside
      class="transform top-0 left-0 w-64 bg-white fixed h-full overflow-auto ease-in-out transition-all duration-300 z-30"
      :class="isOpen ? 'translate-x-0' : '-translate-x-full'"
    >
      <nuxt-link to="/">
        <div class="px-2 hover:bg-gray-100">
          <h1 class="font-bold text-2xl">
            Evil ER
          </h1>
          <h6 class="uppercase font-thin text-xs -mt-1">
            Entity Relationship Diagrams
          </h6>
        </div>
      </nuxt-link>
      <hr class="my-1">
      <div class="user-profile mx-2 mb-2 rounded flex overflow-hidden hover:bg-gray-100">
        <img class="w-16 h-16 object-cover" :src="(user&&user.pfp)||'/images/guest.png'" alt="avatar">
        <div class="flex-grow">
          <h1 class="text-2xl px-2 py-0.5" v-text="user&&user.name||'Guest'"/>
          <h3 class="text-sm py-1 px-2" v-text="user&&user.email||'anonymous'"/>
        </div>
      </div>
      <div class="grid grid-cols-2 gap-2 m-1 rounded overflow-hidden">
        <nuxt-link
          v-if="user"
          to="/profile"
          class="btn primary"
        >
          Profile
        </nuxt-link>
        <nuxt-link
          v-if="user"
          to="/logout"
          class="btn danger"
        >
          Logout
        </nuxt-link>
        <nuxt-link
          v-else
          to="/login"
          class="btn success"
        >
          Login
        </nuxt-link>
      </div>
      <hr class="my-1">
      <div class="mx-2 my-1">
        <nuxt-link to="/c" class="text-lg px-2" active-class="text-blue-500" exact>
          Containers
        </nuxt-link>
        <ul>
          <li v-for="(c,i) in containers" :key="i" class="w-full p-0.5">
            <nuxt-link
              :to="`/c/${c.cid}`"
              active-class="bg-blue-500 text-white hover:bg-blue-700"
              class="rounded hover:bg-gray-100 block p-1 ring-1 ring-gray-200 px-2"
            >
              {{ c.name }}
            </nuxt-link>
          </li>
        </ul>
      </div>
      <hr class="my-1">
      <div class="mx-2 my-1">
        <nuxt-link
          :to="`/u`"
          active-class="bg-blue-500 text-white hover:bg-blue-700"
          class="rounded hover:bg-gray-100 block p-1 ring-1 ring-gray-200 px-2"
        >
          Users
        </nuxt-link>
      </div>
    </aside>
  </nav>
</template>

<script lang="ts">
import {Component, Vue, Watch} from "nuxt-property-decorator"
import User from "~/model/user"

@Component
export default class NavBar extends Vue {
  isOpen = false

  @Watch("isOpen", {immediate: true})
  onOpenChange(isOpen: boolean) {
    if (process.client) {
      if (isOpen) document.body.style.setProperty("overflow", "hidden")
      else document.body.style.removeProperty("overflow")
    }
  }

  get user(): User {
    return this.$store.state.user
  }

  get containers() {
    return this.$store.state.containers || []
  }
}
</script>
