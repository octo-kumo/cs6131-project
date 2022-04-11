import ERObject, {HEIGHT, ObjectParams, WIDTH} from '@/model/entity_relation/object'
import Entity from '@/model/entity_relation/entity'
import {drawLine, Shape} from "~/model/shapes/shape"
import {Diamond} from "~/model/shapes/diamond"

export type RelationParam = ObjectParams

export interface Relation {
  entity: Entity;
  role?: string;
  cardinality?: string;
  total?: boolean;

  index?: number;
  dupeCount?: number;
  uniqueIndex?: number;
}

export default class Relationship extends ERObject {
  relations: Relation[] = []

  addRelation(relation: Relation) {
    this.relations.push(relation)
    this.revalidate()
  }

  revalidate() {
    const map = new Map<Entity, number>()
    for (let i = 0; i < this.relations.length; i++) {
      const r = this.relations[i]
      r.index = i
      map.set(r.entity, (r.uniqueIndex = (map.get(r.entity) ?? 0)) + 1)
    }
    for (let i = 0; i < this.relations.length; i++) {
      this.relations[i].dupeCount = map.get(this.relations[i].entity) ?? 0
    }
  }

  predraw(ctx: CanvasRenderingContext2D) {
    super.predraw(ctx)
    this.relations.forEach(r => predraw(ctx, this, r))
  }

  getShape(width?: number, height?: number): Shape {
    if (width && height) return new Diamond(-width / 2, -height / 2, width, height)
    else return this.getShape(this._trueWidth, HEIGHT)
  }

  drawShape(ctx: CanvasRenderingContext2D, shape?: Shape) {
    if (shape) {
      super.drawShape(ctx, shape)
    } else {
      this.drawShape(ctx, this.getShape())
      this._trueWidth = Math.max(WIDTH, ctx.measureText(this.name).width * 1.05)
      if (this.weak) this.drawShape(ctx, this.getShape(this._trueWidth - 15, HEIGHT - 6))
    }
  }
}

function predraw(ctx: CanvasRenderingContext2D, relationship: Relationship, relation: Relation) {
  drawLine(ctx, relationship.x, relationship.y, relation.entity.x, relation.entity.y)
}
