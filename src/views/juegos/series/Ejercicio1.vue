<template>
  <div class="row juego mx-3 my-4 d-flex justify-content-around align-items-center">
    <form class="col-10 mx-auto p-3" @submit.prevent="comprobarSerie">
      <div class="row d-flex
            flex-row
            justify-content-around
            align-items-center px-3">
        <!-- Recorremos el array. Si hay un número, lo escribimos.
            Si no, ponemos el input para el niño escriba el nº que falta -->
             <img v-if="index != serieSolucion.length-1" src="@/images/circulo.png" alt="circulo" class="circulo my-auto" />
        <div
          class="
            col-2
            d-flex
            flex-row
            justify-content-between
            align-items-center
          "
          v-for="num in serieSolucion"
          v-bind:key="num"
        >
          <p v-if="num != valorPosicionVacia" class="numero my-auto p-1">
            {{ num }}
          </p>

          <input id="inputNum" class="form-control" v-else v-model="numPropuesto" />
          <img src="@/images/circulo.png" alt="circulo" class="circulo my-auto" />
        </div>
        <button class="btn-comprobar" type="submit">Comprobar</button>
      </div>
    </form>
    <img
      class="correcto mx-auto"
      src="@/images/correcto.png"
      alt="correcto"
      v-if="this.correcto === true"
    />
    <img
      class="correcto mx-auto"
      src="@/images/incorrecto.png"
      alt="correcto"
      v-if="this.correcto === false"
    />
  </div>
</template>

<script>
export default {
  name: "Ejercicio1",
  data() {
    return {
      tamanyoSerie: 4,
      tiposSerie: ["suma", "resta", "multiplicacion"],
      tipoComparacion: ["menor", "mayor"],
      correcto: null,
    };
  },
  props: {
    serieSolucion: Array,
  },
  computed: {
    /* Selecionamos si la serie se va a formar sumando, restando o multiplicando */
    tipoSerie() {
      let tipo, indice;

      indice = this.numeroAleatorio(0, this.tiposSerie.length - 1);
      tipo = this.tiposSerie[indice];

      return tipo;
    },
    /* Valor del nº que vamos a ocultar */
    valorPosicionVacia() {
      let indice = this.numeroAleatorio(0, this.serieSolucion.length - 1);
      let valor = this.serieSolucion[indice];

      return valor;
    },
  },
  methods: {
    numeroAleatorio(min, max) {
      return Math.floor(Math.random() * (max - min + 1) + min);
    },
    /* Método para comprobar que el valor introducido es correcto */
    comprobarSerie() {
      this.correcto = false;

      if (this.valorPosicionVacia == parseInt(this.numPropuesto)) {
        this.correcto = true;
      }

      //Emitimos un evento si ha acertado
      this.emitter.emit("correctoSerie", this.correcto);
    },
  },
};
</script>

<style scoped>
/* .juego {
  background-color: #faea7d;
  border: 2px solid #071488;
  border-radius: 15px;
} */

/* .btn-comprobar {
  background-color: #3fcfba;
  border: 2px solid #071488;
  border-radius: 5px;
  width: 6.25em;
  height:2.5em;
} */

.numero, #inputNum {
  border: 1px solid black;
  background-color: white;
  width: 3rem;
}

.circulo {
  height: 1.875em;
}
</style>