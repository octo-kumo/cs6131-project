import {Shape} from "~/model/shapes/shape"
import Vector from "~/model/entity_relation/vector"

export class Diamond extends Shape {
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
    ctx.moveTo(this.x, this.y + this.height / 2)
    ctx.lineTo(this.x + this.width / 2, this.y)
    ctx.lineTo(this.x + this.width, this.y + this.height / 2)
    ctx.lineTo(this.x + this.width / 2, this.y + this.height)
    ctx.closePath()
    ctx.stroke()
  }

  translated(x: number, y: number): Shape {
    return new Diamond(x + this.x, y + this.y, this.width, this.height)
  }

  contains(point: Vector): boolean {
    const X = this.x + this.width / 2 - point.x
    const Y = this.y + this.height / 2 - point.y
    return Math.max(Math.abs(X / this.width + Y / this.height), Math.abs(X / this.width - Y / this.height)) < 0.5
  }
}
