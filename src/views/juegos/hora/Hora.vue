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
         Elige el reloj correcto en cada ejercicio. Pulsa "Comenzar".
        </p>
      </div>
      <div>
        <EjercicioHora
          :hora="hora1"
          :indiceHora="indiceHora1"
          :horaSeleccionada="horaSeleccionada1"
          :comienzo="comienzo"
          :contadorJuegos="contadorJuegos"
        />
        <EjercicioHora
          :hora="hora2"
          :indiceHora="indiceHora2"
          :horaSeleccionada="horaSeleccionada2"
          :comienzo="comienzo"
          :contadorJuegos="contadorJuegos"
        />
        <EjercicioHora
          :hora="hora3"
          :indiceHora="indiceHora3"
          :horaSeleccionada="horaSeleccionada3"
          :comienzo="comienzo"
          :contadorJuegos="contadorJuegos"
        />
      </div>
    </div>
  </div>
</template>

<script>
/* Importamos el JSON donde están los datos de las horas */
import horasJson from "@/json/horas.json";
import minutosJson from "@/json/minutos.json";
import EjercicioHora from "./EjercicioHora.vue";
import Temporizador from "@/components/Temporizador.vue";

export default {
  name: "Hora",
  components: { EjercicioHora, Temporizador },
  data() {
    return {
      comienzo: false,
      horas: horasJson,
      minutos: minutosJson,
      contadorJuegos: 0, //Juegos finalizados hasta el momento
    };
  },

  computed: {
    /* Calculamos las variables necesarias para los 3 juegos */
    hora1() {
      return this.arrayHoras();
    },
    indiceHora1() {
      return this.numeroAleatorio(0, this.hora1.length - 1);
    },
    hora2() {
      return this.arrayHoras();
    },
    indiceHora2() {
      return this.numeroAleatorio(0, this.hora2.length - 1);
    },
    hora3() {
      return this.arrayHoras();
    },
    indiceHora3() {
      return this.numeroAleatorio(0, this.hora3.length - 1);
    },
    horaSeleccionada1() {
      return this.hora1[this.indiceHora1];
    },
    horaSeleccionada2() {
      return this.hora2[this.indiceHora2];
    },
    horaSeleccionada3() {
      return this.hora3[this.indiceHora3];
    },
  },
  /* Esperamos el número de juegos terminados */
  mounted() {
    this.emitter.on("contadorJuegos", (contadorJuegos) => {
      this.contadorJuegos = contadorJuegos;
    });
  },
  methods: {
    comenzar() {
      this.comienzo = true;
    },
    numeroAleatorio(min, max) {
      return Math.floor(Math.random() * (max - min + 1) + min);
    },
    /* Método para construir una hora */
    obtenerHora() {
      let indiceHora = this.numeroAleatorio(0, this.horas.length - 1);
      let indiceMinutos = this.numeroAleatorio(0, this.minutos.length - 1);
      let hora = this.horas[indiceHora];
      let minuto = this.minutos[indiceMinutos];

      return { hora, minuto };
    },
    /* Método para formar un array de horas */
    arrayHoras() {
      let dato = [];

      for (let i = 0; i < 3; i++) {
        dato.push(this.obtenerHora());
      }

      return dato;
    },
  },
};
</script>

<style scoped>
#cuadro_blanco {
  min-height: 31.25em;
  background-color: #ffffff;
  border: 2px solid #071488;
  border-radius: 10px;
}
.enunciado {
  font-weight: bold;
  background-color: #e0f7f2;
  border: 2px solid #071488;
  border-radius: 10px;
}
</style>