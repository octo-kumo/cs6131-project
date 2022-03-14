import {Router} from 'express'
import database from '../data'

const er = Router({
  mergeParams: true
})

er.get('/', (req, res) => {
  database().query('SHOW TABLES;').then((results: any) => {
    console.log('The solution is: ', results[0].solution)
  })
})

export default er
