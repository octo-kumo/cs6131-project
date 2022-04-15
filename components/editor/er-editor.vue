<template>
  <canvas
    id="editor"
    ref="editor"
    @drop.prevent="dropped"
    @dragenter.prevent="checkDrop"
    @dragover.prevent="checkDrop"

    @wheel="scrolled"
    @click="clicked"
    @mousedown="mouseDown"
    @mouseup="mouseUp"
    @mousemove="mouseMove"
  />
</template>

<script lang="ts">

import {Component, Model, Prop, Ref, Vue} from 'nuxt-property-decorator'
import {Socket} from "socket.io-client"
import {uuid} from "uuidv4"
import ERObject from "~/model/entity_relation/object"
import Vector from "~/model/entity_relation/vector"
import client from "~/socket/client"
import {objectEntity} from "~/types/data-types"
import {ObjectType} from "~/types/types"
import {getType} from "~/model/entity_relation";

function flatten(nodes: ERObject[]): ERObject[] {
  return [...nodes, ...nodes.flatMap(n => flatten(n.attributes))]
}

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
  @Prop({type: String}) did!: string
  @Model('change', {type: Array, default: () => []}) nodes!: ERObject[]
  name = 'er-editor'

  io: Socket | null = null
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

  selected: ERObject | null = null

  mounted() {
    this.io = client()
    console.log(this.io)
    this.io.connect()
    this.io.on("update.object", (obj: Partial<objectEntity>) => {
      console.log("update.object", obj)
      if (obj.did !== this.did) return
      const node = flatten(this.nodes).find(o => o.id === obj.id)
      if (!node) return
      Object.assign(node, obj)
    })
    this.io.on("connect", () => {
      console.log("connected")
    })
    this.ratio = PIXEL_RATIO()
    this.paint()
  }

  unmounted() {
    this.io?.disconnect()
  }

  paint() {
    if (!this.editor) return
    const ctx = this.editor.getContext("2d")
    if (!ctx) return
    this.setupCanvas(this.editor, ctx, window.innerWidth, window.innerHeight)
    ctx.save()
    this.nodes.forEach(n => n.predraw(ctx))
    this.nodes.forEach(n => n.draw(ctx))

    if (this.selected) {
      ctx.strokeStyle = '#f00'
      this.selected.getShapeWorld().draw(ctx)
      ctx.strokeStyle = '#000'
    }

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
    ctx.fillText(`FPS: ${this.fps.toFixed(2)}`, 10, 80)
    ctx.fillText(`Scale: ${this.scale.toFixed(2)}`, 10, 90)
    ctx.fillText(`Origin: ${this.origin.x.toFixed(2)}, ${this.origin.y.toFixed(2)}`, 10, 100)
    ctx.fillText(`Screen: (${window.innerWidth}, ${window.innerHeight}) x${this.ratio}→ (${ctx.canvas.width}, ${ctx.canvas.height})`, 10, 110)
    ctx.fillText(`Entities: ${this.nodes.length}`, 10, 120)
    ctx.fillText(`state = ${this.mouseState}`, 10, 140)
    if (this.selected) ctx.fillText(`selected = ${this.selected}`, 10, 150)
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
    this.mousePos.set(e.x, e.y)
    this.mouseWorld.set(this.unproject(this.mousePos))
    if (e.button === LEFT_BUTTON) {
      if (this.selected) {
        this.selected.highlight = false
        this.selected = null
      }
      const flat = flatten(this.nodes)
      for (const e1 of flat) {
        if (e1.getShapeWorld().contains(this.mouseWorld)) {
          (this.selected = e1).highlight = true
          break
        }
      }

      if (!this.selected) {
        this.mouseState = "empty"
        this.panStart.set(this.origin)
        this.mouseStart.set(this.mousePos)
      } else {
        this.mouseState = "dragging"
        this.mouseStart.set(this.mouseWorld.minus(this.selected))
      }
    }
  }

  mouseUp(e: MouseEvent) {
    this.mousePos.set(e.x, e.y)
    this.mouseWorld.set(this.unproject(this.mousePos))
    if (this.mouseState === "dragging" && this.selected) {
      this.io?.emit("updateObject", {
        did: this.did,
        id: this.selected.id,
        x: this.selected.x,
        y: this.selected.y
      })
    }
    this.mouseState = ""
  }

  mouseMove(e: MouseEvent) {
    this.mousePos.set(e.x, e.y)
    this.mouseWorld.set(this.unproject(this.mousePos))
    if (this.mouseState === "empty") { // Pan camera
      this.origin.set(this.panStart.add(this.mousePos.minus(this.mouseStart).div(this.scale)))
    } else if (this.mouseState === "dragging" && this.selected) {
      this.selected.set(this.mouseWorld.minus(this.mouseStart))
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

  /**
   * Dragging
   */

  checkDrop(e: DragEvent) {
    // console.log(e, e.dataTransfer)
  }

  dropped(e: DragEvent) {
    console.log(e, e.dataTransfer)
    console.log(e.dataTransfer?.getData('type'))
    const pos = this.unproject(new Vector({x: e.x, y: e.y}))
    const obj = new (getType(e.dataTransfer?.getData('type') as ObjectType))({
      id: uuid(),
      x: pos.x,
      y: pos.y,
      name: "Unnamed"
    })
    this.nodes.push(obj)
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
