<template>
  <form @submit.prevent="comprobarHora">
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
export default {
  name: "EjercicioHora",
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
    comprobarHora() {
      this.correcto = false;
      console.log("indiceHOra " + this.indiceHora);
      console.log("Hora Propuesta " + this.horaPropuesta);

      if (this.indiceHora == this.horaPropuesta) {
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