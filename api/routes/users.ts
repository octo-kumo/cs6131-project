import {Router} from 'express'
import {escape} from "sqlstring"
import database from '../data'

const users = Router({
  mergeParams: true
})

users.get('/', (req, res) => {
  database().query('SELECT * FROM eviler.vusers;').then((results: any) => {
    res.json({status: "success", users: results})
  }).catch(error => res.json({status: "failed", error}))
})

users.get('/:uid', (req, res) => {
  database().query(`SELECT *
                    FROM eviler.vusers
                    WHERE uid = ${escape(req.params.uid)}
                    LIMIT 1;`).then((results: any) => {
    res.json({status: "success", user: results[0]})
  }).catch(error => res.json({status: "failed", error}))
})

export default users
