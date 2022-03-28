import express from 'express'
import cookieParser from "cookie-parser"
import session from "express-session"
import bodyParser from "body-parser"
import db, {init} from './data'
import auth from "./routes/auth"
import containers from "./routes/container"
import diagrams from "./routes/diagram"

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
app.get('/hello', (req, res) => res.end('world'))
app.use('/c', containers)
app.use('/d', diagrams)
app.use('/auth', auth)

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
