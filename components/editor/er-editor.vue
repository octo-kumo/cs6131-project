<template>
  <canvas
    id="editor"
    ref="editor"

    @wheel="scrolled"
    @click="clicked"
    @mousedown="mouseDown"
    @mouseup="mouseUp"
    @mousemove="mouseMove"
  />
</template>

<script lang="ts">

import {Component, Model, Ref, Vue} from 'nuxt-property-decorator'
import ERObject from "~/model/entity_relation/object"
import Vector from "~/model/entity_relation/vector"

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

const LEFT_BUTTON = 0
const WHEEL_BUTTON = 1
const RIGHT_BUTTON = 2

@Component
export default class EREditor extends Vue {
  @Ref("editor") editor!: HTMLCanvasElement
  @Model('change', {type: Array, default: () => []}) nodes!: ERObject[]
  name = 'er-editor'

  mouseState: '' | 'empty' | 'dragging' | 'selecting' = ''

  ratio = 0
  lastCalledTime = 0
  fps = 0

  origin = new Vector({x: 200, y: 200})
  scale = 1

  mousePos = new Vector({})
  mouseWorld = new Vector({})

  panStart = new Vector({})
  mouseStart = new Vector({})

  mounted() {
    this.ratio = PIXEL_RATIO()
    this.paint()
  }

  paint() {
    const ctx = this.editor.getContext("2d")
    if (!ctx) return
    this.setupCanvas(this.editor, ctx, window.innerWidth, window.innerHeight)
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
    ctx.strokeStyle = "#000"
    ctx.font = "plain 24px serif"
    ctx.setTransform(this.ratio, 0, 0, this.ratio, 0, 0)
    this.drawInfo(ctx)
    ctx.scale(this.scale, this.scale)
    ctx.translate(this.origin.x, this.origin.y)
    ctx.fillRect(this.mouseWorld.x, this.mouseWorld.y, 10, 10)

    ctx.textAlign = "center"
    ctx.textBaseline = 'middle'
  }

  drawInfo(ctx: CanvasRenderingContext2D) {
    ctx.fillText("FPS: " + this.fps.toFixed(2), 10, 80)
    ctx.fillText("Scale: " + this.scale.toFixed(2), 10, 90)
    ctx.fillText("PX Ratio: " + this.ratio, 10, 100)
    ctx.fillText("Origin: " + this.origin.x + ", " + this.origin.y, 10, 110)
    ctx.fillText("Entities: " + this.nodes.length, 10, 120)
    ctx.fillText("state = " + this.mouseState, 10, 140)
  }

  calculateFPS() {
    const delta = (performance.now() - this.lastCalledTime) / 1000
    this.lastCalledTime = performance.now()
    this.fps = 1 / delta
  }

  /**
   * Mouse Event Handlers
   */
  clicked(e: MouseEvent) {
    console.log("click", e)
  }

  mouseDown(e: MouseEvent) {
    console.log("down", e)
    this.mousePos.set(e.x, e.y)
    this.mouseWorld.set(this.unproject(this.mousePos))
    if (e.button === LEFT_BUTTON) {
      this.mouseState = "empty"
      this.panStart.set(this.origin)
      this.mouseStart.set(this.mousePos)
    }
  }

  mouseUp(e: MouseEvent) {
    this.mouseState = ""
    console.log("up", e)
  }

  mouseMove(e: MouseEvent) {
    this.mousePos.set(e.x, e.y)
    this.mouseWorld.set(this.unproject(this.mousePos))
    if (this.mouseState === "empty") { // Pan camera
      this.origin.set(this.panStart.add(this.mousePos.minus(this.mouseStart).div(this.scale)))
    }
    // console.log("move", e)
  }

  scrolled(e: WheelEvent) {
    const mouse = new Vector({x: e.x, y: e.y})
    const a = mouse.divide(this.scale)
    this.scale *= Math.pow(0.9, e.deltaY / 300)
    const b = mouse.divide(this.scale)
    this.origin.incre(b.minus(a))
  }

  unproject(vector: Vector) {
    return vector.divide(this.scale).decre(this.origin)
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
