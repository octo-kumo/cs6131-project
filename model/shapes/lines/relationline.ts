import {Line} from "~/model/shapes/lines/line"
import ERObject from "~/model/entity_relation/object"
import {Relation} from "~/model/entity_relation/relationship"
import {fancyLine} from "~/model/shapes/lines/fancyline"
import Vector, {alwaysUp} from "~/model/entity_relation/vector"

export interface RelationLineParam {
  a: ERObject;
  b: ERObject;
  r: Relation;
}

export class RelationLine extends Line {
  private r: Relation
  private normal = new Vector({})

  constructor({a, b, r}: RelationLineParam) {
    super({a, b})
    this.r = r
  }

  predraw(ctx: CanvasRenderingContext2D) {
    this.setNormal()
    const a = this.getStart()
    const b = this.getEnd()
    if (this.r.total) {
      ctx.lineWidth = 4
      fancyLine(ctx, a, b, 'straight')
      ctx.stroke()

      ctx.lineWidth = 3
      ctx.strokeStyle = "#fff"
      fancyLine(ctx, a, b, 'straight')
      ctx.stroke()
      ctx.strokeStyle = "#000"
      ctx.lineWidth = 1
    } else {
      fancyLine(ctx, a, b, 'straight')
      ctx.stroke()
    }
  }

  draw(ctx: CanvasRenderingContext2D) {
    this.setNormal()
    const a = this.getStart()
    const b = this.getEnd()
    const d = b.minus(a)
    const c = a.add(b).div(2)
    if (this.r.role) {
      const mid = b.add(a).div(2)
      const angle = alwaysUp(d.angle() - Math.PI / 2) + Math.PI / 2
      ctx.save()
      ctx.translate(mid.x, mid.y)
      ctx.rotate(angle)
      ctx.fillStyle = "#fff"
      const metrics = ctx.measureText(this.r.role)
      const w = metrics.width
      const h = metrics.actualBoundingBoxAscent + metrics.actualBoundingBoxDescent
      ctx.fillRect(-w / 2, -h / 2, w, h)
      ctx.fillStyle = "#000"
      ctx.fillText(this.r.role, 0, 0)
      ctx.restore()
    }
    if (this.r.cardinality) {
      const dist = 10
      const angle = alwaysUp(d.angle() + Math.PI / 2) +
        ((this.r.uniqueIndex || 0) % 2 === (d.x >= 0 ? 1 : 0) ? 0 : Math.PI)
      c.incre(Math.cos(angle) * dist, Math.sin(angle) * dist)
      ctx.fillText(this.r.cardinality, c.x, c.y)
    }
  }

  getStart() {
    return this.a.add(this.normal.multi(this.bouncingIndex(this.r.uniqueIndex ?? 0) + ((this.r.dupeCount ?? 0) % 2 === 0 ? -0.5 : 0)))
  }

  getEnd() {
    return this.b.add(this.normal.multi(this.bouncingIndex(this.r.uniqueIndex ?? 0) + ((this.r.dupeCount ?? 0) % 2 === 0 ? -0.5 : 0)))
  }

  setNormal() {
    this.normal.set(this.b.minus(this.a).rot90().norm().scale(15))
  }

  bouncingIndex(i: number) {
    return i % 2 === 0 ? -Math.floor(i / 2) : Math.floor(i / 2) + 1
  }
}
