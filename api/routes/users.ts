import {Router} from 'express'
import {escape} from "sqlstring"
import database from '../data'

const users = Router({
  mergeParams: true
})

users.get('/', (req, res) => {
  database().query('SELECT * FROM evilEr.vUsers;').then((results: any) => {
    res.json({status: "success", users: results})
  }).catch(error => res.json({status: "failed", error}))
})

users.get('/:uid', (req, res) => {
  database().query(`SELECT *
                    FROM evilEr.vUsers
                           NATURAL LEFT JOIN evilEr.editor
                           NATURAL LEFT JOIN evilEr.admin
                    WHERE uid = ${escape(req.params.uid)}
                    LIMIT 1;`).then((results: any) => {
    res.json({status: "success", user: results[0]})
  }).catch(error => res.json({status: "failed", error}))
})

users.get('/:uid/created', (req, res) => {
  database().query(`SELECT *
                    FROM evilEr.created_by
                           NATURAL LEFT JOIN evilEr.container
                    WHERE uid = ${escape(req.params.uid)};`).then((results: any) => {
    res.json({status: "success", created: results})
  }).catch(error => res.json({status: "failed", error}))
})

users.get('/:uid/canEdit', (req, res) => {
  database().query(`SELECT *
                    FROM evilEr.can_edit
                           NATURAL LEFT JOIN evilEr.container
                    WHERE uid = ${escape(req.params.uid)};`).then((results: any) => {
    res.json({status: "success", created: results})
  }).catch(error => res.json({status: "failed", error}))
})

users.get('/:uid/canView', (req, res) => {
  database().query(`SELECT *
                    FROM evilEr.can_view
                           NATURAL LEFT JOIN evilEr.container
                    WHERE uid = ${escape(req.params.uid)};`).then((results: any) => {
    res.json({status: "success", created: results})
  }).catch(error => res.json({status: "failed", error}))
})

export default users
