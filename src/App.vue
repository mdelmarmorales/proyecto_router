<template>
  <div class="container-fluid">
    <Header />
    <Menu />
    <!-- <div id="fondo" class="m-0 row justify-content-center">
        <div class="row" id="nav">
        <router-link to="/">Home</router-link> |
        <router-link :to="{ name: 'Juegos' }">Juegos</router-link> |
        <router-link :to="{ name: 'Registro' }">Registro</router-link>
        <router-view /> 
      </div>   -->
    <router-view />
  </div>
</template>

<script>
import Header from "@/components/Header.vue";
import Menu from "@/components/Menu.vue";

export default {
  name: "Juegos",
  components: { Header, Menu},
  };
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  background-image: url("images/fondo.png");
  background-size: cover;
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-position: center;
  min-height: 100vh;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
