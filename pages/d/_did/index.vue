<template>
  <div class="container">
    <h1 class="text-2xl">
      Diagram {{ $route.params.did }}
    </h1>
    <div v-if="diagram">
      <h1 v-text="diagram.did"/>
      <h3 v-text="diagram.name"/>
    </div>
    <div v-if="objects">
      <div
        v-for="(o, i) in objects"
        :key="i"
        class="p-4 border border-black rounded m-2"
      >
        {{ JSON.stringify(o) }}
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import {Component, Vue} from 'nuxt-property-decorator'
import {get} from "~/plugins/api"

@Component
export default class diagramView extends Vue {
  name = 'diagramView'
  diagram = null
  objects = []

  mounted() {
    get(`/api/d/${this.$route.params.did}`).then(res => this.diagram = res.diagram)
    get(`/api/d/${this.$route.params.did}/o`).then(res => this.objects = res.objects)
  }
}
</script>

<style scoped>
</style>
