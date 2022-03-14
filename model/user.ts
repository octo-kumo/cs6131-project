import {uuid} from 'uuidv4';

export default class User {
  uid!: string;
  pfp?: string;
  name!: string;
  email!: string;
  type?: string;
  pwd_hash!: string;
  last_login?: number;
  
  last_view?: string;
  last_view_time?: number;

  constructor({uid, pfp, name, email, type, pwd_hash, last_login, last_view_time}: Partial<User>) {
    this.uid = uid || uuid()
    this.pfp = pfp
    this.name = name || "Anonymous"
    this.email = email || ""
    this.type = type;
    this.pwd_hash = pwd_hash || "";
    this.last_login = last_login;
    this.last_view_time = last_view_time;
  }

  toSQL() {
    return `INSERT INTO eviler.user (uid, pfp, name, type, email, pwd_hash, last_login, last_view_time, C1_cid)
            VALUES (${this.uid}, ${this.pfp}, ${this.name}, ${this.type}, ${this.email}, ${this.pwd_hash},
                    ${this.last_login}, ${this.last_view_time}, ${this.last_view});`
  }
}
