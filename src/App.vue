<template>
<ModalFinTiempo />
  <div class="container-fluid">
    <Header />
    <Menu />
    <router-view />
    <Footer />
  </div>
</template>

<script>
import Header from "@/components/Header.vue";
import Menu from "@/components/Menu.vue";
import Footer from "@/components/Footer.vue";
import ModalFinTiempo from "@/components/ModalFinTiempo.vue";

export default {
  name: "Juegos",
  components: { Header, Menu, Footer, ModalFinTiempo},
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

a {
  font-weight: bold;
  color: black;
}

</style>
