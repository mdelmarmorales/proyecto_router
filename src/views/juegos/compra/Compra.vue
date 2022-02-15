<template>
<div>
  <Temporizador />
  <div class="alimentos">
    <img
      class="alimentosImagen"
      v-for="item in productos"
      v-bind:key="item"
      :src="item.imagen"
      :alt="item.nombre"
      @click="llenarCesta"
    />
  </div>
  <ListaCompra :productos="productos" />
  <Ticket :productos="productos" />
  </div>
</template>

<script>
import ListaCompra from "./ListaCompra.vue";
import Ticket from "./Ticket.vue";
import Temporizador from "@/components/Temporizador.vue";

export default {
  name: "Compra",
  components: {
    ListaCompra,
    Ticket,
    Temporizador
  },
  data() {
    return {
      productos: [
        {
          nombre: "manzana",
          imagen: require("@/images/manzana.png"),
          precio: 1,
        },
        {
          nombre: "fresa",
          imagen: require("@/images/fresa.png"),
          precio: 3,
        },
        {
          nombre: "platano",
          imagen: require("@/images/platano.png"),
          precio: 2,
        },
        {
          nombre: "leche",
          imagen: require("@/images/leche.png"),
          precio: 5,
        },
        {
          nombre: "pastel",
          imagen: require("@/images/pastel.png"),
          precio: 10,
        },
        {
          nombre: "queso",
          imagen: require("@/images/queso.png"),
          precio: 8,
        },
        {
          nombre: "rosquilla",
          imagen: require("@/images/rosquilla.png"),
          precio: 4,
        },
      ],
    };
  },
  methods: {
    llenarCesta(event) {
      this.emitter.emit("productoSelec", event.target.alt);
    },
  },
};
</script>

<style scoped>
.alimentosImagen {  height: 30px;
}
</style>