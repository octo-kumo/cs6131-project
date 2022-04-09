import * as fs from "fs"
import * as path from "path"
import mysql, {Connection} from 'promise-mysql'

let db: Connection

export async function init() {
  db = await mysql.createConnection({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'admin'
  })
  console.log('connected to sql server...')
  await db.query('DROP DATABASE IF EXISTS evilEr;')
  await db.query('CREATE DATABASE IF NOT EXISTS evilEr;')
  await db.query('use evilEr;')
  const length = (await db.query('show tables;')).length
  console.log(length + ' tables found')
  if (length === 0) {
    await run('init.sql')
    await run('queries.sql')
    await run('populate.sql')
    await run('er_eviler.sql')
  }
}

async function run(file: string) {
  const content = fs.readFileSync(path.join(__dirname, file)).toString()
  for (const line of content.trim().split(/\s*;(?!#)\n\s*/g)) {
    if (!line) continue
    await db.query(line)
  }
}

export default () => db
