<script setup>
import { RouterView } from 'vue-router'
import NavBar from "@/components/layouts/NavBar.vue";
import Footer from "@/components/footer/Footer.vue"; 

</script>

<template>
 <nav-bar/>
 <RouterView />

 <Footer />
</template>

<style scoped>
</style>
