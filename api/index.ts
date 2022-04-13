import express from 'express'
import cookieParser from "cookie-parser"
import session from "express-session"
import bodyParser from "body-parser"
import db, {init} from './data'
import auth from "./routes/auth"
import users from "./routes/users"
import containers from "./routes/container"
import diagrams from "./routes/diagram"
import n from "./routes/new"

// Create express instance
init().then(() => db())
const app = express()

app.use(cookieParser('evilEr'))
app.use(session({
  resave: false,
  saveUninitialized: false,
  secret: 'evilEr'
}))
app.use(bodyParser.json())
app.use(bodyParser.urlencoded())

app.use('/auth', auth)
app.use('/u', users)
app.use('/c', containers)
app.use('/d', diagrams)
app.use('/n', n)

// Export express app
module.exports = {
  path: '/api',
  handler: app
}

// Start standalone server if directly running
if (require.main === module) {
  const port = process.env.PORT || 8080
  app.listen(port, () => {
    // eslint-disable-next-line no-console
    console.log(`API server listening on port ${port}`)
  })
}
