import * as fs from "fs"
import * as path from "path"
import mysql, {Connection} from 'promise-mysql'

let db: Connection

export async function init() {
  db = await mysql.createConnection({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'admin',
    database: 'evilEr'
  })
  console.log('connected to sql server')
  const length = (await db.query('show tables;')).length
  console.log(length + ' tables found')
  if (length < 18) await initDB()
}

async function initDB() {
  const content = fs.readFileSync(path.join(__dirname, 'init.sql')).toString()
  let i = 0
  for (const line of content.trim().split(/\s*;\n\s*/g)) {
    if (!line) continue
    await db.query(line)
    i++
  }
  console.log(i + " inits")
}

export default () => db
