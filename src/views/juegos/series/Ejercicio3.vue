<template>
  <div
    v-if="this.correcto"
    class="row juego mx-3 my-4 d-flex justify-content-around align-items-center"
  >
    <form class="col-9 mx-auto p-3" @submit.prevent="comprobarSeleccion">
      <div
        class="row d-flex flex-row justify-content-around align-items-center"
      >
        <p>
          Entre estos números:
          <span v-for="num in seleccionSerie" v-bind:key="num"
            >{{ num }},
          </span>
          ¿cuál es el {{ this.menorMayorSelec }}?
        </p>
        <input class="form-control col-2" v-model="selecPropuesta" />
        <button class="btn-comprobar" type="submit">Comprobar</button>
      </div>
    </form>
    <img
      class="correcto"
      src="@/images/correcto.png"
      alt="correcto"
      v-if="this.correctoSelec === true"
    />
    <img
      class="correcto"
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
  mounted() {
    this.emitter.on("correctoComp", (correctoComp) => {
      this.correcto = correctoComp;
    });
  },
  computed: {
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
    comprobarSeleccion() {
      let puntos= JSON.parse(localStorage.getItem("puntuaciones"));
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
          puntos[3]++;
          localStorage.setItem("puntuaciones", JSON.stringify(puntos));
          this.emitter.emit("pararTiempo", true);
          this.emitter.emit("puntoConseguido", true);
        }
      }
      return this.correctoSelec;
    },
  },
};
</script>

<style>
</style>