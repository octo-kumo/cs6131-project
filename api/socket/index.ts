import {Server} from "socket.io"
import {NextFunction} from "express"
import sharedSession from "express-socket.io-session"
import {session} from "../session"
import {messageEntity, objectEntity} from "~/types/data-types"

export const server = new Server(3001, {
  cors: {
    origin: '*'
  }
})

server.use(sharedSession(session, {
  autoSave: true
}))
server.on('connection', (client) => {
  console.log('connect', client.id)
  client.emit('hello')

  client.on('updateObject', (data: Partial<objectEntity>) => {
    server.emit('update.object', data)
  })

  client.on('chat', (data: Partial<messageEntity>) => {
    server.emit('update.object', data)
  })

  client.on('disconnect', () => { /* … */
  })
})

export default function (req: any, res: any, next: NextFunction) {
  next()
}
