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
         Completa las series y luego elige el número correcto. Pulsa "Comenzar".
        </p>
      </div>
      <div class="mt-2 d-flex flex-column justify-content-around">
        <Ejercicio1 v-if="this.comienzo" :serieSolucion="serieSolucion" />
        <Ejercicio2 :serieSolucion="serieSolucion" />
        <Ejercicio3 :seleccionSerie="seleccionSerie" />
      </div>
    </div>
  </div>
</template>

<script>
import Temporizador from "@/components/Temporizador.vue";
import Ejercicio1 from "./Ejercicio1.vue";
import Ejercicio2 from "./Ejercicio2.vue";
import Ejercicio3 from "./Ejercicio3.vue";

export default {
  name: "Ticket",
  components: { Temporizador, Ejercicio1, Ejercicio2, Ejercicio3 },
  data() {
    return {
      comienzo:false,
      tamanyoSerie: 4,
      tiposSerie: ["suma", "resta", "multiplicacion"],
      finTiempo: null,
      correctoSelec: null,
      edad: localStorage.getItem("edadNinyo")
    };
  },
  computed: {
    // Variable que varía en función de la edad del niño
    max() {
      let maximo;

      if (this.edad <= 6) {
        maximo = 3;
      } else {
        if (this.edad <= 8) {
          maximo = 6;
        } else {
          if (this.edad <= 10) {
            maximo = 10;
          } else {
            maximo = 15;
          }
        }
      }
      return maximo;
    },
    tipoSerie() {
      let tipo, indice, maxTipos;

      if (this.edad <= 8) {
        maxTipos = 0;
      } else {
        if (this.edad <= 10) {
          maxTipos = 1;
        } else {
          maxTipos = 2;
        }
      }

      indice = this.numeroAleatorio(0, this.tiposSerie.length - 1);
      tipo = this.tiposSerie[indice];

      return tipo;
    },
    // Solución de la serie
    serieSolucion() {
      let serie = [];

      serie = this.construyeSerie();

      return serie;
    },
    // Seleccionamos varios números de la selección anterior
    seleccionSerie() {
      let seleccion = [];
      seleccion = this.construyeSeleccion();

      return seleccion;
    },
  },
  methods: {
     comenzar() {
      this.comienzo = true;
    },
    numeroAleatorio(min, max) {
      return Math.floor(Math.random() * (max - min + 1) + min);
    },
    /* Método para construir la serie, ya sea sumando, restando
    o multiplicando el número anterior */
    construyeSerie() {
      let inicial, paso;
      let serieSolucion = [];

      switch (this.tipoSerie) {
        case "suma":
          inicial = this.numeroAleatorio(0, this.max);
          paso = this.numeroAleatorio(1, this.max);

          for (let i = 0; i <= this.tamanyoSerie; i++) {
            if (i == 0) {
              serieSolucion[i] = inicial;
            } else {
              serieSolucion[i] = serieSolucion[i - 1] + paso;
            }
          }
          break;

        case "resta":
          inicial = this.numeroAleatorio(this.max * 4, this.max * 6);
          paso = this.numeroAleatorio(1, this.max);

          for (let i = 0; i <= this.tamanyoSerie; i++) {
            if (i == 0) {
              serieSolucion[i] = inicial;
            } else {
              serieSolucion[i] = serieSolucion[i - 1] - paso;
            }
          }
          break;

        case "multiplicacion":
          inicial = this.numeroAleatorio(1, this.max);
          paso = this.numeroAleatorio(2, 3);

          for (let i = 0; i <= this.tamanyoSerie; i++) {
            if (i == 0) {
              serieSolucion[i] = inicial;
            } else {
              serieSolucion[i] = serieSolucion[i - 1] * paso;
            }
          }
          break;

        default:
          console.log("Ha ocurrido un error");
          break;
      }
      return serieSolucion;
    },
    /* Método para extraer algunos números de la serie */
    construyeSeleccion() {
      let indice,
        tamanyo = 3; //Seleccionamos 3 números de la serie

      let seleccion = [];

      for (let i = 0; i < tamanyo; i++) {
        indice = this.numeroAleatorio(0, this.serieSolucion.length - 1);

        /*Si un nº ya está en la selección, volvemos a calcular el índice
        para sacar otro número de la serie */
        while (seleccion.includes(this.serieSolucion[indice])) {
          indice = this.numeroAleatorio(0, this.serieSolucion.length - 1);
        }

        //Cuando encontremos un nº no repetido lo incluimos en la selección
        seleccion.push(this.serieSolucion[indice]);
      }

      //Ordenamos la selección
      seleccion = seleccion.sort((a, b) => a - b);

      return seleccion;
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

.numero {
  border: 1px solid black;
  background-color: white;
}

/* .correcto,
.flecha {
  height: 1.875em;
} */
/* #cuadro_blanco {
  min-height: 31.25em;
  width: 90%;
  background-color: #ffffff;
  border: 3px solid #071488;
  border-radius: 10px;
} */
/* .enunciado {
  font-weight: bold;
  background-color: #e0f7f2;
  border: 2px solid #071488;
  border-radius: 10px;
} */
</style>