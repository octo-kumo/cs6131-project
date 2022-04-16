import socket from 'socket.io-client'
import {ManagerOptions} from "socket.io-client/build/esm/manager"
import {SocketOptions} from "socket.io-client/build/esm/socket"
import config from "../nuxt.config"

export default () => {
  const options: Partial<ManagerOptions & SocketOptions> = {
    autoConnect: true
  }
  // @ts-ignore
  return socket(config.dev ? 'http://localhost:3001' : 'https://www.octo-kumo.tech:3001',
    options)
}
