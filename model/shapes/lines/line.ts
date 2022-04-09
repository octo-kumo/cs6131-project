import {Shape} from "~/model/shapes/shape"
import Vector from "~/model/entity_relation/vector"

export interface LineParam {
  a?: Vector
  b?: Vector
}

export type LineStyle = "curve" | "straight" | "axis"

export class Line extends Shape {
  a!: Vector
  b!: Vector

  constructor({a, b}: LineParam) {
    super()
    this.a = a ?? new Vector({})
    this.b = b ?? new Vector({})
  }

  draw(ctx: CanvasRenderingContext2D) {
    ctx.beginPath()
    ctx.moveTo(this.a.x, this.a.y)
    ctx.lineTo(this.b.x, this.b.y)
    ctx.closePath()
    ctx.stroke()
  }

  translated(x: number, y: number): Shape {
    return new Line({a: this.a.add(x, y), b: this.b.add(x, y)})
  }
}

export function lineUnderString(ctx: CanvasRenderingContext2D, text: string) {
  const textMetrics = ctx.measureText(text)
  return new Line({
    a: new Vector({x: -textMetrics.width / 2, y: textMetrics.actualBoundingBoxAscent}),
    b: new Vector({x: textMetrics.width / 2, y: textMetrics.actualBoundingBoxAscent})
  })
}
