import * as http from "http"
import {Server} from "socket.io"
import {escape} from "sqlstring"
import {
  CREATE_OBJECT,
  CREATE_RELATE,
  DELETE_OBJECT,
  DELETE_RELATE,
  OBJECT_CREATED,
  OBJECT_DELETED,
  OBJECT_UPDATED,
  RELATE_CREATED,
  RELATE_DELETED,
  RELATE_UPDATED,
  UPDATE_OBJECT,
  UPDATE_RELATE
} from "../socket.events"
import db from "../data"
import {attributeEntity, objectEntity, relatesEntity, specializationEntity} from "~/types/data-types"

const objectKeys: (keyof objectEntity)[] = ['name', 'outlined', 'type', 'x', 'y']
const attributeKeys: (keyof attributeEntity)[] = ['isDerived', 'isKey', 'pid']
const specializationKeys: (keyof specializationEntity)[] = ['disjoint']
const relateKeys: (keyof relatesEntity)[] = ['cardinality', 'oid', 'role', 'total']
let server: Server | undefined

export default (httpServer?: http.Server) => {
  if (server || !httpServer) return server
  console.log("server", httpServer)
  server = new Server(httpServer, {
    cors: {
      origin: '*'
    }
  })

  server.on('connection', (client) => {
    console.log('connect', client.id)

    client.on(UPDATE_OBJECT, async (data: Partial<objectEntity & attributeEntity & specializationEntity>) => {
      const updates = (Object.keys(data) as (keyof (objectEntity & attributeEntity & specializationEntity))[])
      const updatesObject = updates.filter(e => objectKeys.includes(e as keyof objectEntity))
      const updatesAttribute = updates.filter(e => attributeKeys.includes(e as keyof attributeEntity))
      const updatesSpecialization = updates.filter(e => specializationKeys.includes(e as keyof specializationEntity))
      const query1 = genUpdate('evilEr.object', updatesObject, data, `did=${escape(data.did)} AND id=${escape(data.id)}`)
      const query2 = genUpdate('evilEr.attribute', updatesAttribute, data, `did=${escape(data.did)} AND id=${escape(data.id)}`)
      const query3 = genUpdate('evilEr.specialization', updatesSpecialization, data, `did=${escape(data.did)} AND id=${escape(data.id)}`)
      if (updatesObject.length > 0) await db().query(query1)
      if (updatesAttribute.length > 0) await db().query(query2)
      if (updatesSpecialization.length > 0) await db().query(query3)
      server?.to("diagram_" + data.did).emit(OBJECT_UPDATED, data)
    })

    client.on(CREATE_OBJECT, async (data: objectEntity & Partial<attributeEntity> & Partial<specializationEntity>) => {
      const updates = (Object.keys(data) as (keyof (objectEntity & attributeEntity & specializationEntity))[])
      const updatesObject = updates.filter(e => objectKeys.includes(e as keyof objectEntity))
      const updatesAttribute = updates.filter(e => attributeKeys.includes(e as keyof attributeEntity))
      const updatesSpecialization = updates.filter(e => specializationKeys.includes(e as keyof specializationEntity))
      const query1 = genCreate('evilEr.object', updatesObject, data)
      const query2 = genCreate('evilEr.attribute', updatesAttribute, data)
      const query3 = genCreate('evilEr.specialization', updatesSpecialization, data)
      if (updatesObject.length > 0) await db().query(query1)
      if (updatesAttribute.length > 0) await db().query(query2)
      if (updatesSpecialization.length > 0) await db().query(query3)
      server?.to("diagram_" + data.did).emit(OBJECT_CREATED, data)
    })

    client.on(DELETE_OBJECT, async (data: Partial<objectEntity & attributeEntity & specializationEntity>) => {
      await db().query(`DELETE
                        FROM evilEr.object
                        WHERE did = ${escape(data.did)}
                          AND id = ${escape(data.id)};`)
      server?.to("diagram_" + data.did).emit(OBJECT_DELETED, data)
    })

    client.on(CREATE_RELATE, async (data: relatesEntity) => {
      if (!(data.rid && data.oid && data.did)) return
      await db().query(
        `INSERT INTO evilEr.relates
         VALUES (?, ?, ?, ?, ?, ?)`,
        [data.role ?? '', data.total ?? false, data.cardinality ?? '', data.rid, data.oid, data.did]).catch(_e => console.log(_e))
      server?.to("diagram_" + data.did).emit(RELATE_CREATED, data)
    })

    client.on(UPDATE_RELATE, async (data: relatesEntity & { ooid?: string }) => {
      const updates = (Object.keys(data) as (keyof relatesEntity)[])
      const updatesRelate = updates.filter(e => relateKeys.includes(e as keyof relatesEntity))
      await db().query(genUpdate('evilEr.relates', updatesRelate, data, `did=${escape(data.did)} AND oid=${escape(data.ooid ?? data.oid)} AND rid=${escape(data.rid)}`)).catch(_e => null)
      server?.to("diagram_" + data.did).emit(RELATE_UPDATED, data)
    })

    client.on(DELETE_RELATE, async (data: relatesEntity) => {
      await db().query(`DELETE
                        FROM evilEr.relates
                        WHERE did = ${escape(data.did)}
                          AND rid = ${escape(data.rid)}
                          AND oid = ${escape(data.oid)}
                          AND role = ${escape(data.role)};`)
      server?.to("diagram_" + data.did).emit(RELATE_DELETED, data)
    })

    client.on('disconnect', () => { /* … */
    })

    client.on('requestRoom', (room) => {
      client.join(String(room))
    })
  })
  return server
}

function genUpdate(table: string, keys: string[], data: any, identifier: string) {
  return `UPDATE ${table}
          SET ${keys.map(key => `${key}=${escape(data[key])}`).join(',')}
          WHERE ${identifier};`
}

function genCreate(table: string, keys: string[], data: any) {
  return `INSERT INTO ${table} (id, did, ${keys.join(',')})
          VALUES (${escape(data.id)}, ${escape(data.did)}, ${keys.map(key => escape(data[key])).join(',')});`
}
