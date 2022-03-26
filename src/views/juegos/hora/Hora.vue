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
      <div>
        <EjercicioHora
          :hora="hora1"
          :indiceHora="indiceHora1"
          :horaSeleccionada="horaSeleccionada1"
          :comienzo="comienzo"
        />
        <EjercicioHora
          :hora="hora2"
          :indiceHora="indiceHora2"
          :horaSeleccionada="horaSeleccionada2"
          :comienzo="comienzo"
        />
        <EjercicioHora
          :hora="hora3"
          :indiceHora="indiceHora3"
          :horaSeleccionada="horaSeleccionada3"
          :ultimo="true"
          :comienzo="comienzo"
        />
      </div>
    </div>
  </div>
</template>

<script>
import horasJson from "@/json/horas.json";
import minutosJson from "@/json/minutos.json";
import EjercicioHora from "./EjercicioHora.vue";
import Temporizador from "@/components/Temporizador.vue";

export default {
  name: "Hora",
  components: { EjercicioHora, Temporizador },
  data() {
    return {
      comienzo:false,
      horas: horasJson,
      minutos: minutosJson,
    };
  },

  computed: {
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
  methods: {
    comenzar() {
      this.comienzo = true;
    },
    numeroAleatorio(min, max) {
      return Math.floor(Math.random() * (max - min + 1) + min);
    },
    obtenerHora() {
      let indiceHora = this.numeroAleatorio(0, this.horas.length - 1);
      let indiceMinutos = this.numeroAleatorio(0, this.minutos.length - 1);
      let hora = this.horas[indiceHora];
      let minuto = this.minutos[indiceMinutos];

      return { hora, minuto };
    },
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
  min-height: 500px;
  background-color: #ffffff;
  border: 2px solid #071488;
  border-radius: 10px;
}
</style>