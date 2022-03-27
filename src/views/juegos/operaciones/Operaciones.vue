<!-- Radio buttons para seleccionar la operación -->
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
      <div class="row mx-auto my-4 py-2 d-flex justify-content-around">
        <p class="enunciado col-5">¿Qué operación quieres practicar?</p>
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

          <label class="form-check-label mr-5">
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

          <label class="form-check-label mr-5">
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
      <div class="row mx-auto my-4 py-2 d-flex justify-content-around align-items-center">
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
      comienzo:false,
      radio: "",
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
      if(this.comienzo){
        this.emitter.emit("operacionSelec", event.target.value);
      }
      
    },
  },
};
</script>

<style>
#cuadro_blanco {
  min-height: 500px;
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
}
</style>