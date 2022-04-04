import {uuid} from 'uuidv4'

export default class User {
  uid!: string
  pfp?: string
  name!: string
  email!: string
  type?: string
  pwd_hash!: string
  last_login?: number
  isAdmin?: boolean

  // eslint-disable-next-line camelcase
  constructor({uid, pfp, name, email, type, pwd_hash, last_login}: Partial<User>) {
    this.uid = uid || uuid()
    this.pfp = pfp
    this.name = name || "Anonymous"
    this.email = email || ""
    this.type = type
    // eslint-disable-next-line camelcase
    this.pwd_hash = pwd_hash || ""
    // eslint-disable-next-line camelcase
    this.last_login = last_login
  }

  toSQL() {
    return `INSERT INTO eviler.user (uid, pfp, name, isAdmin, email, pwd_hash, last_login)
            VALUES (${this.uid}, ${this.pfp}, ${this.name}, ${this.isAdmin}, ${this.email}, ${this.pwd_hash},
                    ${this.last_login});`
  }
}
