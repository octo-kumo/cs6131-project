export interface admin {
  'retired': number | null;
  'start_time': Date | null;
  'uid': string;
}

export interface attribute {
  'did': string;
  'id': string;
  'isDerived': number | null;
  'isKey': number | null;
  'O1_did': string | null;
  'O1_id': string | null;
}

export interface can_edit {
  'C1_cid': string;
  'E1_uid': string;
  'start_time': Date | null;
}

export interface can_view {
  'C1_cid': string;
  'start_time': Date | null;
  'U1_uid': string;
}

export interface column {
  'isKey': number | null;
  'name': string;
  'notNull': number | null;
  'param': string | null;
  'T1_did': string;
  'T1_name': string;
  'type': string | null;
}

export interface container {
  'cid': string;
  'name': string | null;
}

export interface created_by {
  'C1_cid': string;
  'datetime': Date | null;
  'U1_uid': string;
}

export interface diagram {
  'C1_cid': string | null;
  'did': string;
  'isEr': number | null;
  'name': string | null;
}

export interface editor {
  'reputation': number | null;
  'uid': string;
}

export interface foreign {
  'required': number | null;
  'role': string | null;
  'T1_did': string;
  'T1_name': string;
  'T2_did': string;
  'T2_name': string;
}

export interface last_edited_by {
  'D1_did': string;
  'datetime': Date | null;
  'U1_uid': string;
}

export interface last_view {
  'D1_did': string;
  'datetime': Date | null;
  'U1_uid': string;
}

export interface message {
  'C1_cid': string;
  'datetime': Date | null;
  'mid': string;
  'text': string | null;
  'U1_uid': string;
}

export interface Object {
  'D1_did': string;
  'id': string;
  'name': string | null;
  'outlined': number | null;
  'type': string | null;
  'x': number | null;
  'y': number | null;
}

export interface relates {
  'cardinality': string | null;
  'O1_did': string;
  'O1_id': string;
  'O2_did': string;
  'O2_id': string;
  'role': string | null;
  'total': number | null;
}

export interface specialization {
  'did': string;
  'disjoint': number | null;
  'id': string;
}

export interface table {
  'D1_did': string;
  'name': string;
  'x': number | null;
  'y': number | null;
}

export interface user {
  'email': string | null;
  'isAdmin': number | null;
  'last_login': Date | null;
  'name': string | null;
  'pfp': string | null;
  'pwd_hash': string | null;
  'uid'?: string;
}

export interface vusers {
  'email': string | null;
  'isAdmin': number | null;
  'name': string | null;
  'pfp': string | null;
  'uid'?: string;
}
