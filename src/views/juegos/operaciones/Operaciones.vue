<template>
<div>
  <div class="custom-control custom-radio">
    <input
      type="radio"
      v-model="radio"
      class="custom-control-input"
      name="grupoOperaciones"
      id="suma"
      value="suma"
      @change="onChange($event)"
    />
    <label class="custom-control-label">Sumar</label>
    <input
      type="radio"
      v-model="radio"
      class="custom-control-input"
      name="grupoOperaciones"
      id="resta"
      value="resta"
      @change="onChange($event)"
    />
    <label class="custom-control-label">Restar</label>
    <input
      type="radio"
      v-model="radio"
      class="custom-control-input"
      name="grupoOperaciones"
      id="multiplicacion"
      value="multiplicacion"
      @change="onChange($event)"
    />
    <label class="custom-control-label">Multiplicar</label>
    <input
      type="radio"
      v-model="radio"
      class="custom-control-input"
      name="grupoOperaciones"
      id="division"
      value="division"
      @change="onChange($event)"
    />
    <label class="custom-control-label">Dividir</label>
  </div>
  <div class="mt-3">
    Selected: <strong>{{ radio }}</strong>
  </div>
  <Calculadora/>
  </div>
</template>

<script>
import Calculadora from "./Calculadora.vue";
export default {
  name: "Operaciones",
  components:{Calculadora},
  data() {
    return {
      radio: "",
    };
  },
  methods: {
    onChange(event) {
      this.emitter.emit("operacionSelec", event.target.value);
    },
  },
};
</script>