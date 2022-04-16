import ERObject, {HEIGHT, ObjectParams, WIDTH} from '@/model/entity_relation/object'
import Entity from '@/model/entity_relation/entity'
import {drawLine, Shape} from "~/model/shapes/shape"
import {Diamond} from "~/model/shapes/diamond"
import {RelationLine} from "~/model/shapes/lines/relationline";

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
  lines: RelationLine[] = []

  addRelation(relation: Relation) {
    this.relations.push(relation)
    this.revalidate()
  }

  removeRelation(i: number) {
    this.relations.splice(i, 1)
    this.revalidate()
  }

  revalidate() {
    const map = new Map<string, number>()
    for (let i = 0; i < this.relations.length; i++) {
      const r = this.relations[i]
      r.index = i
      map.set(r.entity.id, (r.uniqueIndex = (map.get(r.entity.id) ?? 0)) + 1)
    }
    for (let i = 0; i < this.relations.length; i++) {
      this.relations[i].dupeCount = map.get(this.relations[i].entity.id) ?? 0
      this.lines[i] = new RelationLine({a: this, b: this.relations[i].entity, r: this.relations[i]})
    }
  }

  predraw(ctx: CanvasRenderingContext2D) {
    super.predraw(ctx)
    this.lines.forEach(l => l.predraw(ctx))
    this.lines.forEach(l => l.draw(ctx))
  }

  getShape(width?: number, height?: number): Shape {
    if (width && height) return new Diamond(-width / 2, -height / 2, width, height)
    else return this.getShape(this._trueWidth, HEIGHT)
  }

  drawShape(ctx: CanvasRenderingContext2D, shape?: Shape) {
    if (shape) super.drawShape(ctx, shape)
    else {
      this.drawShape(ctx, this.getShape())
      this._trueWidth = Math.max(WIDTH, ctx.measureText(this.name).width * 1.05)
      if (this.weak) this.drawShape(ctx, this.getShape(this._trueWidth - 15, HEIGHT - 6))
    }
  }
}

function predraw(ctx: CanvasRenderingContext2D, relationship: Relationship, relation: Relation) {
  drawLine(ctx, relationship.x, relationship.y, relation.entity.x, relation.entity.y)
}
