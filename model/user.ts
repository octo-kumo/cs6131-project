import {uuid} from 'uuidv4'

export default class User {
  uid!: string
  pfp?: string
  name!: string
  email!: string
  type?: string
  pwdHash!: string
  lastLogin?: number

  lastView?: string
  lastViewTime?: number

  constructor({uid, pfp, name, email, type, pwdHash, lastLogin, lastViewTime}: Partial<User>) {
    this.uid = uid || uuid()
    this.pfp = pfp
    this.name = name || "Anonymous"
    this.email = email || ""
    this.type = type
    this.pwdHash = pwdHash || ""
    this.lastLogin = lastLogin
    this.lastViewTime = lastViewTime
  }

  toSQL() {
    return `INSERT INTO eviler.user (uid, pfp, name, type, email, pwd_hash, lastLogin, lastViewTime, C1_cid)
            VALUES (${this.uid}, ${this.pfp}, ${this.name}, ${this.type}, ${this.email}, ${this.pwdHash},
                    ${this.lastLogin}, ${this.lastViewTime}, ${this.lastView});`
  }
}
