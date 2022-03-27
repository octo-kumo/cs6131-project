export default interface User {
  uid: string;
  pfp?: string;
  name: string;
  type?: string;
  email: string;
  pwd_hash: string;
}
