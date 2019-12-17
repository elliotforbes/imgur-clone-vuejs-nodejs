<template>
  <div id="app">
    <Navbar />
    <HomePage />
  </div>
</template>

<script>
import Navbar from './components/Navbar.vue'
import HomePage from './components/HomePage.vue'

export default {
  name: 'app',
  components: {
    HomePage,
    Navbar
  }
}
</script>

<style>
</style>
