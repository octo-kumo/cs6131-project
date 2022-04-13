import ERObject, {HEIGHT, ObjectParams, WIDTH} from '@/model/entity_relation/object'
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

  constructor({id, name, weak, key, derived, type, parent, x, y, _parent}: AttributeParams) {
    super({id, name, weak, x, y})
    this.key = key ?? false
    this.derived = derived ?? false
    this.type = type ?? 'string'
    this.parent = parent
    this._parent = _parent
  }

  drawShape(ctx: CanvasRenderingContext2D, shape?: Shape) {
    if (shape) {
      if (this.derived) shape.dashed(ctx)
      else shape.draw(ctx)
    } else super.drawShape(ctx)
    ctx.fillStyle = "#fff"
    ctx.fill()
    ctx.fillStyle = "#000"
    ctx.stroke()
  }

  prepaint(ctx: CanvasRenderingContext2D) {
    super.prepaint(ctx)
    new Line({b: this.truePosition().neg()}).draw(ctx)
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
    if (width && height) return new Ellipse2D(-width / 2, -height * 0.7 / 2, width, height * 0.7)
    else return this.getShape(this._trueWidth * 0.7, HEIGHT)
  }

  truePosition() {
    return new Vector({x: this._x, y: this._y})
  }

  setParent(parent?: ERObject) {
    const pos = this.copy()
    this.parent = parent
    this.set(pos)
    return this.parent
  }

  updateTrueWidth(ctx: CanvasRenderingContext2D) {
    return Math.max(WIDTH * 0.7, ctx.measureText(this.name).width * 1.05)
  }

  get y(): number {
    return this._y + (this.parent?.y ?? 0)
  }

  set y(value: number) {
    this._y = value - (this.parent?.y ?? 0)
  }

  get x(): number {
    return this._x + (this.parent?.x ?? 0)
  }

  set x(value: number) {
    this._x = value - (this.parent?.x ?? 0)
  }
}
