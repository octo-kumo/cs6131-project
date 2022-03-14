import {Shape} from "~/model/shapes/shape"

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
    ctx.ellipse(this.x, this.y, this.width / 2, this.height / 2, 0, 0, 0)
  }

  translated(x: number, y: number): Shape {
    return new Ellipse2D(x + this.x, y + this.y, this.width, this.height)
  }
}
