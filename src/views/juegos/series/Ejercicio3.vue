<template>
  <div
    v-if="this.correcto"
    class="row juego mx-3 my-4 d-flex justify-content-around align-items-center"
  >
    <form class="col-10 w-100 mx-auto p-3" @submit.prevent="comprobarSeleccion">
      <div
        class="row d-flex flex-row justify-content-around align-items-center"
      >
        <p class="my-auto">
          Entre estos números:
          <span v-for="num in seleccionSerie" v-bind:key="num"
            >{{ num }},
          </span>
          ¿cuál es el {{ this.menorMayorSelec }}?
        </p>
        <input
          id="inputNum"
          class="form-control col-2"
          v-model="selecPropuesta"
        />
        <button class="btn-comprobar" type="submit">Comprobar</button>
      </div>
    </form>
    <img
      class="correcto mx-auto"
      src="@/images/correcto.png"
      alt="correcto"
      v-if="this.correctoSelec === true"
    />
    <img
      class="correcto mx-auto"
      src="@/images/incorrecto.png"
      alt="correcto"
      v-if="this.correctoSelec === false"
    />
  </div>
</template>

<script>
export default {
  name: "Ejercicio3",
  data() {
    return {
      correcto: null,
      correctoComp: null,
      tipoComparacion: ["menor", "mayor"],
      correctoSelec: null,
    };
  },
  props: {
    seleccionSerie: Array,
  },
  //Esperamos el evento para mostrar este juego
  mounted() {
    this.emitter.on("correctoComp", (correctoComp) => {
      this.correcto = correctoComp;
    });
  },
  computed: {
    //Seleccionamos si queremos buscar el menor o el mayor
    menorMayorSelec() {
      let comparacion, indice;

      indice = this.numeroAleatorio(0, this.tipoComparacion.length - 1);
      comparacion = this.tipoComparacion[indice];

      return comparacion;
    },
  },
  methods: {
    numeroAleatorio(min, max) {
      return Math.floor(Math.random() * (max - min + 1) + min);
    },
    /* Método para comprobar si la solución es correcta */
    comprobarSeleccion() {
      let puntos = JSON.parse(localStorage.getItem("puntuaciones"));
      this.correctoSelec = false;

      if (this.menorMayorSelec == "menor") {
        if (parseInt(this.selecPropuesta) == this.seleccionSerie[0]) {
          this.correctoSelec = true;
        }
      } else {
        if (
          parseInt(this.selecPropuesta) ==
          this.seleccionSerie[this.seleccionSerie.length - 1]
        ) {
          this.correctoSelec = true;
        }
      }

      //Si acierta, sumamos un punto, paramos el temporizador y mostramos mensaje
      if (this.correctoSelec) {
        puntos[3]++;
        localStorage.setItem("puntuaciones", JSON.stringify(puntos));
        this.emitter.emit("pararTiempo", true);
        this.emitter.emit("puntoConseguido", true);
      }
      return this.correctoSelec;
    },
  },
};
</script>

<style scoped>
#inputNum {
  border: 1px solid black;
  background-color: white;
  width: 3rem;
}
</style>