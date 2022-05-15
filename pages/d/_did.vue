<template>
  <div class="relative container">
    <er-editor ref="editor" v-model="nodes" :did="$route.params.did"/>
    <button
      v-if="diagram&&editor.canEdit"
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
      v-if="diagram&&editor.canEdit"
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
        <span class="text-gray-500 -mt-1 font-mono text-xs">
          <span class="font-bold" v-text="diagram.objects_made"/>
          objects made
        </span>
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
      v-if="diagram&&editor.canEdit"
      id="left-panel"
      :class="selected ? 'translate-x-0' : '-translate-x-full'"
      class="transform bottom-2 left-2 w-128 bg-white fixed rounded-xl ring-1 ring-gray-500 p-2 overflow-auto ease-in-out transition-all duration-300 z-30"
    >
      <div v-if="selected" class="flex flex-col gap-2">
        <div class="grid grid-cols-3 gap-x-1 gap-y-1 relative ring-1 ring-gray-200 p-2 pt-4 rounded">
          <span class="absolute top-0 left-1 text-gray-500 uppercase font-bold text-xs select-none">Entity</span>
          <label>ID</label>
          <input v-model="selected.id" class="col-span-2" readonly disabled>
          <label>Name</label>
          <input v-model="selected.name" class="col-span-2" @change="notifyChange('name')">
          <label>Weak</label>
          <button
            class="btn primary small col-span-2"
            :class="selected.weak?'outline':''"
            @click="selected.weak=!selected.weak;notifyChange('outlined')"
            v-text="selected.weak?'Outlined':'Solid'"
          />
          <label>X</label>
          <input v-model="selectedX" type="number" class="col-span-2" readonly>
          <label>Y</label>
          <input v-model="selectedY" type="number" class="col-span-2" readonly>
        </div>
        <div
          v-if="selected._type==='attribute'"
          class="grid grid-cols-3 gap-x-1 gap-y-1 relative ring-1 ring-gray-200 p-2 pt-4 rounded"
        >
          <span class="absolute top-0 left-1 text-gray-500 uppercase font-bold text-xs select-none">Attribute</span>
          <label>Key</label>
          <input v-model="selected.key" class="col-span-2 self-center" type="checkbox" @change="notifyChange('isKey')">
          <label>Derived</label>
          <input
            v-model="selected.derived"
            class="col-span-2 self-center"
            type="checkbox"
            @change="notifyChange('isDerived')"
          >
        </div>
        <div
          v-if="selected._type==='specialization'"
          class="grid grid-cols-3 gap-x-1 gap-y-1 relative ring-1 ring-gray-200 p-2 pt-4 rounded"
        >
          <span class="absolute top-0 left-1 text-gray-500 uppercase font-bold text-xs select-none">
            Specialization</span>
          <label>Disjoint</label>
          <input
            v-model="selected.disjoint"
            class="col-span-2 self-center"
            type="checkbox"
            @change="notifyChange('disjoint')"
          >
        </div>
        <div
          v-if="selected._type==='relationship'"
          id="relation-panel"
          class="relative ring-1 ring-gray-200 p-2 pt-4 rounded"
        >
          <span class="absolute top-0 left-1 text-gray-500 uppercase font-bold text-xs select-none">Relationship</span>
          <table>
            <tr>
              <th>Entity</th>
              <th>Amm</th>
              <th>Role</th>
              <th>Total</th>
              <th/>
            </tr>
            <tr v-for="(r,i) in selected.relations" :key="i">
              <td>
                <select
                  v-model="r.entity"
                  class="min-w-0 w-16"
                  @focus="$event.target.oldValue=r.entity&&r.entity.id"
                  @click="$event.target.oldValue=r.entity&&r.entity.id"
                  @change="selected.revalidate();editor.notifyRelationUpdated(r, selected, $event.target.oldValue);"
                >
                  <option
                    v-for="(o,j) in nodes.filter(n=>n._type==='entity')"
                    :key="j"
                    :value="o"
                    v-text="o.name"
                  />
                </select>
              </td>
              <td>
                <input v-model="r.cardinality" class="min-w-0 w-16" @change="editor.notifyRelationUpdated(r, selected)">
              </td>
              <td>
                <input v-model="r.role" class="min-w-0 w-16" @change="editor.notifyRelationUpdated(r, selected)">
              </td>
              <td class="text-center">
                <input
                  v-model="r.total"
                  class="min-w-0"
                  type="checkbox"
                  @change="editor.notifyRelationUpdated(r, selected)"
                >
              </td>
              <td>
                <button
                  type="button"
                  class="btn danger xsmall min-w-0 self-center mt-1 -mb-1"
                  @click="editor.notifyRelationDeleted(selected.removeRelation(i)[0], selected)"
                >
                  <svg
                    fill="currentColor"
                    class="w-4 h-4"
                    viewBox="0 0 512 512"
                  >
                    <path
                      d="M443.6,387.1L312.4,255.4l131.5-130c5.4-5.4,5.4-14.2,0-19.6l-37.4-37.6c-2.6-2.6-6.1-4-9.8-4c-3.7,0-7.2,1.5-9.8,4  L256,197.8L124.9,68.3c-2.6-2.6-6.1-4-9.8-4c-3.7,0-7.2,1.5-9.8,4L68,105.9c-5.4,5.4-5.4,14.2,0,19.6l131.5,130L68.4,387.1  c-2.6,2.6-4.1,6.1-4.1,9.8c0,3.7,1.4,7.2,4.1,9.8l37.4,37.6c2.7,2.7,6.2,4.1,9.8,4.1c3.5,0,7.1-1.3,9.8-4.1L256,313.1l130.7,131.1  c2.7,2.7,6.2,4.1,9.8,4.1c3.5,0,7.1-1.3,9.8-4.1l37.4-37.6c2.6-2.6,4.1-6.1,4.1-9.8C447.7,393.2,446.2,389.7,443.6,387.1z"
                    />
                  </svg>
                </button>
              </td>
            </tr>
            <tr>
              <td>
                <select v-model="pendingRelation.entity" class="min-w-0 w-16">
                  <option
                    v-for="(o,i) in nodes.filter(n=>n._type==='entity')"
                    :key="i"
                    :value="o"
                    v-text="o.name"
                  />
                </select>
              </td>
              <td>
                <input v-model="pendingRelation.cardinality" class="min-w-0 w-16">
              </td>
              <td>
                <input v-model="pendingRelation.role" class="min-w-0 w-16">
              </td>
              <td class="text-center">
                <input v-model="pendingRelation.total" class="min-w-0" type="checkbox">
              </td>
              <td>
                <button
                  type="button"
                  class="btn success xsmall min-w-0 self-center mt-1 -mb-1"
                  @click="addRelation"
                >
                  <svg
                    fill="currentColor"
                    class="w-4 h-4"
                    viewBox="0 0 512 512"
                  >
                    <path
                      d="M417.4,224H288V94.6c0-16.9-14.3-30.6-32-30.6c-17.7,0-32,13.7-32,30.6V224H94.6C77.7,224,64,238.3,64,256  c0,17.7,13.7,32,30.6,32H224v129.4c0,16.9,14.3,30.6,32,30.6c17.7,0,32-13.7,32-30.6V288h129.4c16.9,0,30.6-14.3,30.6-32  C448,238.3,434.3,224,417.4,224z"
                    />
                  </svg>
                </button>
              </td>
            </tr>
          </table>
        </div>
        <div
          id="attribute-panel"
          class="relative ring-1 ring-gray-200 p-2 pt-4 rounded"
        >
          <span class="absolute top-0 left-1 text-gray-500 uppercase font-bold text-xs select-none">Attributes</span>
          <table>
            <tr>
              <th>Name</th>
              <th>Key</th>
              <th>Derived</th>
              <th/>
            </tr>
            <tr v-for="(a,i) in selected.attributes" :key="i">
              <td>
                <input v-model="a.name" class="min-w-0" @change="editor.emitUpdateEvent(a, ['name'])">
              </td>
              <td class="text-center">
                <input v-model="a.key" type="checkbox" class="min-w-0" @change="editor.emitUpdateEvent(a, ['isKey'])">
              </td>
              <td class="text-center">
                <input
                  v-model="a.derived"
                  type="checkbox"
                  class="min-w-0"
                  @change="editor.emitUpdateEvent(a, ['isDerived'])"
                >
              </td>
              <td>
                <button
                  type="button"
                  class="btn danger xsmall min-w-0 self-center mt-1 -mb-1"
                  @click="selected.attributes.splice(i,1)"
                >
                  <svg
                    fill="currentColor"
                    class="w-4 h-4"
                    viewBox="0 0 512 512"
                  >
                    <path
                      d="M443.6,387.1L312.4,255.4l131.5-130c5.4-5.4,5.4-14.2,0-19.6l-37.4-37.6c-2.6-2.6-6.1-4-9.8-4c-3.7,0-7.2,1.5-9.8,4  L256,197.8L124.9,68.3c-2.6-2.6-6.1-4-9.8-4c-3.7,0-7.2,1.5-9.8,4L68,105.9c-5.4,5.4-5.4,14.2,0,19.6l131.5,130L68.4,387.1  c-2.6,2.6-4.1,6.1-4.1,9.8c0,3.7,1.4,7.2,4.1,9.8l37.4,37.6c2.7,2.7,6.2,4.1,9.8,4.1c3.5,0,7.1-1.3,9.8-4.1L256,313.1l130.7,131.1  c2.7,2.7,6.2,4.1,9.8,4.1c3.5,0,7.1-1.3,9.8-4.1l37.4-37.6c2.6-2.6,4.1-6.1,4.1-9.8C447.7,393.2,446.2,389.7,443.6,387.1z"
                    />
                  </svg>
                </button>
              </td>
            </tr>
            <tr>
              <td>
                <input v-model="pendingAttribute.name" class="min-w-0">
              </td>
              <td class="text-center">
                <input v-model="pendingAttribute.key" class="min-w-0" type="checkbox">
              </td>
              <td class="text-center">
                <input v-model="pendingAttribute.derived" class="min-w-0" type="checkbox">
              </td>
              <td>
                <button
                  type="button"
                  class="btn success xsmall min-w-0 self-center mt-1 -mb-1"
                  @click="addAttribute"
                >
                  <svg
                    fill="currentColor"
                    class="w-4 h-4"
                    viewBox="0 0 512 512"
                  >
                    <path
                      d="M417.4,224H288V94.6c0-16.9-14.3-30.6-32-30.6c-17.7,0-32,13.7-32,30.6V224H94.6C77.7,224,64,238.3,64,256  c0,17.7,13.7,32,30.6,32H224v129.4c0,16.9,14.3,30.6,32,30.6c17.7,0,32-13.7,32-30.6V288h129.4c16.9,0,30.6-14.3,30.6-32  C448,238.3,434.3,224,417.4,224z"
                    />
                  </svg>
                </button>
              </td>
            </tr>
          </table>
        </div>
        <div>
          <button class="btn danger" @click="deleteSelected">
            Delete
          </button>
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
import ERObject, {flatten} from "~/model/entity_relation/object"
import Attribute from "~/model/entity_relation/attribute"
import Relationship, {Relation} from "~/model/entity_relation/relationship"
import Specialization from "~/model/entity_relation/specialization"
import {getType} from "~/model/entity_relation"
import {CREATE_OBJECT, OBJECT_CREATED, OBJECT_DELETED, OBJECT_UPDATED, RELATE_CREATED} from "~/api/socket.events"

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

  pendingRelation: Relation = {} as Relation
  pendingAttribute: Attribute = {} as Attribute

  mounted() {
    get(`/api/d/${this.did}`).then(res => this.diagram = res.diagram)
    Promise.all([
      get(`/api/d/${this.did}/o`),
      get(`/api/d/${this.did}/r`)
    ]).then((res) => {
      this.relates = res[1].relates
      this.objects = res[0].objects
    })
    this.editor.$on(OBJECT_CREATED, (obj: objectEntity) => this.objects.push(obj))
    this.editor.$on(OBJECT_DELETED, (obj: objectEntity) => {
      const i = this.objects.findIndex(o => o.id === obj.id)
      if (i !== -1) this.objects.splice(i, 1)
      if (this.editor.selected?.id === obj.id) this.editor.selected = null
    })
    this.editor.$on(OBJECT_UPDATED, (obj: objectEntity & Partial<attributeEntity> & Partial<specializationEntity>) => {
      console.log(OBJECT_UPDATED, obj)
      const object = this.objects.find(o => o.id === obj.id)
      if (!object) return
      Object.assign(object, obj)
      const node = flatten(this.nodes).find(o => o.id === obj.id)
      if (!node) return
      node.name = obj.name ?? node.name
      if (!(node === this.selected && this.editor.mouseState === 'dragging')) {
        node.x = obj.x ?? node.x
        node.y = obj.y ?? node.y
      }
      node.weak = obj.outlined ?? node.weak
      node._type = obj.type ?? node._type
      if (node instanceof Attribute) {
        node.key = obj.isKey ?? node.key
        node.derived = obj.isDerived ?? node.derived
      }
      if (node instanceof Specialization) node.disjoint = obj.disjoint ?? node.disjoint
    })

    this.editor.$on(RELATE_CREATED, (o: relatesEntity) => this.addRelate(o))
  }

  save() {
    this.disabled = true
    post(`/api/d/${this.did}`, this.editedDiagram).then((res) => {
      if (res.diagram.did !== this.diagram?.did) this.$router.push(`/d/${res.diagram.did}`)
      this.diagram = res.diagram
    }).catch(alert).finally(() => this.editing = this.disabled = false)
  }

  updateDragData(event: DragEvent) {
    console.log(event)
    if (!event.dataTransfer) return
    if (!this.editor.canEdit) return
    event.dataTransfer.dropEffect = 'move'
    event.dataTransfer.effectAllowed = 'move'
    event.dataTransfer.setData("type", String((event.target as HTMLElement).getAttribute('data-type')))
  }

  addRelation() {
    if (!(this.selected && this.selected instanceof Relationship)) return
    if (!this.editor.canEdit) return
    this.editor.notifyRelationCreated(this.pendingRelation, this.selected)
    this.pendingRelation = {} as Relation
  }

  addAttribute() {
    if (!this.selected) return
    if (!this.pendingAttribute.name) return
    if (!this.editor.canEdit) return
    this.pendingAttribute = new Attribute(this.pendingAttribute)
    const angle = Math.random() * 2 * Math.PI
    this.pendingAttribute.set(this.selected.add(100 * Math.cos(angle), 50 * Math.sin(angle)))
    this.pendingAttribute.setParent(this.selected)
    this.selected.attributes.push(this.pendingAttribute)

    const newObject: objectEntity & attributeEntity = {
      isDerived: this.pendingAttribute.derived,
      isKey: this.pendingAttribute.key,
      name: this.pendingAttribute.name,
      outlined: this.pendingAttribute.weak,
      pid: this.pendingAttribute.parent?.id ?? null,
      type: 'attribute',
      did: this.did,
      id: this.pendingAttribute.id,
      x: this.pendingAttribute.x,
      y: this.pendingAttribute.y
    }
    this.editor.io?.emit(CREATE_OBJECT, newObject)
    this.pendingAttribute = {} as Attribute
  }

  deleteSelected() {
    if (!this.editor.canEdit) return
    if (this.selected) this.editor.deleteNode(this.selected)
  }

  notifyChange(field: keyof (objectEntity & attributeEntity & specializationEntity)) {
    if (this.selected) this.editor.emitUpdateEvent(this.selected, [field])
  }

  @Watch('objects')
  onObjectChanged(objects: objectEntity[]) {
    //
    const selected = this.selected
    this.nodes.splice(0, this.nodes.length)
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

    this.relates.forEach(o => this.addRelate(o))
    const N = flatten(this.nodes).find(n => n.id === selected?.id)
    if (N && selected) {
      this.editor.selected = N
      N.set(selected)
    }
  }

  addRelate(o: relatesEntity) {
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

  get did() {
    return this.$route.params.did
  }
}
</script>

<style scoped>
</style>
