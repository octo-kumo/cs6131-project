<template>
  <div>
    <canvas id="editor" ref="editor"/>
  </div>
</template>

<script lang="ts">
import {Component, Ref, Vue} from 'nuxt-property-decorator'
import ERObject from "~/model/entity_relation/object"
import Entity from "~/model/entity_relation/entity"

@Component
export default class EREditor extends Vue {
  @Ref("editor") editor!: HTMLCanvasElement
  name = 'EREditor'
  nodes: ERObject[] = []

  mounted() {
    this.nodes.push(new Entity({name: "Hello"}))

    this.paint()
  }

  paint() {
    const ctx = this.editor.getContext("2d")
    if (!ctx) return
    ctx.canvas.width = window.innerWidth
    ctx.canvas.height = window.innerHeight
    this.nodes.forEach((n) => {
      console.log("rendering")
      n.paint(ctx)
    })
  }
}
</script>

<style scoped>
#editor {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
}
</style>
