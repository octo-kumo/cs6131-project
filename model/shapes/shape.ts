import Vector from "~/model/entity_relation/vector";

export abstract class Shape {
  predraw(ctx: CanvasRenderingContext2D) {
    //
  }

  abstract draw(ctx: CanvasRenderingContext2D): void;

  abstract translated(x: number, y: number): Shape;

  dashed(ctx: CanvasRenderingContext2D) {
    ctx.setLineDash([2])
    this.draw(ctx)
    ctx.setLineDash([])
  }

  abstract contains(point: Vector): boolean;
}

export function drawLine(ctx: CanvasRenderingContext2D, x1: number, y1: number, x2: number, y2: number) {
  ctx.beginPath()
  ctx.moveTo(x1, y1)
  ctx.lineTo(x2, y2)
  ctx.closePath()
  ctx.stroke()
}
