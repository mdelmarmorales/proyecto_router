<template>
  <div class="row">
    <div id="cuadro_blanco" class="col-10 mx-auto mt-5">
      <div class="row d-flex my-2">
        <button
          v-if="!this.comienzo"
          class="btn-comprobar ml-auto mr-2"
          type="button"
          @click="comenzar"
        >
          Comenzar
        </button>
        <Temporizador v-else class="col-1 ml-auto" />
      </div>
      <div class="row d-flex mx-2 mt-3 mb-1 text-left">
        <p class="enunciado col-12 p-2">
          Lee la lista de la compra y pincha los alimentos para introducirlos en
          la cesta. Después calcula cuánto han costado y cuánto dinero te sobra
          al pagar. Pulsa "Comenzar".
        </p>
      </div>
      <Alimentos v-if="this.comienzo" :productos="productos" :comienzo="comienzo" class="row justify-content-center" />
      <div class="row d-flex flex-row justify-content-around">
        <ListaCompra v-if="this.comienzo" :productos="productos" />
      </div>
    </div>
  </div>
</template>

<script>
import ListaCompra from "./ListaCompra.vue";
import Alimentos from "./Alimentos.vue";
import Temporizador from "@/components/Temporizador.vue";

export default {
  name: "Compra",
  components: {
    ListaCompra,
    Alimentos,
    Temporizador,
  },
  data() {
    return {
      comienzo:false,
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
    comenzar() {
      this.comienzo = true;
    },
  },
};
</script>

<style scoped>

</style>