import Relationship, {RelationParam} from '@/model/entity_relation/relationship'
import Entity from '@/model/entity_relation/entity'

export interface SpecializationParam extends RelationParam {
  disjoint?: boolean;
  superclass?: Entity;
}

export default class Specialization extends Relationship {
  disjoint: boolean

  constructor({id, name, weak, superclass, disjoint, x, y}: SpecializationParam) {
    super({id, name, weak, x, y})
    this.disjoint = Boolean(disjoint)
    if (superclass) this.addRelation({entity: superclass})
  }

  setSuper(entity?: Entity) {
    if (!entity) return delete this.relations[0]
    this.relations[0] = {entity}
  }

  getSuper() {
    return this.relations[0]?.entity
  }
}
