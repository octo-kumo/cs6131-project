import {Router} from 'express'
import {escape} from "sqlstring"
import database from '../data'
import server from "../socket"
import {requireAuth} from "../utils"
import {MESSAGE_DELETED, MESSAGE_SENT} from "../socket.events"

const containers = Router({
  mergeParams: true
})

containers.get('/', (req, res) => {
  database().query('SELECT * FROM evilEr.container;').then((results: any) => {
    res.json({status: "success", containers: results})
  }).catch(error => res.json({status: "failed", error}))
})

containers.get('/:cid', (req, res) => {
  database().query(`SELECT *
                    FROM evilEr.container
                    WHERE cid = ${escape(req.params.cid)}
                    LIMIT 1;`).then((results: any) => {
    res.json({status: "success", container: results[0]})
  }).catch(error => res.json({status: "failed", error}))
})

containers.post('/:cid', requireAuth, (req, res) => {
  database().query(`UPDATE evilEr.container
                    SET cid  = ?,
                        name = ?
                    WHERE cid = ?;`, [req.body.cid, req.body.name, req.params.cid]).then(() => {
    res.json({status: "success", container: req.body})
  }).catch(error => res.json({status: "failed", error}))
})

containers.get('/:cid/d', (req, res) => {
  database().query(`SELECT *
                    FROM evilEr.diagram
                           NATURAL LEFT JOIN evilEr.last_edited_by
                    WHERE cid = ${escape(req.params.cid)};`).then((results: any) => {
    res.json({status: "success", diagrams: results})
  }).catch(error => res.json({status: "failed", error}))
})

containers.get('/:cid/c', (req, res) => {
  database().query(`SELECT *
                    FROM evilEr.message
                           NATURAL LEFT JOIN evilEr.vUsers
                    WHERE cid = ${escape(req.params.cid)}
                    ORDER BY datetime;`).then((results: any) => {
    res.json({status: "success", messages: results})
  }).catch(error => res.json({status: "failed", error}))
})

containers.post('/:cid/c', requireAuth, (req, res) => {
  database().query(`CALL sendMessage(?, ?, ?);`, [req.session.user?.uid, req.params.cid, req.body.message]).then((results: any) => {
    server()?.emit(MESSAGE_SENT, results[0][0])
    res.json({status: "success", message: results[0][0]})
  }).catch(error => res.json({status: "failed", error}))
})

containers.delete('/:cid/c/:mid', requireAuth, (req, res) => {
  database().query(`DELETE
                    FROM evilEr.message
                    WHERE cid = ?
                      AND mid = ?;`, [req.params.cid, req.params.mid]).then(() => {
    server()?.emit(MESSAGE_DELETED, {mid: req.params.mid, cid: req.params.cid})
    res.json({status: "success"})
  }).catch(error => res.json({status: "failed", error}))
})

export default containers
