<template>
  <div class="row juego mx-3 my-4 d-flex justify-content-around align-items-center">
    <form class="col-9 mx-auto p-3" @submit.prevent="comprobarSerie">
      <div class="row">
        <!-- Recorremos el array. Si hay un número, lo escribimos.
            Si no, ponemos el input para el niño escriba el nº que falta -->
        <span
          class="
            col-2
            d-flex
            flex-row
            justify-content-around
            align-items-center
          "
          v-for="num in serieSolucion"
          v-bind:key="num"
        >
          <p v-if="num != valorPosicionVacia" class="numero my-auto p-1">
            {{ num }}
          </p>

          <input class="form-control" v-else v-model="numPropuesto" />
          <img src="@/images/flecha.png" alt="flecha" class="flecha my-auto" />
        </span>
        <button class="btn-comprobar" type="submit">Comprobar</button>
      </div>
    </form>
    <img
      class="correcto"
      src="@/images/correcto.png"
      alt="correcto"
      v-if="this.correcto === true"
    />
    <img
      class="correcto col-1"
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

<style>
.juego {
  background-color: #faea7d;
  border: 2px solid #071488;
  border-radius: 15px;
}

.btn-comprobar {
  background-color: #3fcfba;
  border: 2px solid #071488;
  border-radius: 5px;
  width: 100px;
  height:40px;
}

.numero {
  border: 1px solid black;
  background-color: white;
}

.correcto,
.flecha {
  height: 30px;
}
</style>