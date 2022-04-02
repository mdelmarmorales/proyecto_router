<template>
  <ModalFinTiempo />
   <ModalGranja />
  <ModalRegistro />
  <ModalAcceso />
  <ModalPunto />
  <ModalSalir />
  <div class="container-fluid">
    <Header />
    <!-- Si el usuario no se ha logueado, no mostramos el menú para que no pueda navegar a ninguna página -->
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
import ModalRegistro from "@/components/ModalRegistro.vue";
import ModalAcceso from "@/components/ModalAcceso.vue";
import ModalPunto from "@/components/ModalPunto.vue";
import ModalSalir from "@/components/ModalSalir.vue";
import ModalGranja from "@/components/ModalGranja.vue";

export default {
  name: "Juegos",
  components: { Header, Menu, Footer, ModalFinTiempo, ModalGranja, ModalRegistro, ModalAcceso, ModalPunto, ModalSalir },
  data() {
    return {
     idJugador: localStorage.getItem("idJugador"),
    };
  },
  computed:{
    esInicio (){
      return this.$route.name;
    }
  },
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
