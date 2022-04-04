<template>
  <div id="app">
    <nav-bar/>
    <div class="container pt-16 mx-auto">
      <Nuxt/>
    </div>
  </div>
</template>

<script lang="ts">
import {Component, Vue} from "nuxt-property-decorator"
import NavBar from '../components/nav-bar.vue'
import User from "~/model/user"

@Component({
  components: {NavBar}
})
export default class Default extends Vue {
  mounted() {
    this.$nextTick(() => this.$store.dispatch("populate"))
  }

  get user(): User | null {
    return this.$store.state.user
  }
}
</script>
