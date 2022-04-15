import {Router} from 'express'
import {escape} from "sqlstring"
import database from '../data'
import {requireAuth} from "../utils"

const n = Router({
  mergeParams: true
})

n.post('/c', requireAuth, (req, res) => {
  if (!req.session.user) return res.json({status: "failed", error: "no user"})
  database().query(`CALL createContainer(${escape(req.body.id)}, ${escape(req.body.name)}, ${escape(req.session.user?.uid)});`).then((results: any) => {
    res.json({status: "success", results})
  }).catch(e => res.json({status: "failed", error: e}))
})

n.post('/d', requireAuth, (req, res) => {
  if (!req.session.user) return res.json({status: "failed", error: "no user"})
  database().query(`CALL createDiagram(?, ?, ?, ?, ?);`, [
    req.body.cid,
    req.body.id,
    req.body.name,
    req.body.type === "er",
    req.session.user?.uid
  ]).then((results: any) => {
    res.json({status: "success", results})
  }).catch(e => res.json({status: "failed", error: e}))
})

export default n
