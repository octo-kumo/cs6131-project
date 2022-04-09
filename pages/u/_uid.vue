<template>
  <div class="container">
    <h1 class="text-2xl">
      User {{ $route.params.uid }}
    </h1>
    <div v-if="user">
      {{ JSON.stringify(user, null, 4) }}
    </div>
  </div>
</template>

<script lang="ts">
import {Component, Vue} from 'nuxt-property-decorator'
import {get} from "~/plugins/api"

@Component
export default class userView extends Vue {
  name = 'userView'
  user = null

  mounted() {
    get(`/api/u/${this.$route.params.uid}`).then(res => this.user = res.user)
  }
}
</script>

<style scoped>
</style>
