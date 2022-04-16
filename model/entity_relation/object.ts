import Vector, {VectorParams} from '@/model/entity_relation/vector'
import Attribute from '@/model/entity_relation/attribute'
import {Shape} from "@/model/shapes/shape"
import {Rectangle2D} from "@/model/shapes/rectangle2d"
import {ObjectType} from "~/types/types";

export interface ObjectParams extends VectorParams {
  id: string;
  name: string;
  weak?: boolean;
  _type: ObjectType;
}

export const WIDTH = 100
export const HEIGHT = 40
export default class ERObject extends Vector {
  _trueWidth = WIDTH
  _type: ObjectType
  id: string
  name: string
  weak: boolean
  attributes: Attribute[] = []
  highlight = false

  constructor({id, name, weak, x, y, _type}: ObjectParams) {
    super({x, y})
    this._type = _type
    this.id = id
    this.name = name
    this.weak = weak ?? false
  }

  predraw(ctx: CanvasRenderingContext2D) {
    ctx.save()
    ctx.translate(this._x, this._y)
    this.prepaint(ctx)
    ctx.restore()
  }

  draw(ctx: CanvasRenderingContext2D) {
    ctx.save()
    ctx.translate(this._x, this._y)
    this.paint(ctx)
    ctx.restore()
  }

  prepaint(ctx: CanvasRenderingContext2D) {
    this._trueWidth = this.updateTrueWidth(ctx)
    this.attributes.forEach(a => a.predraw(ctx))
  }

  paint(ctx: CanvasRenderingContext2D) {
    this._trueWidth = this.updateTrueWidth(ctx)
    this.attributes.forEach(a => a.draw(ctx))
    this.drawShape(ctx)
    ctx.fillText(this.name, 0, 0)
  }

  drawShape(ctx: CanvasRenderingContext2D, shape?: Shape) {
    if (shape) {
      shape.draw(ctx)
    } else {
      this.drawShape(ctx, this.getShape())
      if (this.weak) this.drawShape(ctx, this.getShape(this._trueWidth - 6, HEIGHT - 6))
    }
    ctx.fillStyle = "#fff"
    ctx.fill()
    ctx.fillStyle = "#000"
    ctx.stroke()
  }

  getShape(width?: number, height?: number): Shape {
    if (width && height) return new Rectangle2D(-width / 2, -height / 2, width, height)
    else return this.getShape(this._trueWidth, HEIGHT)
  }

  getShapeWorld(): Shape {
    return this.getShape().translated(this.x, this.y)
  }

  updateTrueWidth(ctx: CanvasRenderingContext2D) {
    return Math.max(WIDTH, ctx.measureText(this.name).width * 1.05)
  }

  toString() {
    return `[${this.name} ${super.toString()}]`
  }
}
