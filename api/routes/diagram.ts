import {Router} from 'express'
import {escape} from "sqlstring"
import database from '../data'

const diagrams = Router({
  mergeParams: true
})

diagrams.get('/', (req, res) => {
  database().query('SELECT * FROM evilEr.container;').then((results: any) => {
    res.json({status: "success", diagrams: results})
  }).catch(error => res.json({status: "failed", error}))
})

diagrams.get('/:did', (req, res) => {
  database().query(`SELECT *
                    FROM evilEr.diagram
                    WHERE did = ${escape(req.params.did)}
                    LIMIT 1;`).then((results: any) => {
    res.json({status: "success", diagram: results[0]})
  }).catch(error => res.json({status: "failed", error}))
})

diagrams.get('/:did/o', (req, res) => {
  database().query(`SELECT *
                    FROM evilEr.object
                           natural left join evilEr.attribute
                           natural left join evilEr.specialization
                    WHERE object.did = ${escape(req.params.did)};`).then((results: any) => {
    res.json({status: "success", objects: results})
  }).catch(error => res.json({status: "failed", error}))
})

diagrams.get('/:did/r', (req, res) => {
  database().query(`SELECT *
                    FROM evilEr.relates
                    WHERE did = ${escape(req.params.did)};`).then((results: any) => {
    res.json({status: "success", relates: results})
  }).catch(error => res.json({status: "failed", error}))
})

export default diagrams
