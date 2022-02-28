<template>
  <div class="row juego mx-3 my-4">
  <form class="col-11 mx-auto my-4 justify-content-around" @submit.prevent="comprobar">
    <p>
      ¿Qué reloj marca las {{ this.horaSeleccionada.hora.nombre }}
      {{ this.horaSeleccionada.minuto.nombre }}?
    </p>
    <b-form-radio-group>
      <label class="form-check-label mr-5" >
        <input
          type="radio"
          class="form-check-input"
          v-model="horaPropuesta"
          name="hora"
          value="0"
        />
        <span class="hora ml-2 mr-6 px-5 py-2" v-if="this.horaSeleccionada.minuto.numero < 35">
          {{ this.hora[0].hora.numero }}:{{ this.hora[0].minuto.numero }}
        </span>
        <span class="hora ml-2 mr-6 px-5 py-2"  v-else>
          {{ this.hora[0].hora.numero - 1 }}:{{ this.hora[0].minuto.numero }}
        </span>
      </label>

      <label class="form-check-label mr-5" >
        <input
          type="radio"
          class="form-check-input"
          v-model="horaPropuesta"
          name="hora"
          value="1"
        />
        <span class="hora mx-2 px-5 py-2"  v-if="this.horaSeleccionada.minuto.numero < 35">
          {{ this.hora[1].hora.numero }}:{{ this.hora[1].minuto.numero }}
        </span>
        <span class="hora mx-2 px-5 py-2"  v-else>
          {{ this.hora[1].hora.numero - 1 }}:{{ this.hora[1].minuto.numero }}
        </span>
      </label>

      <label class="form-check-label mr-5" >
        <input
          type="radio"
          class="form-check-input"
          v-model="horaPropuesta"
          name="hora"
          value="2"
        />
        <span class="hora mx-2 px-5 py-2"  v-if="this.horaSeleccionada.minuto.numero < 35">
          {{ this.hora[2].hora.numero }}:{{ this.hora[2].minuto.numero }}
        </span>
        <span class="hora mx-2 px-5 py-2" v-else>
          {{ this.hora[2].hora.numero - 1 }}:{{ this.hora[2].minuto.numero }}
       </span>
      </label>
    </b-form-radio-group>

    <!-- <Correcto ref="correcto" :propuesto="parseInt(this.horaPropuesta)" :solucion="this.indiceHora" /> -->

    <button class="btn-comprobar mx-2" type="submit">Comprobar</button>
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
  </div>
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

.hora{
  background-color: #e0f7f2;
  border: 2px solid #071488;
  border-radius: 5px;
}

.correcto {
  height: 30px;
}
</style>