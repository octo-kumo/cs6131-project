import Vector from "~/model/entity_relation/vector"
import {LineStyle} from "~/model/shapes/lines/line"

export function fancyLine(ctx: CanvasRenderingContext2D, a: Vector, b: Vector, style: LineStyle) {
  const d = b.minus(a)
  const s = a.add(b)
  const horizontal = Math.abs(d.y) < Math.abs(d.x)
  const mid = horizontal ? s.x / 2 : s.y / 2
  ctx.beginPath()
  switch (style) {
    case 'straight':
      ctx.moveTo(a.x, a.y)
      ctx.lineTo(b.x, b.y)
      break
    case 'axis':
      moveTo(a.x, a.y)
      if (horizontal) {
        ctx.lineTo(mid, a.y)
        ctx.lineTo(mid, b.y)
      } else {
        ctx.lineTo(a.x, mid)
        ctx.lineTo(b.x, mid)
      }
      ctx.lineTo(b.x, b.y)
      break
    case 'curve':
      moveTo(a.x, a.y)
      if (horizontal) ctx.bezierCurveTo(mid, a.y, mid, b.y, b.x, b.y)
      else ctx.bezierCurveTo(a.x, mid, b.x, mid, b.x, b.y)
      break
  }
  ctx.closePath()
}
