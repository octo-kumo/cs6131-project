import ERObject, {ObjectParams} from '@/model/entity_relation/object'
import {Line, lineUnderString} from "~/model/shapes/lines/line"
import {Shape} from "~/model/shapes/shape"
import {Ellipse2D} from "~/model/shapes/ellipse"
import Vector from "~/model/entity_relation/vector"

export type AttributeType = 'char' | 'string' | 'boolean' | 'integer' | 'float' | 'datetime' | 'date';

export interface AttributeParams extends ObjectParams {
  key?: boolean;
  derived?: boolean;
  type?: AttributeType;
  parent?: ERObject;
}

export default class Attribute extends ERObject {
  parent: ERObject | null
  key: boolean // underline
  derived: boolean // dashed outline

  type: AttributeType
  param?: string

  constructor({name, weak, key, derived, type, parent, x, y}: AttributeParams) {
    super({name, weak, x, y})
    this.key = key ?? false
    this.derived = derived ?? false
    this.type = type ?? 'string'
    this.parent = parent ?? null
  }

  drawShape(ctx: CanvasRenderingContext2D, shape?: Shape) {
    if (shape) {
      if (this.derived) shape.dashed(ctx)
      else shape.draw(ctx)
    } else super.drawShape(ctx)
  }

  prepaint(ctx: CanvasRenderingContext2D) {
    super.prepaint(ctx)
    new Line({b: this.truePosition().neg()}).draw(ctx)
  }

  paint(ctx: CanvasRenderingContext2D) {
    super.paint(ctx)
    if (this.key) {
      const shape = lineUnderString(ctx, this.name).translated(0, 3)
      if (this.parent?.weak) shape.dashed(ctx)
      else this.drawShape(ctx, shape)
    }
    // if (ctx.getContext().drawDebugInfo()) {
    //   ctx.scale(0.7, 0.7);
    //   ctx.drawStringCenter(getDataType() + "(" + getDataParam() + ")", 0, -12);
    // }
  }

  getShape(width?: number, height?: number) {
    if (width && height) {
      const newWidth = Math.max(width * 0.7, this._trueWidth)
      return new Ellipse2D(-newWidth / 2, -height * 0.7 / 2, newWidth, height * 0.7)
    } else return super.getShape()
  }

  truePosition() {
    return new Vector({x: this._x, y: this._y})
  }
}
