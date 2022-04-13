<template>
  <div class="container">
    <er-editor v-model="nodes"/>

    <button
      class="btn primary rounded-full w-12 h-12 fixed transform right-4 bottom-2 ease-in-out transition-all duration-300 z-30"
      :class="infoOpen?['-translate-x-64','outline']:['translate-x-0']"
      @click="infoOpen = !infoOpen"
    >
      <svg class="w-8 h-8" viewBox="0 0 24 24">
        <path
          fill="currentColor"
          d="M13,9H11V7H13M13,17H11V11H13M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z"
        />
      </svg>
    </button>
    <aside
      v-if="diagram"
      id="right-panel"
      :class="infoOpen ? 'translate-x-0' : 'translate-x-full'"
      class="transform bottom-2 right-2 w-64 bg-white fixed rounded-xl ring-1 ring-gray-500 p-2 overflow-auto ease-in-out transition-all duration-300 z-30"
      @click="infoOpen = true"
    >
      <h1 class="text-2xl">
        <span class="text-blue-400 block text-xs uppercase font-bold">
          Diagram Name
        </span>
        <span class="font-thin -mt-1 block" v-text="diagram.name"/>
        <span class="font-thin -mt-1 font-mono block text-xs text-gray-500" v-text="diagram.did"/>
      </h1>
      <hr class="m-1">
      <h3 class="text-sm">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ultrices urna et auctor dictum. Pellentesque
        varius efficitur imperdiet. Nam et nunc egestas, dapibus dui vitae, fringilla risus. Nam ornare eros ac justo
        laoreet, et viverra arcu rutrum. Nullam a malesuada sapien. Ut mollis luctus lorem eget tempus. Aenean eget arcu
        in eros finibus dictum et a enim. Praesent et suscipit leo. Etiam pharetra lectus ac bibendum consequat.
      </h3>
    </aside>
  </div>
</template>

<script lang="ts">
import {Component, Vue, Watch} from 'nuxt-property-decorator'
import {get} from "~/plugins/api"
import ErEditor from "~/components/editor/er-editor.vue"
import {attributeEntity, diagramEntity, objectEntity, relatesEntity, specializationEntity} from "~/types/data-types"
import ERObject from "~/model/entity_relation/object"
import Attribute from "~/model/entity_relation/attribute"
import Relationship from "~/model/entity_relation/relationship"
import Entity from "~/model/entity_relation/entity"
import Specialization from "~/model/entity_relation/specialization"
import {ObjectType} from "~/types/types";

@Component({
  components: {ErEditor}
})
export default class diagramView extends Vue {
  name = 'diagramView'
  diagram: diagramEntity | null = null
  objects: objectEntity[] = []
  relates: relatesEntity[] = []
  nodes: ERObject[] = []

  infoOpen = false

  mounted() {
    get(`/api/d/${this.$route.params.did}`).then(res => this.diagram = res.diagram)
    Promise.all([
      get(`/api/d/${this.$route.params.did}/o`),
      get(`/api/d/${this.$route.params.did}/r`)
    ]).then((res) => {
      this.relates = res[1].relates
      this.objects = res[0].objects
    })
  }

  @Watch('objects')
  onObjectChanged(objects: objectEntity[]) {
    //
    objects.filter(o => o.type !== 'attribute').forEach((sqlO) => {
      const o = sqlO as objectEntity & attributeEntity & specializationEntity
      let no
      this.nodes.push(no = new (this.getType(o.type))({
        id: o.id,
        name: o.name,
        x: o.x,
        y: o.y,
        weak: o.outlined
      }))
      switch (o.type) {
        case "specialization":
          (no as Specialization).disjoint = o.disjoint
          break
        default:
          break
      }
    })
    const attributes: Attribute[] = []
    objects.filter(o => o.type === 'attribute').forEach((o: objectEntity) => {
      const a = o as attributeEntity & objectEntity
      attributes.push(new Attribute({
        id: a.id,
        name: a.name,
        x: a.x,
        y: a.y,
        weak: a.outlined,
        derived: a.isDerived,
        key: a.isKey,
        _parent: a.pid || ''
      }))
    })
    const parents = [...this.nodes, ...attributes]
    attributes.forEach((o: ERObject) =>
      (o as Attribute).setParent(parents.find(n => n.id === (o as Attribute)._parent) ||
        attributes.find(n => n.id === (o as Attribute)._parent))?.attributes.push(o as Attribute))

    this.relates.forEach((o) => {
      const r = this.nodes.find(n => n.id === o.rid) as Relationship
      const oo = this.nodes.find(n => n.id === o.oid)
      if (!r || !oo) return console.log(o)
      r.addRelation({
        cardinality: o.cardinality ?? undefined,
        entity: oo,
        index: 0,
        role: o.role,
        total: o.total,
        dupeCount: 0,
        uniqueIndex: 0
      })
      r.revalidate()
    })
  }

  getType(type: ObjectType) {
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
        return ERObject
    }
  }
}
</script>

<style scoped>
</style>
