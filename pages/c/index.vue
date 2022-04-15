<template>
  <div class="max-w-3xl mx-auto p-2">
    <h1 class="text-2xl">
      Containers
    </h1>
    <div class="grid lg:grid-cols-3 md:grid-cols-2 sm:grid-cols-1 grid-flow-row-dense">
      <div
        v-for="(c, i) in containers"
        :key="i"
        class="p-4 border border-black rounded m-2"
      >
        <nuxt-link :to="`/c/${c.cid}`">
          <pre class="text-blue-500" v-text="c.cid"/>
        </nuxt-link>
        <h1 v-text="c.name"/>
      </div>
      <nuxt-link
        :to="`/n/container`"
        class="p-4 border border-black rounded m-2 hover:text-blue-500 hover:border-blue-500"
      >
        <h1 class="text-4xl text-center">
          +
        </h1>
      </nuxt-link>
    </div>
  </div>
</template>

<script lang="ts">
import {Component, Vue} from 'nuxt-property-decorator'

@Component
export default class containersView extends Vue {
  name = 'containersView'

  get containers() {
    return this.$store.state.containers || []
  }
}
</script>

<style scoped>
</style>
