<template>
  <div class="max-w-3xl mx-auto p-2">
    <div
      v-if="user"
      class="overflow-hidden relative rounded-2xl hover:bg-gray-100 p-4 ring-blue-500 hover:ring-2"
    >
      <h1 class="text-4xl text-blue-500">
        <a :href="`/u/${user.uid}`" v-text="user.name"/>
      </h1>
      <h3
        class="text-lg uppercase absolute top-0 left-8 font-bold italic text-white select-none"
        v-text="user.name"
      />
      <h6 class="py-2">
        <span v-if="user.isAdmin" class="chip small">Admin</span>
      </h6>
      <h6 class="font-mono text-gray-500" v-text="user.uid"/>
      <h6><a class="text-blue-500 underline" :href="`mailto:${user.email}`" v-text="user.email"/></h6>
      <img class="absolute right-0 top-0 h-full max-w-xs" :src="user.pfp" alt="">
    </div>
  </div>
</template>

<script lang="ts">
import {Component, Vue} from 'nuxt-property-decorator'
import {get} from "~/plugins/api"
import {vuserEntity} from "~/types/data-types"

@Component
export default class userView extends Vue {
  name = 'userView'
  user: vuserEntity | null = null

  mounted() {
    get(`/api/u/${this.$route.params.uid}`).then(res => this.user = res.user)
  }
}
</script>

<style scoped>
</style>
