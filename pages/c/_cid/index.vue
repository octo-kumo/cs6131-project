<template>
  <div class="container">
    <h1 class="text-2xl">
      Container {{ $route.params.cid }}
    </h1>
    <div v-if="container">
      <h1 v-text="container.cid"></h1>
      <h3 v-text="container.name"></h3>
    </div>
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
    </div>
  </div>
</template>

<script lang="ts">
import {Component, Vue} from 'nuxt-property-decorator'
import {get} from "~/plugins/api"

@Component
export default class containerView extends Vue {
  name = 'containerView'
  container = null
  diagrams = []

  mounted() {
    get(`/api/c/${this.$route.params.cid}`).then(res => this.container = res.container)
    get(`/api/c/${this.$route.params.cid}/d`).then(res => this.diagrams = res.diagrams)
  }
}
</script>

<style scoped>
</style>
