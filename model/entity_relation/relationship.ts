import ERObject, {HEIGHT, ObjectParams, WIDTH} from '@/model/entity_relation/object'
import Entity from '@/model/entity_relation/entity'
import {Shape} from "~/model/shapes/shape"
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
    this.relations.forEach(r => predraw(ctx, r))
  }

  drawShape(ctx: CanvasRenderingContext2D, shape?: Shape) {
    if (shape) {
      this.drawShape(ctx, this.getShape())
      // Ensure at least 7 px per character
      const newWidth = Math.max(WIDTH, this._trueWidth)
      if (this.weak) this.drawShape(ctx, this.getShape(newWidth - 15, HEIGHT - 6))
    } else super.drawShape(ctx)
  }

  getShape(width?: number, height?: number): Shape {
    if (width && height) {
      return new Diamond(-width / 2, -height / 2, width, height)
    } else return super.getShape()
  }
}

function predraw(ctx: CanvasRenderingContext2D, relation: Relation) {

}
