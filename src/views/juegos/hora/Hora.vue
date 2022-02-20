<template>
  <div class="row">
  <div id="cuadro_blanco" class="col-10 mx-auto mt-5">
<Temporizador />
  <div>
  <EjercicioHora :hora="hora1" :indiceHora="indiceHora1" :horaSeleccionada="horaSeleccionada1"/>
  <EjercicioHora :hora="hora2" :indiceHora="indiceHora2" :horaSeleccionada="horaSeleccionada2"/>
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
  components: { EjercicioHora,
  Temporizador },
  data() {
    return {
      horas: horasJson,
      minutos: minutosJson,
      // correcto: null,
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
    horaSeleccionada1() {
      return this.hora1[this.indiceHora1];
    },
    horaSeleccionada2() {
      return this.hora2[this.indiceHora2];
    },
  },
  methods: {
    numeroAleatorio(min, max) {
      return Math.floor(Math.random() * (max - min + 1) + min);
    },
    obtenerHora() {
      let indiceHora = this.numeroAleatorio(0, this.horas.length - 1);
      let indiceMinutos = this.numeroAleatorio(0, this.minutos.length - 1);
      let hora = this.horas[indiceHora];
      let minuto = this.minutos[indiceMinutos];
      console.log("indiceMinutos " + indiceMinutos);

      return { hora, minuto };
    },
    arrayHoras() {
      let dato = [];

      for (let i = 0; i < 3; i++) {
        dato.push(this.obtenerHora());
      }

      return dato;
    },
    // comprobarHora() {
    //   this.correcto = false;

    //   if (this.indiceHora1 == this.horaPropuesta) {
    //     this.correcto = true;
    //   }
    // },
  },
};
</script>

<style scoped>
#cuadro_blanco {
  min-height: 500px;
  width: 90%;
  background-color: #ffffff;
  border: 2px solid blue;
  border-radius: 10px;
}

</style>