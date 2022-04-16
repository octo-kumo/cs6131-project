import socket from 'socket.io-client'
import {ManagerOptions} from "socket.io-client/build/esm/manager"
import {SocketOptions} from "socket.io-client/build/esm/socket"

export default () => {
  const options: Partial<ManagerOptions & SocketOptions> = {
    autoConnect: true,
    withCredentials: true
  }
  return socket(options)
}
