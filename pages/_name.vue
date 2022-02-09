<template>
  <section class="container">
    <div>
      <h1 class="title">
        Hello! {{ $route.params.name }}
      </h1>
      <nuxt-link class="button" to="/">
        Home
      </nuxt-link>
    </div>
  </section>
</template>

<script>
export default {
  head () {
    return {
      title: `User: ${this.$route.params.name}`
    }
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
  margin-top: 30px;
}

.info {
  font-weight: 300;
  color: #9aabb1;
  margin: 0;
  margin-top: 10px;
}

.button {
  margin-top: 30px;
}
</style>
