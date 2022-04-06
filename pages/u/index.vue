<template>
  <div class="container">
    <h1 class="text-2xl">
      Users
    </h1>
    <div>
      <div
        v-for="(u, i) in users"
        :key="i"
        class="flex rounded-xl m-2 overflow-hidden ring-1 ring-gray-200 hover:ring-blue-500 hover:bg-blue-100"
      >
        <img class="object-cover w-16 h-16" :src="u.pfp||'/images/guest.png'" alt=""/>
        <nuxt-link :to="`/u/${u.uid}`" class="p-2 px-4 grow">
          <pre class="text-blue-500" v-text="u.uid"/>
          <h1 v-text="u.name"/>
        </nuxt-link>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import {Component, Vue} from 'nuxt-property-decorator'

@Component
export default class usersView extends Vue {
  name = 'usersView'

  get users() {
    return this.$store.state.users || []
  }
}
</script>

<style scoped>
</style>
