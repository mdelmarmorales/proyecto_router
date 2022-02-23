<template>
  <div class="row juego mx-3 d-flex">
    <form class="col-9 mx-auto p-3" @submit.prevent="comprobarSerie">
      <div class="row">
        <!-- Recorremos el array. Si hay un número, lo escribirmos.
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
    tipoSerie() {
      let tipo, indice;

      indice = this.numeroAleatorio(0, this.tiposSerie.length - 1);
      tipo = this.tiposSerie[indice];

      return tipo;
    },
    // serieSolucion() {
    //   let serie = [];

    //   serie = this.construyeSerie();

    //   return serie;
    // },
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
    // construyeSerie() {
    //   let inicial, paso;
    //   let serieSolucion = [];

    //   inicial = this.numeroAleatorio(0, 5);
    //   paso = this.numeroAleatorio(1, 5);

    //   switch (this.tipoSerie) {
    //     case "suma":
    //       inicial = this.numeroAleatorio(0, 5);
    //       paso = this.numeroAleatorio(1, 5);

    //       for (let i = 0; i <= this.tamanyoSerie; i++) {
    //         if (i == 0) {
    //           serieSolucion[i] = inicial;
    //         } else {
    //           serieSolucion[i] = serieSolucion[i - 1] + paso;
    //         }
    //       }
    //       break;

    //     case "resta":
    //       inicial = this.numeroAleatorio(20, 50);
    //       paso = this.numeroAleatorio(1, 5);

    //       for (let i = 0; i <= this.tamanyoSerie; i++) {
    //         if (i == 0) {
    //           serieSolucion[i] = inicial;
    //         } else {
    //           serieSolucion[i] = serieSolucion[i - 1] - paso;
    //         }
    //       }
    //       break;

    //     case "multiplicacion":
    //       console.log("multi");
    //       inicial = this.numeroAleatorio(1, 5);
    //       paso = this.numeroAleatorio(2, 3);

    //       for (let i = 0; i <= this.tamanyoSerie; i++) {
    //         if (i == 0) {
    //           serieSolucion[i] = inicial;
    //         } else {
    //           serieSolucion[i] = serieSolucion[i - 1] * paso;
    //         }
    //       }
    //       break;

    //     default:
    //       console.log("Ha ocurrido un error");
    //       break;
    //   }

    //   return serieSolucion;
    // },
    comprobarSerie() {
      this.correcto = false;

      if (this.valorPosicionVacia == this.numPropuesto) {
        this.correcto = true;
      }

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
  border-radius: 10px;
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