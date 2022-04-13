import {Shape} from "~/model/shapes/shape"
import Vector from "~/model/entity_relation/vector"

export class Ellipse2D extends Shape {
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
    ctx.ellipse(this.x + this.width / 2, this.y + this.height / 2, this.width / 2, this.height / 2, 0, 0, 2 * Math.PI)
    ctx.closePath()
    ctx.stroke()
  }

  translated(x: number, y: number): Shape {
    return new Ellipse2D(x + this.x, y + this.y, this.width, this.height)
  }

  contains(point: Vector): boolean {
    const X = point.x - this.x - this.width / 2
    const Y = point.y - this.y - this.height / 2
    return X * X / this.width / this.width + Y * Y / this.height / this.height < 0.25
  }
}
