import {ObjectType} from "~/types/types"

export interface adminEntity {
  'retired': boolean;
  'start_time': Date | null;
  'uid': string;
}

export interface attributeEntity {
  'did': string;
  'id': string;
  'isDerived': boolean;
  'isKey': boolean;
  'pid': string | null;
}

export interface can_editEntity {
  'cid': string;
  'start_time': Date | null;
  'uid': string;
}

export interface can_viewEntity {
  'cid': string;
  'start_time': Date | null;
  'uid': string;
}

export interface columnEntity {
  'did': string;
  'isKey': boolean;
  'name': string;
  'notNull': boolean;
  'param': string | null;
  'r_name': string;
  'type': string | null;
}

export interface containerEntity {
  'cid': string;
  'name': string;
}

export interface created_byEntity {
  'cid': string;
  'datetime': Date | null;
  'uid': string;
}

export interface diagramEntity {
  'cid': string;
  'did': string;
  'isEr': boolean;
  'name': string;
  'objects_made': number;
}

export interface editorEntity {
  'created'?: number;
  'reputation'?: number;
  'uid': string;
}

export interface foreignEntity {
  'did': string;
  'name': string;
  'r_name': string;
  'required': boolean;
  'role': string | null;
}

export interface last_edited_byEntity {
  'datetime': Date | null;
  'did': string;
  'uid': string;
}

export interface last_viewEntity {
  'datetime': Date | null;
  'did': string;
  'uid': string;
}

export interface messageEntity {
  'cid': string;
  'datetime': Date;
  'mid': string;
  'text': string;
  'uid': string;
}

export interface objectEntity {
  'did': string;
  'id': string;
  'name': string;
  'outlined': boolean;
  'type': ObjectType;
  'x': number;
  'y': number;
}

export interface relatesEntity {
  'cardinality': string;
  'did': string;
  'oid': string;
  'rid': string;
  'role': string;
  'total': boolean;
}

export interface specializationEntity {
  'did': string;
  'disjoint': boolean;
  'id': string;
}

export interface tableEntity {
  'did': string;
  'name': string;
  'x': number;
  'y': number;
}

export interface userEntity {
  'email': string;
  'isAdmin': boolean;
  'last_login': Date | null;
  'name': string;
  'pfp': string | null;
  'pwd_hash': string;
  'messages_sent'?: number;
  'uid'?: string;
}

export interface vuserEntity {
  'email': string;
  'isAdmin': boolean;
  'name': string;
  'pfp': string | null;
  'messages_sent'?: number;
  'uid'?: string;
}
