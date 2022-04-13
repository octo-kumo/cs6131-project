import {Shape} from "~/model/shapes/shape"
import Vector from "~/model/entity_relation/vector"

export class Rectangle2D extends Shape {
  x: number
  y: number
  width: number
  height: number

  constructor(x: number, y: number, width: number, height: number) {
    super()
    this.x = x
    this.y = y
    this.width = width
    this.height = height
  }

  draw(ctx: CanvasRenderingContext2D): void {
    ctx.beginPath()
    ctx.rect(this.x, this.y, this.width, this.height)
    ctx.closePath()
    ctx.stroke()
  }

  translated(x: number, y: number): Shape {
    return new Rectangle2D(x + this.x, y + this.y, this.width, this.height)
  }

  contains(point: Vector): boolean {
    return point.x > this.x && point.x < this.x + this.width && point.y > this.y && point.y < this.y + this.height
  }
}
