import * as fs from "fs"
import * as path from "path"
import mysql, {Pool} from 'promise-mysql'

let db: Pool

export async function init() {
  db = await mysql.createPool({
    database: "evilEr",
    connectionLimit: 10,
    host: process.env.SQL_HOST ?? 'localhost',
    port: 3306,
    user: 'root',
    password: process.env.SQL_PASSWORD ?? 'admin'
  })
  console.log('connected to sql server...')
  await db.query('CREATE DATABASE IF NOT EXISTS evilEr;')
  await db.query('use evilEr;')
  const length = (await db.query('show tables;')).length
  console.log(length + ' tables found')
  if (length === 0) {
    await run('init.sql')
    await run('queries.sql')
    await run('populate.sql')
    await run('user_system.sql')
    for (const exmp of fs.readdirSync(path.join(__dirname, 'examples'))) {
      await run('examples/' + exmp)
    }
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
