<template>

  <!-- <div>
    <form @submit.prevent="comprobarHora">
      <p>
        ¿Qué reloj marca las {{ this.horaSeleccionada1.hora.nombre }}
        {{ this.horaSeleccionada1.minuto.nombre }}?
      </p>
      <b-form-radio-group>
        <label class="form-check-label">
          <input
            type="radio"
            class="form-check-input"
            v-model="horaPropuesta"
            name="hora1"
            value="0"
          />
          <template v-if="this.horaSeleccionada1.minuto.numero < 35"
            >{{ this.hora1[0].hora.numero }}:{{
              this.hora1[0].minuto.numero
            }}</template
          >
          <template v-else
            >{{ this.hora1[0].hora.numero - 1 }}:{{
              this.hora1[0].minuto.numero
            }}</template
          >
        </label>

        <label class="form-check-label">
          <input
            type="radio"
            class="form-check-input"
            v-model="horaPropuesta"
            name="hora1"
            value="1"
          />
          <template v-if="this.horaSeleccionada1.minuto.numero < 35"
            >{{ this.hora1[1].hora.numero }}:{{
              this.hora1[1].minuto.numero
            }}</template
          >
          <template v-else
            >{{ this.hora1[1].hora.numero - 1 }}:{{
              this.hora1[1].minuto.numero
            }}</template
          >
        </label>

        <label class="form-check-label">
          <input
            type="radio"
            class="form-check-input"
            v-model="horaPropuesta"
            name="hora1"
            value="2"
          />
          <template v-if="this.horaSeleccionada1.minuto.numero < 35"
            >{{ this.hora1[2].hora.numero }}:{{
              this.hora1[2].minuto.numero
            }}</template
          >
          <template v-else
            >{{ this.hora1[2].hora.numero - 1 }}:{{
              this.hora1[2].minuto.numero
            }}</template
          >
        </label>
      </b-form-radio-group>
      <button type="submit">Comprobar</button>
      <img
        class="correcto"
        src="@/images/correcto.png"
        alt="correcto"
        v-if="this.correcto === true"
      />
      <img
        class="correcto"
        src="@/images/incorrecto.png"
        alt="correcto"
        v-if="this.correcto === false"
      />
    </form>
    <form @submit.prevent="comprobarHora">
      <p>
        ¿Qué reloj marca las {{ this.horaSeleccionada2.hora.nombre }}
        {{ this.horaSeleccionada2.minuto.nombre }}?
      </p>
      <b-form-radio-group>
        <label class="form-check-label">
          <input
            type="radio"
            class="form-check-input"
            v-model="horaPropuesta2"
            name="hora2"
            value="0"
          />
          <template v-if="this.horaSeleccionada2.minuto.numero < 35"
            >{{ this.hora2[0].hora.numero }}:{{
              this.hora2[0].minuto.numero
            }}</template
          >
          <template v-else
            >{{ this.hora2[0].hora.numero - 1 }}:{{
              this.hora2[0].minuto.numero
            }}</template
          >
        </label>

        <label class="form-check-label">
          <input
            type="radio"
            class="form-check-input"
            v-model="horaPropuesta2"
            name="hora2"
            value="1"
          />
          <template v-if="this.horaSeleccionada2.minuto.numero < 35"
            >{{ this.hora2[1].hora.numero }}:{{
              this.hora2[1].minuto.numero
            }}</template
          >
          <template v-else
            >{{ this.hora2[1].hora.numero - 1 }}:{{
              this.hora2[1].minuto.numero
            }}</template
          >
        </label>

        <label class="form-check-label">
          <input
            type="radio"
            class="form-check-input"
            v-model="horaPropuesta2"
            name="hora2"
            value="2"
          />
          <template v-if="this.horaSeleccionada2.minuto.numero < 35"
            >{{ this.hora2[2].hora.numero }}:{{
              this.hora2[2].minuto.numero
            }}</template
          >
          <template v-else
            >{{ this.hora2[2].hora.numero - 1 }}:{{
              this.hora2[2].minuto.numero
            }}</template
          >
        </label>
      </b-form-radio-group>
      <button type="submit">Comprobar</button>
      <img
        class="correcto"
        src="@/images/correcto.png"
        alt="correcto"
        v-if="this.correcto === true"
      />
      <img
        class="correcto"
        src="@/images/incorrecto.png"
        alt="correcto"
        v-if="this.correcto === false"
      />
    </form>
  </div> -->
  <div>
  <EjercicioHora :hora="hora1" :indiceHora="indiceHora1" :horaSeleccionada="horaSeleccionada1"/>
  <EjercicioHora :hora="hora2" :indiceHora="indiceHora2" :horaSeleccionada="horaSeleccionada2"/>
  </div>
</template>

<script>
import horasJson from "@/json/horas.json";
import minutosJson from "@/json/minutos.json";
import EjercicioHora from "./EjercicioHora.vue";

export default {
  name: "Hora",
  components: { EjercicioHora },
  data() {
    return {
      horas: horasJson,
      minutos: minutosJson,
      correcto: null,
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

</style>