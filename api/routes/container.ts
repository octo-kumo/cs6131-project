import {Router} from 'express'
import {escape} from "sqlstring"
import database from '../data'

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
                           LEFT JOIN evilEr.user u on u.uid = message.uid
                    WHERE cid = ${escape(req.params.cid)}
                    ORDER BY datetime DESC;`).then((results: any) => {
    res.json({status: "success", messages: results})
  }).catch(error => res.json({status: "failed", error}))
})

export default containers
