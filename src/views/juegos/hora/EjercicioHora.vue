<template>
  <form @submit.prevent="comprobar">
    <p>
      ¿Qué reloj marca las {{ this.horaSeleccionada.hora.nombre }}
      {{ this.horaSeleccionada.minuto.nombre }}?
    </p>
    <b-form-radio-group>
      <label class="form-check-label">
        <input
          type="radio"
          class="form-check-input"
          v-model="horaPropuesta"
          name="hora"
          value="0"
        />
        <template v-if="this.horaSeleccionada.minuto.numero < 35">
          {{ this.hora[0].hora.numero }}:{{ this.hora[0].minuto.numero }}
        </template>
        <template v-else>
          {{ this.hora[0].hora.numero - 1 }}:{{ this.hora[0].minuto.numero }}
        </template>
      </label>

      <label class="form-check-label">
        <input
          type="radio"
          class="form-check-input"
          v-model="horaPropuesta"
          name="hora"
          value="1"
        />
        <template v-if="this.horaSeleccionada.minuto.numero < 35">
          {{ this.hora[1].hora.numero }}:{{ this.hora[1].minuto.numero }}
        </template>
        <template v-else>
          {{ this.hora[1].hora.numero - 1 }}:{{ this.hora[1].minuto.numero }}
        </template>
      </label>

      <label class="form-check-label">
        <input
          type="radio"
          class="form-check-input"
          v-model="horaPropuesta"
          name="hora"
          value="2"
        />
        <template v-if="this.horaSeleccionada.minuto.numero < 35">
          {{ this.hora[2].hora.numero }}:{{ this.hora[2].minuto.numero }}
        </template>
        <template v-else>
          {{ this.hora[2].hora.numero - 1 }}:{{ this.hora[2].minuto.numero }}
        </template>
      </label>
    </b-form-radio-group>

    <!-- <Correcto ref="correcto" :propuesto="parseInt(this.horaPropuesta)" :solucion="this.indiceHora" /> -->

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
</template>

<script>
// import Correcto from "@/components/Correcto.vue";
export default {
  name: "EjercicioHora",
  // components: { Correcto },
  data() {
    return {
      correcto: null,
    };
  },
  props: {
    hora: Array,
    indiceHora: Number,
    horaSeleccionada: Object,
  },
  methods: {
    comprobar() {
      this.correcto = false;

      if (parseInt(this.horaPropuesta) == this.indiceHora) {
        this.correcto = true;
      }
    },
  },
};
</script>

<style scoped>
.correcto {
  height: 30px;
}
</style>