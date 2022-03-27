<template>
  <div class="container">
    <div>
      <h1 class="title">
        checkpoint-2
      </h1>
      <div>
        <div v-if="user">
          <p>
            Logged in as <span v-text="user.email"/>
          </p>
          <p>
            ID <span v-text="user.uid"/>
          </p>
        </div>
        <div class="links">
          <a
            href="/login"
            class="button--green"
          >
            Login
          </a>
          <a v-if="user"
             href="/logout"
             class="button--grey"
          >
            Logout
          </a>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import {Component, Vue} from 'nuxt-property-decorator'
import User from "~/model/user"

@Component
export default class Index extends Vue {
  name = 'index'

  mounted() {
    this.$store.dispatch("populate")
  }

  get user(): User | null {
    return this.$store.state.user
  }
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
