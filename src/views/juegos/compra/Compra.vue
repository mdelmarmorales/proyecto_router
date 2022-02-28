<template>
  <div class="row">
    <div id="cuadro_blanco" class="col-10 mx-auto mt-5">
      <div class="row d-flex my-2">
        <Temporizador class="col-1 ml-auto" />
      </div>
      <div class="row d-flex m-2 text-left">
        <p class="enunciado">
          Lee la lista de la compra y pincha los alimentos para introducirlos en
          la cesta. Después calcula cuánto han costado y cuánto dinero te sobra
          al pagar.
        </p>
      </div>
      <div class="row d-flex flex-row justify-content-around">
        <ListaCompra :productos="productos" />
      </div>
      <Alimentos :productos="productos" />
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
};
</script>

<style scoped>
#cuadro_blanco {
  min-height: 500px;
  width: 90%;
  background-color: #ffffff;
  border: 2px solid #071488;
  border-radius: 10px;
}

.enunciado{
  font-weight: bold;
}
</style>