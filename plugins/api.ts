import {ObjectType} from "~/types/types";
import Attribute from "~/model/entity_relation/attribute";
import Relationship from "~/model/entity_relation/relationship";
import Entity from "~/model/entity_relation/entity";
import Specialization from "~/model/entity_relation/specialization";
import ERObject from "~/model/entity_relation/object";

export function get(url: string) {
  return fetch(url).then(res => res.json()).then((res) => {
    if (res.status === "success") return res
    else throw res.error
  })
}

export function del(url: string) {
  return fetch(url, {method: "DELETE"}).then(res => res.json()).then((res) => {
    if (res.status === "success") return res
    else throw res.error
  })
}

export function post(url: string, body: any) {
  return fetch(url, {
    method: "POST",
    body: JSON.stringify(body),
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    }
  }).then(res => res.json()).then((res) => {
    if (res.status === "success") return res
    else throw res.error
  })
}
