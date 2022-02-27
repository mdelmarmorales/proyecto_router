<template>
  <form
    v-if="this.acierto1"
    @submit.prevent="this.acierto2 = comprobar(this.numeroVoz2.nombre, num)"
  >
    <p>¿Cómo se escribe el nombre de este número? (con letras)</p>
    <button type="button" @click="speak(this.numeroVoz2.numero)">
      <img class="altavoz" src="@/images/altavoz.png" />
    </button>
    <input v-model="num" />
    <button type="submit">Comprobar</button>
    <img
      class="correcto"
      src="@/images/correcto.png"
      alt="correcto"
      v-if="this.acierto2 === true"
    />
    <img
      class="correcto"
      src="@/images/incorrecto.png"
      alt="correcto"
      v-if="this.acierto2 === false"
    />
  </form>
</template>

<script>
export default {
  name: "Ejecicio2",
  props: {
    numeroVoz: Object,
  },
  data() {
    return {
      correctoVoz: null,
      correcto: null,
      acierto1: null,
    };
  },
    mounted() {
    this.emitter.on("correcto", (correcto) => {
      //this.productoSeleccionado = productoSeleccionado; //Guardamos el valor leído desde otro componente a un dato de éste
      this.acierto1 = correcto;
    });
  },
};
</script>

<style scoped>
.correcto,
.altavoz {
  height: 30px;
}
</style>