<template>
  <ModalFinTiempo />
   <ModalGranja />
  <ModalRegistro />
  <ModalPunto />
  <ModalSalir />
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
import ModalRegistro from "@/components/ModalRegistro.vue";
import ModalPunto from "@/components/ModalPunto.vue";
import ModalSalir from "@/components/ModalSalir.vue";
import ModalGranja from "@/components/ModalGranja.vue";

export default {
  name: "Juegos",
  components: { Header, Menu, Footer, ModalFinTiempo, ModalGranja, ModalRegistro, ModalPunto, ModalSalir },
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
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

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
#cuadro_blanco {
  min-height: 500px;
  width: 90%;
  background-color: #ffffff;
  border: 2px solid #071488;
  border-radius: 10px;
}

.juego {
  background-color: #faea7d;
  border: 2px solid #071488;
  border-radius: 15px;
}

.btn-comprobar {
  background-color: #3fcfba;
  border: 2px solid #071488;
  border-radius: 5px;
  width: 6.25em;
  height:2.5em;
}

.correcto {
  height: 1.875em;
}

.enunciado {
  font-weight: bold;
  background-color: #e0f7f2;
  border: 2px solid #071488;
  border-radius: 10px;
}
</style>
