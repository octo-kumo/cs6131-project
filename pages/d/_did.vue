<template>
  <div class="relative container">
    <er-editor ref="editor" v-model="nodes" :did="$route.params.did"/>
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
      <form v-if="editing" @submit.prevent="save">
        <fieldset :disabled="disabled" class="mb-2">
          <label class="block">Container</label>
          <select v-model="editedDiagram.cid" name="cid" required>
            <option v-for="(o,i) in containers" :key="i" :value="o.cid" v-text="o.name"/>
          </select>
          <label class="block">Diagram ID</label>
          <input v-model="editedDiagram.did" name="id" placeholder="URL safe please" required>
          <label class="block">Diagram Name</label>
          <input v-model="editedDiagram.name" name="name" placeholder="A beautiful name to replace one" required>
        </fieldset>
        <button class="btn success" type="submit">
          Save
        </button>
        <button class="btn" type="reset" @click="editing=false">
          Cancel
        </button>
      </form>
      <h1 v-if="!editing" class="text-2xl">
        <nuxt-link
          :to="`/c/${diagram.cid}`"
          class="font-thin -mt-1 font-mono block text-sm text-gray-400 hover:text-blue-500"
          v-text="diagram.cid+'/'"
        />
        <span class="font-thin -mt-1 block" v-text="diagram.name"/>
        <span class="font-thin -mt-1 font-mono block text-xs text-gray-500" v-text="diagram.did"/>
      </h1>
      <button v-if="!editing" class="btn primary mt-1" @click="editing=!!(editedDiagram={...diagram})">
        Edit
      </button>
      <hr class="my-1">
      <div>
        <h1 class="font-bold uppercase text-gray-500">
          Addition
        </h1>
        <div
          data-type="entity"
          class="mx-4 px-4 py-2 border border-black text-center"
          draggable="true"
          @dragstart="updateDragData"
        >
          Entity
        </div>
        <div
          data-type="attribute"
          class="mx-4 px-4 py-2 border border-black text-center"
          draggable="true"
          @dragstart="updateDragData"
        >
          Attribute
        </div>
        <div
          data-type="relationship"
          class="mx-4 px-4 py-2 border border-black text-center"
          draggable="true"
          @dragstart="updateDragData"
        >
          Relationship
        </div>
        <div
          data-type="specialization"
          class="mx-4 px-4 py-2 border border-black text-center"
          draggable="true"
          @dragstart="updateDragData"
        >
          Specialization
        </div>
        <h6 class="text-gray-500 text-xs">
          You can drag and drop these onto the board!
        </h6>
      </div>
    </aside>
    <aside
      v-if="diagram"
      id="left-panel"
      :class="selected ? 'translate-x-0' : '-translate-x-full'"
      class="transform bottom-2 left-2 w-128 bg-white fixed rounded-xl ring-1 ring-gray-500 p-2 overflow-auto ease-in-out transition-all duration-300 z-30"
    >
      <div v-if="selected" class="flex flex-col gap-2">
        <div class="grid grid-cols-3 gap-x-1 gap-y-1 relative ring-1 ring-gray-200 p-2 pt-4 rounded">
          <span class="absolute top-0 left-1 text-gray-500 uppercase font-bold text-xs select-none">Entity</span>
          <label>ID</label>
          <input v-model="selected.id" class="col-span-2">
          <label>Name</label>
          <input v-model="selected.name" class="col-span-2">
          <label>Weak</label>
          <button
            class="btn primary small col-span-2"
            :class="selected.weak?'outline':''"
            @click="selected.weak=!selected.weak"
            v-text="selected.weak?'Outlined':'Solid'"
          />
          <label>X</label>
          <input v-model="selectedX" type="number" class="col-span-2">
          <label>Y</label>
          <input v-model="selectedY" type="number" class="col-span-2">
        </div>
        <div
          v-if="selected._type==='attribute'"
          class="grid grid-cols-3 gap-x-1 gap-y-1 relative ring-1 ring-gray-200 p-2 pt-4 rounded"
        >
          <span class="absolute top-0 left-1 text-gray-500 uppercase font-bold text-xs select-none">Attribute</span>
          <label>Key</label>
          <input v-model="selected.key" class="col-span-2 self-center" type="checkbox">
          <label>Derived</label>
          <input v-model="selected.derived" class="col-span-2 self-center" type="checkbox">
        </div>
        <div
          v-if="selected._type==='relationship'"
          class="relative ring-1 ring-gray-200 p-2 pt-4 rounded"
        >
          <span class="absolute top-0 left-1 text-gray-500 uppercase font-bold text-xs select-none">Relationship</span>
          <table>
            <thead>
            <tr>
              <td>Entity</td>
              <td>Card.</td>
            </tr>
            </thead>
            <tbody>
            <tr
              v-for="(r,i) in selected.relations"
              :key="i"
            >
              <td>
                <input v-model="r.entity.name">
              </td>
              <td>
                <input v-model="r.cardinality">
              </td>
            </tr>
            </tbody>
          </table>
        </div>
      </div>
    </aside>
  </div>
