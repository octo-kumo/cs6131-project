<template>
  <canvas
    id="editor"
    ref="editor"
    tabindex="1"
    @drop.prevent="dropped"
    @dragenter.prevent="checkDrop"

    @dragover.prevent="checkDrop"
    @wheel="scrolled"
    @click="clicked"
    @mousedown="mouseDown"
    @mouseup="mouseUp"

    @mousemove="mouseMove"
    @keydown="keydown"
  />
</template>

<script lang="ts">

import {Component, Model, Prop, Ref, Vue} from 'nuxt-property-decorator'
import {Socket} from "socket.io-client"
import {v4 as uuidv4} from "uuid"
import ERObject, {flatten} from "~/model/entity_relation/object"
import Vector from "~/model/entity_relation/vector"
import client from "~/socket/client"
import {attributeEntity, objectEntity, relatesEntity, specializationEntity} from "~/types/data-types"
import {ObjectType} from "~/types/types"
import {getType} from "~/model/entity_relation"
import Attribute from "~/model/entity_relation/attribute"
import Relationship, {Relation, relationToObj} from "~/model/entity_relation/relationship"
import Specialization from "~/model/entity_relation/specialization"
import {
  CREATE_OBJECT, CREATE_RELATE, DELETE_OBJECT, DELETE_RELATE,
  OBJECT_CREATED, OBJECT_DELETED, OBJECT_UPDATED,
  RELATE_CREATED, RELATE_DELETED, RELATE_UPDATED,
  UPDATE_OBJECT, UPDATE_RELATE
} from "~/api/socket.events"
import Entity from "~/model/entity_relation/entity"
import User from "~/model/user"

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

  selected: ERObject | Attribute | Relationship | Specialization | null = null

  mounted() {
    this.io = client()
    this.io.connect()
    this.io.on(OBJECT_CREATED, (obj: objectEntity) => this.$emit(OBJECT_CREATED, obj))
    this.io.on(OBJECT_UPDATED, (obj: Partial<objectEntity>) => this.$emit(OBJECT_UPDATED, obj))
    this.io.on(OBJECT_DELETED, (obj: objectEntity) => this.$emit(OBJECT_DELETED, obj))

    this.io.on(RELATE_CREATED, (obj: relatesEntity) => this.$emit(RELATE_CREATED, obj))
    this.io.on(RELATE_UPDATED, (obj: relatesEntity) => this.$emit(RELATE_UPDATED, obj))
    this.io.on(RELATE_DELETED, (obj: relatesEntity) => this.$emit(RELATE_DELETED, obj))

    this.io.on("connect", () => this.io?.emit('requestRoom', "diagram_" + this.did))
    this.ratio = PIXEL_RATIO()
    this.paint()
  }

  emitUpdateEvent(obj: ERObject, fields?: (keyof (objectEntity & attributeEntity & specializationEntity))[]) {
    let payload = obj.toObject(this.did)
    if (fields) {
      fields = [...fields, 'id', 'did']
      const newPayload: objectEntity = {} as objectEntity
      // @ts-ignore
      for (const f of fields) newPayload[f] = payload[f]
      payload = newPayload
    }
    this.io?.emit(UPDATE_OBJECT, payload)
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
    ctx.translate(0.5, 0.5)
    ctx.scale(this.scale, this.scale)
    ctx.translate(this.origin.x, this.origin.y)
    ctx.fillRect(this.mouseWorld.x, this.mouseWorld.y, 10, 10)

    ctx.textAlign = "center"
    ctx.textBaseline = 'middle'
  }

  drawInfo(ctx: CanvasRenderingContext2D) {
    ctx.fillText(`fps: ${this.fps.toFixed(2)}`, 10, 80)
    ctx.fillText(`scale: ${this.scale.toFixed(2)}`, 10, 90)
    ctx.fillText(`origin: ${this.origin.x.toFixed(2)}, ${this.origin.y.toFixed(2)}`, 10, 100)
    ctx.fillText(`screen: (${window.innerWidth}, ${window.innerHeight}) x${this.ratio}→ (${ctx.canvas.width}, ${ctx.canvas.height})`, 10, 110)
    ctx.fillText(`entities: ${this.nodes.length}`, 10, 120)
    ctx.fillText(`state = ${this.mouseState}`, 10, 140)
    if (this.selected) ctx.fillText(`selected = ${this.selected}`, 10, 150)
    ctx.fillText(`socket: ${this.io && this.io.active ? 'active' : 'inactive'}, ${this.io && this.io.connected ? 'connected' : 'disconnected'}`, 10, 170)
    if (!this.canEdit) ctx.fillText(`view-only`, 10, 180)
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
    this.mousePos.set(e.x, e.y)
    this.mouseWorld.set(this.unproject(this.mousePos))
    if (e.button === LEFT_BUTTON) {
      if (!this.canEdit) return
      const element = e.currentTarget as (EventTarget & { clicks?: number, lastClick?: number })
      if (!element) return
      if ((element.lastClick ?? 0) - (element.lastClick = Date.now()) > -200) {
        element.clicks = (element.clicks || 0) + 1
      } else element.clicks = 1
      if (element.clicks >= 2) {
        element.clicks = 0
        if (!this.selected) {
          this.nodes.push(this.selected = new Entity({
            _type: 'entity',
            id: uuidv4(),
            name: "Unnamed",
            x: this.mouseWorld.x,
            y: this.mouseWorld.y
          }))
          this.io?.emit(CREATE_OBJECT, this.selected.toObject(this.did))
        }
      }
    }
    //
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
    if (this.selected && this.canEdit) {
      this.emitUpdateEvent(this.selected, ['x', 'y'])
      flatten(this.selected.attributes).forEach(e => this.emitUpdateEvent(e, ['x', 'y']))
    }
    this.mouseState = ""
  }

  mouseMove(e: MouseEvent) {
    this.mousePos.set(e.x, e.y)
    this.mouseWorld.set(this.unproject(this.mousePos))
    if (this.mouseState === "empty") { // Pan camera
      this.origin.set(this.panStart.add(this.mousePos.minus(this.mouseStart).div(this.scale)))
    } else if (this.mouseState === "dragging" && this.selected) {
      if (!this.canEdit) return
      this.selected.set(this.mouseWorld.minus(this.mouseStart))
    }
    // console.log("move", e)
  }

  keydown(e: KeyboardEvent) {
    if (!this.canEdit) return
    switch (e.key) {
      case 'Backspace':
        if (this.selected && (e.metaKey || e.ctrlKey)) this.deleteNode(this.selected)
        break
    }
    console.log(e)
  }

  scrolled(e: WheelEvent) {
    const mouse = new Vector({x: e.x, y: e.y})
    const a = mouse.divide(this.scale)
    this.scale *= Math.pow(0.9, e.deltaY / 300)
    const b = mouse.divide(this.scale)
    this.origin.incre(b.minus(a))
  }

  deleteNode(node: ERObject) {
    if (!this.canEdit) return
    //
    for (const o of this.nodes.filter(n => n._type === 'relationship')) {
      const r = o as Relationship
      r.removeRelations(r.relations.filter(R => R.entity === node))
        ?.forEach((R: any) => this.notifyRelationDeleted(R as Relation, r))
    }
    this.io?.emit(DELETE_OBJECT, node.toObject(this.did))
  }

  notifyRelationCreated(r: Relation, relationship: Relationship) {
    this.io?.emit(CREATE_RELATE, relationToObj(r, this.did, relationship))
  }

  notifyRelationUpdated(r: Relation, relationship: ERObject, old?: string) {
    console.log(old, typeof old)
    this.io?.emit(UPDATE_RELATE, relationToObj(r, this.did, relationship, old))
  }

  notifyRelationDeleted(r: Relation, relationship: ERObject) {
    this.io?.emit(DELETE_RELATE, relationToObj(r, this.did, relationship))
  }

  /**
   * Dragging
   */

  checkDrop(e: DragEvent) {
    // console.log(e, e.dataTransfer)
  }

  dropped(e: DragEvent) {
    if (!this.canEdit) return
    console.log(e, e.dataTransfer)
    console.log(e.dataTransfer?.getData('type'))
    const pos = this.unproject(new Vector({x: e.x, y: e.y}))
    const Type = getType(e.dataTransfer?.getData('type') as ObjectType)
    if (!Type) return
    const obj = new Type({
      id: uuidv4(),
      x: pos.x,
      y: pos.y,
      name: "Unnamed",
      _type: e.dataTransfer?.getData('type') as ObjectType
    })
    this.io?.emit(CREATE_OBJECT, obj.toObject(this.did))
  }

  unproject(vector: Vector) {
    return vector.divide(this.scale).decre(this.origin)
  }

  get user(): User | null {
    return this.$store.state.user
  }

  get canEdit(): boolean {
    return !!this.user
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
