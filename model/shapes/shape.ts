export abstract class Shape {
  abstract draw(ctx: CanvasRenderingContext2D): void;

  abstract translated(x: number, y: number): Shape;

  dashed(ctx: CanvasRenderingContext2D) {
    ctx.setLineDash([5, 15])
    this.draw(ctx)
    ctx.setLineDash([])
    ctx.stroke()
  }
}
