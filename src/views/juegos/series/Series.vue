<template>
  <div class="row">
    <div id="cuadro_blanco" class="col-10 mx-auto mt-5">
      <div class="row d-flex my-2">
        <Temporizador class="col-1 ml-auto" />
      </div>
      <div class="mt-2 d-flex flex-column justify-content-around">
        <Ejercicio1 :serieSolucion="serieSolucion" />
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
      tamanyoSerie: 4,
      tiposSerie: ["suma", "resta", "multiplicacion"],
      finTiempo: null,
      correctoSelec: null,
    };
  },
  computed: {
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
      console.log(maximo);
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
    serieSolucion() {
      let serie = [];

      serie = this.construyeSerie();

      return serie;
    },
    seleccionSerie() {
      let seleccion = [];
      seleccion = this.construyeSeleccion();

      return seleccion;
    },
  },
  methods: {
    numeroAleatorio(min, max) {
      return Math.floor(Math.random() * (max - min + 1) + min);
    },
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
          console.log("multi");
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
    construyeSeleccion() {
      let indice,
        tamanyo = 3;

      let seleccion = [];

      for (let i = 0; i < tamanyo; i++) {
        indice = this.numeroAleatorio(0, this.serieSolucion.length - 1);

        while (seleccion.includes(this.serieSolucion[indice])) {
          indice = this.numeroAleatorio(0, this.serieSolucion.length - 1);
        }

        seleccion.push(this.serieSolucion[indice]);
      }
      seleccion = seleccion.sort((a, b) => a - b);

      return seleccion;
    },
    comprobarSeleccion() {
      this.correctoSelec = false;

      if (this.menorMayorSelec == "menor") {
        if (this.selecPropuesta == this.seleccionSerie[0]) {
          this.correctoSelec = true;
        }
      } else {
        console.log(this.seleccionSerie[this.seleccionSerie.length - 1]);
        console.log(this.selecPropuesta);
        if (
          this.selecPropuesta ==
          this.seleccionSerie[this.seleccionSerie.length - 1]
        ) {
          this.correctoSelec = true;
        }
      }
      return this.correctoSelec;
    },
  },
};
</script>

<style scoped>
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
#cuadro_blanco {
  min-height: 500px;
  width: 90%;
  background-color: #ffffff;
  border: 3px solid #071488;
  border-radius: 10px;
}
</style>