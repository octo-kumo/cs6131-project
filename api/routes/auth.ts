import {Router} from 'express'
import {escape} from "sqlstring"
import {validate} from 'email-validator'
import database from '../data'
import {requireAuth} from "../utils"

const auth = Router({
  mergeParams: true
})
auth.get('/', requireAuth, (req, res) => {
  res.json({status: "success", user: req.session.user})
})
auth.post('/login', (req, res) => {
  database().query(`call login(${escape(req.body.email)}, ${escape(req.body.password)});`).then((results: any) => {
    const users = results[0]
    if (users.length === 0) res.json({status: "failed", error: "Invalid email/password"})
    else {
      req.session.user = users[0]
      console.log("logged in",
        req.session.user)
      res.json({status: "success", user: users[0]})
    }
  }).catch((e) => {
    res.json({status: "failed", error: e})
  })
})
auth.post('/profile', requireAuth, (req, res) => {
  if (req.body.npassword && String(req.body.npassword).length < 8) return res.json({
    status: 'failed',
    error: "Password too short"
  })
  database().query(`call updateProfile(${escape(req.body.email)}, ${escape(req.body.password)}, ${escape(req.body.name)}, ${escape(req.body.pfp)});`).then(async (results: any) => {
    const users = results[0]
    if (users.length === 0) res.json({status: "failed", error: "Invalid email/password"})
    else {
      if (req.body.npassword) await database().query(`call updatePassword(${escape(req.body.email)}, ${escape(req.body.password)}, ${escape(req.body.npassword)});`)
      req.session.user = users[0]
      console.log("logged in", req.session.user)
      res.json({status: "success", user: users[0]})
    }
  }).catch((e) => {
    res.json({status: "failed", error: e})
  })
})
auth.post('/register', (req, res) => {
  if (String(req.body.name).length < 5) return res.json({
    status: "failed",
    error: "bad form name"
  })
  else if (!validate(req.body.email)) return res.json({
    status: "failed",
    error: "bad form email"
  })
  else if (String(req.body.password).length < 8) return res.json({
    status: "failed",
    error: "bad form password"
  })
  database().query(`call register(${escape(req.body.name)},${escape(req.body.email)}, ${escape(req.body.password)});`).then((results: any) => {
    console.log('The result is: ', results)
    res.json({status: "success", results})
  }).catch((e) => {
    res.json({status: "failed", error: e.code})
  })
})

auth.post('/logout', (req, res) => {
  req.session.destroy((err) => {
    if (err) res.json({status: "failed", error: err})
    else res.json({status: "success"})
  })
})

auth.get('/users', requireAuth, (req, res) => {
  database().query('select * from evilEr.vUsers;').then((results: any) => {
    console.log('The result is: ', results)
    res.json({status: "success", users: results})
  }).catch((e) => {
    res.json({status: "failed", error: e.code})
  })
})

export default auth
