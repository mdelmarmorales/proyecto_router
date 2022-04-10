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
          Elige la operación y luego sigue las instrucciones. Pulsa "Comenzar".
        </p>
      </div>
      <div
        v-if="this.comienzo"
        class="row mx-auto my-4 py-2 d-flex justify-content-around"
      >
        <!-- <p class="pregunta col-5">¿Qué operación quieres practicar?</p> -->
        <!-- Radio buttons para seleccionar la operación -->
        <b-form-radio-group class="col-6">
          <label class="form-check-label mr-5">
            <input
              type="radio"
              class="form-check-input"
              v-model="radio"
              name="grupoOperaciones"
              value="suma"
              @change="onChange($event)"
            />
            Sumar
          </label>

          <label class="form-check-label mr-5">
            <input
              type="radio"
              class="form-check-input"
              v-model="radio"
              name="grupoOperaciones"
              value="resta"
              @change="onChange($event)"
            />
            Restar
          </label>

          <!-- Sólo aparece si el niño es mayor de 8 años -->
          <label class="form-check-label mr-5" v-if="this.edad >= 8">
            <input
              type="radio"
              class="form-check-input"
              v-model="radio"
              name="grupoOperaciones"
              value="multiplicacion"
              @change="onChange($event)"
            />
            Multiplicar
          </label>

          <!-- Sólo aparece si el niño es mayor de 8 años -->
          <label class="form-check-label mr-5" v-if="this.edad >= 8">
            <input
              type="radio"
              class="form-check-input"
              v-model="radio"
              name="grupoOperaciones"
              value="division"
              @change="onChange($event)"
            />
            Dividir
          </label>
        </b-form-radio-group>
      </div>
      <div
        class="
          row
          mx-auto
          my-4
          py-2
          d-flex
          justify-content-around
          align-items-center
        "
      >
        <Calculadora />
        <Manzanas />
      </div>
    </div>
  </div>
</template>

<script>
import Calculadora from "./Calculadora.vue";
import Manzanas from "./Manzanas.vue";
import Temporizador from "@/components/Temporizador.vue";

export default {
  name: "Operaciones",
  components: { Calculadora, Manzanas, Temporizador },
  data() {
    return {
      comienzo: false,
      radio: "",
      edad: localStorage.getItem("edadNinyo"),
    };
  },
  methods: {
    /**
     * Método que pasa a través del bus de eventos la operación seleccionada
     */
    comenzar() {
      this.comienzo = true;
    },
    onChange(event) {
      if (this.comienzo) {
        this.emitter.emit("operacionSelec", event.target.value);
      }
    },
  },
};
</script>

<style scoped>
/* #cuadro_blanco {
  min-height: 31.25em;
  width: 90%;
  background-color: #ffffff;
  border: 2px solid #071488;
  border-radius: 10px;
}

.juego {
  background-color: #faea7d;
  border: 2px solid #071488;
  border-radius: 15px;
}

.enunciado {
  font-weight: bold;
  background-color: #e0f7f2;
  border: 2px solid #071488;
  border-radius: 10px;
} */
</style>