import {Server} from "socket.io"
import {objectEntity} from "~/types/data-types"

export const server = new Server(3001, {
  cors: {
    origin: '*'
  }
})

server.on('connection', (client) => {
  console.log('connect', client.id)
  client.emit('hello')

  client.on('updateObject', (data: Partial<objectEntity>) => {
    server.to("diagram_" + data.did).emit('update.object', data)
  })

  client.on('newObject', (data: objectEntity) => {
    server.to("diagram_" + data.did).emit('new.object', data)
  })

  client.on('disconnect', () => { /* … */
  })

  client.on('requestRoom', (room) => {
    client.join(String(room))
  })
})
