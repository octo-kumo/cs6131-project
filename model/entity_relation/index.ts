import {ObjectType} from "~/types/types"
import Attribute from "~/model/entity_relation/attribute"
import Relationship from "~/model/entity_relation/relationship"
import Entity from "~/model/entity_relation/entity"
import Specialization from "~/model/entity_relation/specialization"

export function getType(type: ObjectType) {
  switch (type) {
    case "attribute":
      return Attribute
    case "relationship":
      return Relationship
    case "entity":
      return Entity
    case "specialization":
      return Specialization
    default:
      return null
  }
}
