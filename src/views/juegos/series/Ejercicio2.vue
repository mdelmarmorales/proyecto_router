<template>
  <div v-if="this.correcto" class="row juego mx-3 my-4 d-flex justify-content-around align-items-center">
    <form class="col-9 mx-auto p-3" @submit.prevent="comprobarComparacion">
      <div
        class="row d-flex flex-row justify-content-around align-items-center"
      >
        <p>De los números anteriores, ¿cuál es el {{ this.menorMayor }}?</p>
        <input class="form-control col-2" v-model="comparacionPropuesta" />
        <button class="btn-comprobar" type="submit">Comprobar</button>
      </div>
    </form>
    <img
      class="correcto"
      src="@/images/correcto.png"
      alt="correcto"
      v-if="this.correctoComp === true"
    />
    <img
      class="correcto"
      src="@/images/incorrecto.png"
      alt="correcto"
      v-if="this.correctoComp === false"
    />
  </div>
</template>

<script>
export default {
  name: "Ejercicio2",
  data() {
    return {
      correcto: null,
      correctoComp: null,
      tipoComparacion: ["menor", "mayor"],
      serieSolucionCopia:
        [] /*Tenemos que copiar porque las props son de sólo lectura */,
    };
  },
  props: {
    serieSolucion: Array,
  },
  computed: {
    seleccionSerie() {
      let seleccion = [];
      seleccion = this.construyeSeleccion();

      return seleccion;
    },
    menorMayor() {
      let comparacion, indice;

      indice = this.numeroAleatorio(0, this.tipoComparacion.length - 1);
      comparacion = this.tipoComparacion[indice];

      return comparacion;
    },
  },
  mounted() {
    this.emitter.on("correctoSerie", (correctoSerie) => {
      
      this.correcto = correctoSerie;
    });
  },
  methods: {
    numeroAleatorio(min, max) {
      return Math.floor(Math.random() * (max - min + 1) + min);
    },
    comprobarComparacion() {
      this.correctoComp = false;

      this.serieSolucionCopia = this.serieSolucion.sort((a, b) => a - b);

      if (this.menorMayor == "menor") {
        if (parseInt(this.comparacionPropuesta) == this.serieSolucionCopia[0]) {
          this.correctoComp = true;
        }
      } else {
        if (
          parseInt(this.comparacionPropuesta) ==
          this.serieSolucionCopia[this.serieSolucionCopia.length - 1]
        ) {
          this.correctoComp = true;
        }
      }
      this.emitter.emit("correctoComp", this.correctoComp);
    },
  },
};
</script>

<style>
</style>