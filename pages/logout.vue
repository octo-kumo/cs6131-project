<template>
  <div class="container">
    <h1 class="text-2xl">
      Logging out...
    </h1>
  </div>
</template>

<script lang="ts">
import {Component, Vue} from 'nuxt-property-decorator'

@Component
export default class logout extends Vue {
  name = 'logout'

  email = ""
  password = ""

  mounted() {
    fetch("/api/auth/logout", {
      method: "POST"
    }).then(res => res.json()).then((res) => {
      if (res.status === "success") {
        this.$router.push("/")
      } else alert(res.error)
    })
  }
}
</script>

<style scoped>
</style>
