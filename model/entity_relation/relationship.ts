import ERObject, {HEIGHT, ObjectParams} from '@/model/entity_relation/object'
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

  getShape(width?: number, height?: number): Shape {
    if (width && height) {
      return new Diamond(-width / 2, -height / 2, width, height)
    } else return this.getShape(this._trueWidth, HEIGHT)
  }
}

function predraw(ctx: CanvasRenderingContext2D, relation: Relation) {
//
}
