import express from "express"

export function requireAuth(req: express.Request, res: express.Response, next: express.NextFunction) {
  return req.session && req.session.user ? next() : res.json({
    status: "failed",
    error: "not logged in"
  })
}
