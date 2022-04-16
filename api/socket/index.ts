import * as http from "http"
import {Server} from "socket.io"
import {objectEntity} from "~/types/data-types"

let server: Server | undefined

export default (httpServer?: http.Server) => {
  if (server || !httpServer) return server
  console.log("server", httpServer)
  server = new Server(httpServer, {
    cors: {
      origin: '*'
    }
  })

  server.on('connection', (client) => {
    console.log('connect', client.id)
    client.emit('hello')

    client.on('updateObject', (data: Partial<objectEntity>) => {
      server?.to("diagram_" + data.did).emit('update.object', data)
    })

    client.on('newObject', (data: objectEntity) => {
      server?.to("diagram_" + data.did).emit('new.object', data)
    })

    client.on('disconnect', () => { /* … */
    })

    client.on('requestRoom', (room) => {
      client.join(String(room))
    })
  })
  return server
}
