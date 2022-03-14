import {Router} from 'express'
import er from './er'

const api = Router({
  mergeParams: true
})

api.use('/er', er)

export default api
