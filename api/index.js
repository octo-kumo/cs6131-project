import express from 'express'
import api from './routes/api'
import db, { init } from './data'
// Create express instance
init().then(() => db())
const app = express()
app.get('/api/hello', (req, res) => res.end('world'))
app.use('/api', api)

// Export express app
module.exports = app

// Start standalone server if directly running
if (require.main === module) {
  const port = process.env.PORT || 8080
  app.listen(port, () => {
    // eslint-disable-next-line no-console
    console.log(`API server listening on port ${port}`)
  })
}
