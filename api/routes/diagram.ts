import {Router} from 'express'
import {escape} from "sqlstring"
import database from '../data'

const diagrams = Router({
  mergeParams: true
})

diagrams.get('/', (req, res) => {
  database().query('SELECT * FROM eviler.container;').then((results: any) => {
    res.json({status: "success", diagrams: results})
  }).catch(error => res.json({status: "failed", error}))
})

diagrams.get('/:did', (req, res) => {
  database().query(`SELECT *
                    FROM eviler.diagram
                    WHERE did = ${escape(req.params.did)}
                    LIMIT 1;`).then((results: any) => {
    res.json({status: "success", diagram: results[0]})
  }).catch(error => res.json({status: "failed", error}))
})

diagrams.get('/:did/o', (req, res) => {
  database().query(`SELECT *
                    FROM eviler.object
                           natural left join eviler.attribute
                           natural left join eviler.specialization
                    WHERE object.did = ${escape(req.params.did)};`).then((results: any) => {
    res.json({status: "success", objects: results})
  }).catch(error => res.json({status: "failed", error}))
})

diagrams.get('/:did/r', (req, res) => {
  database().query(`SELECT *
                    FROM eviler.relates
                    WHERE did = ${escape(req.params.did)};`).then((results: any) => {
    res.json({status: "success", relates: results})
  }).catch(error => res.json({status: "failed", error}))
})

export default diagrams
