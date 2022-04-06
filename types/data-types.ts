export interface adminSQL {
  'retired': number | null;
  'start_time': Date | null;
  'uid': string;
}

export interface attributeSQL {
  'did': string;
  'id': string;
  'isDerived': number | null;
  'isKey': number | null;
  'O1_did': string | null;
  'O1_id': string | null;
}

export interface canEditSQL {
  'C1_cid': string;
  'E1_uid': string;
  'start_time': Date | null;
}

export interface canViewSQL {
  'C1_cid': string;
  'start_time': Date | null;
  'U1_uid': string;
}

export interface columnSQL {
  'isKey': number | null;
  'name': string;
  'notNull': number | null;
  'param': string | null;
  'T1_did': string;
  'T1_name': string;
  'type': string | null;
}

export interface containerSQL {
  'cid': string;
  'name': string | null;
}

export interface createdBySQL {
  'C1_cid': string;
  'datetime': Date | null;
  'U1_uid': string;
}

export interface diagramSQL {
  'C1_cid': string | null;
  'did': string;
  'isEr': number | null;
  'name': string | null;
}

export interface editorSQL {
  'reputation': number | null;
  'uid': string;
}

export interface foreignSQL {
  'required': number | null;
  'role': string | null;
  'T1_did': string;
  'T1_name': string;
  'T2_did': string;
  'T2_name': string;
}

export interface lastEditedBySQL {
  'D1_did': string;
  'datetime': Date | null;
  'U1_uid': string;
}

export interface lastViewSQL {
  'D1_did': string;
  'datetime': Date | null;
  'U1_uid': string;
}

export interface messageSQL {
  'C1_cid': string;
  'datetime': Date | null;
  'mid': string;
  'text': string | null;
  'U1_uid': string;
}

export interface ObjectSQL {
  'D1_did': string;
  'id': string;
  'name': string;
  'outlined': boolean;
  'type': 'entity' | 'relationship' | 'attribute' | '';
  'x': number;
  'y': number;
}

export interface relatesSQL {
  'cardinality': string | null;
  'O1_did': string;
  'O1_id': string;
  'O2_did': string;
  'O2_id': string;
  'role': string | null;
  'total': number | null;
}

export interface specializationSQL {
  'did': string;
  'disjoint': number | null;
  'id': string;
}

export interface tableSQL {
  'D1_did': string;
  'name': string;
  'x': number | null;
  'y': number | null;
}

export interface userSQL {
  'email': string | null;
  'isAdmin': number | null;
  'last_login': Date | null;
  'name': string | null;
  'pfp': string | null;
  'pwd_hash': string | null;
  'uid'?: string;
}

export interface vusersSQL {
  'email': string | null;
  'isAdmin': number | null;
  'name': string | null;
  'pfp': string | null;
  'uid'?: string;
}