</template>

<script lang="ts">
import {Component, Ref, Vue, Watch} from 'nuxt-property-decorator'
import {get, post} from "~/plugins/api"
import ErEditor from "~/components/editor/er-editor.vue"
import {
  attributeEntity,
  containerEntity,
  diagramEntity,
  objectEntity,
  relatesEntity,
  specializationEntity
} from "~/types/data-types"
import ERObject from "~/model/entity_relation/object"
import Attribute from "~/model/entity_relation/attribute"
import Relationship from "~/model/entity_relation/relationship"
import Specialization from "~/model/entity_relation/specialization"
import {getType} from "~/model/entity_relation"

@Component({
  components: {ErEditor}
})
export default class diagramView extends Vue {
  @Ref('editor') editor!: ErEditor

  name = 'diagramView'
  diagram: diagramEntity | null = null
  editedDiagram: diagramEntity | null = null
  objects: objectEntity[] = []
  relates: relatesEntity[] = []
  nodes: ERObject[] = []

  disabled = false
  infoOpen = false
  editing = false

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

  save() {
    this.disabled = true
    post(`/api/d/${this.$route.params.did}`, this.editedDiagram).then((res) => {
      if (res.diagram.did !== this.diagram?.did) this.$router.push(`/d/${res.diagram.did}`)
      this.diagram = res.diagram
    }).catch(alert).finally(() => this.editing = this.disabled = false)
  }

  updateDragData(event: DragEvent) {
    console.log(event)
    if (!event.dataTransfer) return
    event.dataTransfer.dropEffect = 'move'
    event.dataTransfer.effectAllowed = 'move'
    event.dataTransfer.setData("type", String((event.target as HTMLElement).getAttribute('data-type')))
  }

  @Watch('objects')
  onObjectChanged(objects: objectEntity[]) {
    //
    objects.filter(o => o.type !== 'attribute').forEach((sqlO) => {
      const o = sqlO as objectEntity & attributeEntity & specializationEntity
      const Type = getType(o.type)
      if (!Type) return
      let no
      this.nodes.push(no = new Type({
        id: o.id,
        name: o.name,
        x: o.x,
        y: o.y,
        weak: o.outlined,
        _type: o.type
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
        _parent: a.pid || '',
        _type: 'attribute'
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

  get containers(): containerEntity[] {
    return this.$store.state.containers || []
  }

  get selected() {
    return this.editor.selected
  }

  get selectedX() {
    return String(this.editor.selected?.x)
  }

  set selectedX(input: number | string) {
    if (this.editor.selected) this.editor.selected.x = parseFloat(String(input))
  }

  get selectedY() {
    return String(this.editor.selected?.y)
  }

  set selectedY(input: number | string) {
    if (this.editor.selected) this.editor.selected.y = parseFloat(String(input))
  }
}
</script>

<style scoped>
</style>
