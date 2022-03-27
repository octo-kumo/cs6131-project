import User from "~/model/user"

declare module "express-session" {
  interface SessionData {
    user: User
  }
}
