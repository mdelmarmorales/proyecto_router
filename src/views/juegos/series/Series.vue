<template>
  <div class="row">
    <div id="cuadro_blanco" class="col-10 mx-auto mt-5">
      <Temporizador />
      <div>
        <Ejercicio1 :serieSolucion="serieSolucion"/>
        <Ejercicio2 :serieSolucion="serieSolucion"/>
        <Ejercicio3 :serieSeleccion="serieSeleccion"/>
       

        
      </div>
    </div>
  </div>
</template>

<script>
import Temporizador from "@/components/Temporizador.vue";
import Ejercicio1 from "./Ejercicio1.vue";
import Ejercicio2 from "./Ejercicio2.vue";

export default {
  name: "Ticket",
  components: { Temporizador, Ejercicio1, Ejercicio2 },
  data() {
    return {
      tamanyoSerie: 4,
      tiposSerie: ["suma", "resta", "multiplicacion"],
      // tipoComparacion: ["menor", "mayor"],
      // correcto: null,
      // correctoComp: null,
      correctoSelec: null,
    };
  },
  computed: {
    tipoSerie() {
      let tipo, indice;

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
    // valorPosicionVacia() {
    //   let indice = this.numeroAleatorio(0, this.serieSolucion.length - 1);
    //   let valor = this.serieSolucion[indice];

    //   return valor;
    // },
    // menorMayor() {
    //   let comparacion, indice;

    //   indice = this.numeroAleatorio(0, this.tipoComparacion.length - 1);
    //   comparacion = this.tipoComparacion[indice];

    //   return comparacion;
    // },
    // menorMayorSelec() {
    //   let comparacion, indice;

    //   indice = this.numeroAleatorio(0, this.tipoComparacion.length - 1);
    //   comparacion = this.tipoComparacion[indice];

    //   return comparacion;
    // },
  },
  methods: {
    numeroAleatorio(min, max) {
      return Math.floor(Math.random() * (max - min + 1) + min);
    },
    construyeSerie() {
      let inicial, paso;
      let serieSolucion = [];

      inicial = this.numeroAleatorio(0, 5);
      paso = this.numeroAleatorio(1, 5);

      switch (this.tipoSerie) {
        case "suma":
          inicial = this.numeroAleatorio(0, 5);
          paso = this.numeroAleatorio(1, 5);

          for (let i = 0; i <= this.tamanyoSerie; i++) {
            if (i == 0) {
              serieSolucion[i] = inicial;
            } else {
              serieSolucion[i] = serieSolucion[i - 1] + paso;
            }
          }
          break;

        case "resta":
          inicial = this.numeroAleatorio(20, 50);
          paso = this.numeroAleatorio(1, 5);

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
          inicial = this.numeroAleatorio(1, 5);
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
  //   comprobarSerie() {
  //     this.correcto = false;

  //     if (this.valorPosicionVacia == this.numPropuesto) {
  //       this.correcto = true;
  //     }
  //   },
    // comprobarComparacion() {
    //   this.correctoComp = false;

    //   this.serieSolucion = this.serieSolucion.sort((a, b) => a - b);

    //   if (this.menorMayor == "menor") {
    //     if (this.comparacionPropuesta == this.serieSolucion[0]) {
    //       this.correctoComp = true;
    //     }
    //   } else {
    //     if (
    //       this.comparacionPropuesta ==
    //       this.serieSolucion[this.serieSolucion.length - 1]
    //     ) {
    //       this.correctoComp = true;
    //     }
    //   }
    // },
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