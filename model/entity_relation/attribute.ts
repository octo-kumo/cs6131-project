import ERObject, {HEIGHT, ObjectParams} from '@/model/entity_relation/object'
import {Shape} from "~/model/shapes/shape"
import {Ellipse2D} from "~/model/shapes/ellipse"
import Vector from "~/model/entity_relation/vector"
import {Line, lineUnderString} from "~/model/shapes/lines/line"

export type AttributeType = 'char' | 'string' | 'boolean' | 'integer' | 'float' | 'datetime' | 'date';

export interface AttributeParams extends ObjectParams {
  key?: boolean;
  derived?: boolean;
  type?: AttributeType;
  parent?: ERObject;
  _parent?: string;
}

export default class Attribute extends ERObject {
  parent?: ERObject
  _parent?: string
  key: boolean // underline
  derived: boolean // dashed outline

  type: AttributeType
  param?: string

  constructor({id, name, weak, key, derived, type, parent, x, y}: AttributeParams) {
    super({id, name, weak, x, y})
    this.key = key ?? false
    this.derived = derived ?? false
    this.type = type ?? 'string'
    this.parent = parent
  }

  drawShape(ctx: CanvasRenderingContext2D, shape?: Shape) {
    if (shape) {
      if (this.derived) shape.dashed(ctx)
      else shape.draw(ctx)
    } else super.drawShape(ctx)
    ctx.stroke()
  }

  prepaint(ctx: CanvasRenderingContext2D) {
    super.prepaint(ctx)
    new Line({a: this.parent || Vector.ZERO, b: this.truePosition().neg()}).draw(ctx)
  }

  paint(ctx: CanvasRenderingContext2D) {
    super.paint(ctx)
    if (this.key) {
      const shape = lineUnderString(ctx, this.name).translated(0, 3)
      if (this.parent instanceof ERObject && this.parent?.weak) shape.dashed(ctx)
      else this.drawShape(ctx, shape)
    }
    // if (ctx.getContext().drawDebugInfo()) {
    //   ctx.scale(0.7, 0.7);
    //   ctx.drawStringCenter(getDataType() + "(" + getDataParam() + ")", 0, -12);
    // }
  }

  getShape(width?: number, height?: number): Shape {
    if (width && height) {
      const newWidth = Math.max(width * 0.7, this._trueWidth)
      return new Ellipse2D(-newWidth / 2, -height * 0.7 / 2, newWidth, height * 0.7)
    } else return this.getShape(this._trueWidth, HEIGHT)
  }

  truePosition() {
    return new Vector({x: this._x, y: this._y})
  }
}
