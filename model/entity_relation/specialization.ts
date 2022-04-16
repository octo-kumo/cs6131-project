import Relationship, {RelationParam} from '@/model/entity_relation/relationship'
import Entity from '@/model/entity_relation/entity'
import {Shape} from "@/model/shapes/shape"
import {HEIGHT} from "~/model/entity_relation/object"
import {Ellipse2D} from "~/model/shapes/ellipse"

export interface SpecializationParam extends RelationParam {
  disjoint?: boolean;
  superclass?: Entity;
}

export default class Specialization extends Relationship {
  disjoint: boolean

  constructor({id, name, weak, superclass, disjoint, x, y, _type}: SpecializationParam) {
    super({id, name, weak, x, y, _type})
    this.disjoint = Boolean(disjoint)
    if (superclass) this.addRelation({entity: superclass})
  }

  setSuper(entity?: Entity) {
    if (!entity) return delete this.relations[0]
    this.relations[0] = {entity}
  }

  getSuper() {
    return this.relations[0]?.entity
  }

  drawShape(ctx: CanvasRenderingContext2D, shape?: Shape) {
    if (shape) {
      if (this.relations.length === 2) {
        // if (ctx.context.exporting()) return;
        shape.dashed(ctx)
      } else shape.draw(ctx)
      ctx.fillStyle = "#fff"
      ctx.fill()
      ctx.fillStyle = "#000"
      ctx.stroke()
    } else this.drawShape(ctx, this.getShape())
  }

  paint(ctx: CanvasRenderingContext2D) {
    this.attributes.forEach(a => a.draw(ctx))
    this.drawShape(ctx)
    if (this.relations.length === 2) return
    ctx.fillText(this.name, 0, 0)
  }

  getShape(width?: number, height?: number): Shape {
    if (width && height) return new Ellipse2D(-height * 0.25, -height * 0.25, height * 0.5, height * 0.5)
    else return this.getShape(this._trueWidth, HEIGHT)
  }
}
