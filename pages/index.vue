<template>
  <div class="container">
    <div>
      <h1 class="title">
        Evil ER
      </h1>
      <h2 class="subtitle">
        Your go-to solution for<br>drawing <b>entity relation diagrams</b>
      </h2>
      <div class="flex justify-center links gap-2">
        <nuxt-link to="/c" class="btn">
          View Collections
        </nuxt-link>
        <nuxt-link to="/new/c" class="btn primary">
          Create new Collection
        </nuxt-link>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import {Component, Vue} from 'nuxt-property-decorator'

@Component
export default class Index extends Vue {
  name = 'index'
}
</script>

<style scoped>
.container {
  margin: 0 auto;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}

.title {
  font-family: 'Quicksand',
  'Source Sans Pro',
  -apple-system,
  BlinkMacSystemFont,
  'Segoe UI',
  Roboto,
  'Helvetica Neue',
  Arial,
  sans-serif;
  display: block;
  font-weight: 300;
  font-size: 100px;
  color: #35495e;
  letter-spacing: 1px;
}

.subtitle {
  font-weight: 300;
  font-size: 42px;
  color: #526488;
  word-spacing: 5px;
  padding-bottom: 15px;
}

.links {
  padding-top: 15px;
}
</style>
