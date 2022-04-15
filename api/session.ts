import expressSession from "express-session"

import fileStore from "session-file-store"

const FileStore = fileStore(expressSession)

export const session = expressSession({
  resave: false,
  store: new FileStore({retries: 0}),
  saveUninitialized: false,
  secret: 'evilEr'
})
