<template>
  <canvas id="editor" ref="editor"/>
</template>

<script lang="ts">

import {Component, Model, Ref, Vue} from 'nuxt-property-decorator'
import ERObject from "~/model/entity_relation/object"
import Vector from "~/model/entity_relation/vector";

function PIXEL_RATIO() {
  const ctx: any = document.createElement("canvas").getContext("2d")
  const dpr = window.devicePixelRatio || 1
  const bsr = ctx.webkitBackingStorePixelRatio ||
    ctx.mozBackingStorePixelRatio ||
    ctx.msBackingStorePixelRatio ||
    ctx.oBackingStorePixelRatio ||
    ctx.backingStorePixelRatio || 1

  return dpr / bsr
}

@Component
export default class EREditor extends Vue {
  @Ref("editor") editor!: HTMLCanvasElement
  @Model('change', {type: Array, default: () => []}) nodes!: ERObject[]
  name = 'er-editor'

  ratio = 0
  lastCalledTime = 0
  fps = 0

  origin = new Vector({x: 200, y: 200})

  mounted() {
    this.ratio = PIXEL_RATIO()
    this.paint()
  }

  paint() {
    const ctx = this.editor.getContext("2d")
    if (!ctx) return
    this.setupCanvas(this.editor, ctx, window.innerWidth, window.innerHeight)
    this.drawInfo(ctx)
    ctx.translate(this.origin.x, this.origin.y)
    ctx.save()
    this.nodes.forEach((n) => {
      n.predraw(ctx)
      n.draw(ctx)
    })
    this.calculateFPS()
    requestAnimationFrame(() => this.paint())
  }

  setupCanvas(canvas: HTMLCanvasElement, ctx: CanvasRenderingContext2D, w: number, h: number) {
    canvas.width = w * this.ratio
    canvas.height = h * this.ratio
    canvas.style.width = w + "px"
    canvas.style.height = h + "px"
    ctx.setTransform(this.ratio, 0, 0, this.ratio, 0, 0)
    ctx.strokeStyle = "#000"
    ctx.font = "plain 24px serif"
    ctx.moveTo(0, 0)
    ctx.lineTo(w, h)
    ctx.lineTo(w, 0)
    ctx.lineTo(0, h)
    ctx.closePath()
    ctx.stroke()
  }

  drawInfo(ctx: CanvasRenderingContext2D) {
    ctx.fillText("FPS: " + this.fps.toFixed(2), 10, 80)
    ctx.fillText("Ratio: " + this.ratio, 10, 100)
    ctx.fillText("Entities: " + this.nodes.length, 10, 120)
  }

  calculateFPS() {
    const delta = (performance.now() - this.lastCalledTime) / 1000
    this.lastCalledTime = performance.now()
    this.fps = 1 / delta
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
