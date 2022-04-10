<template>
  <div class="row juego mx-3 my-4">
    <form
      class="col-9 mx-auto my-2"
      @submit.prevent="comprobar(this.numeroVoz.numero, parseInt(numPropuestoOido))"
    >
      <div class="row justify-content-center">
        <p>Pulsa el icono para escuchar el número y luego escríbelo</p>
      </div>
      <div class="row justify-content-center">
        <button
          class="mr-5"
          type="button"
          @click="habla(this.numeroVoz.numero)"
        >
          <img class="altavoz p-1" src="@/images/altavoz.png" />
        </button>

        <input class="col-1 mx-2" v-model="numPropuestoOido" />
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
      </div>
    </form>
  </div>
</template>

<script>
export default {
  name: "Ejecicio1",
  props: {
    numeroVoz: Object,
  },
  data() {
    return {
      correctoVoz: null,
      correcto: null,
    };
  },
  methods: {
    // Método que pasa el nº al padre para que lo reproduzca */
    habla(lectura) {
      this.emitter.emit("numeroVoz", this.numeroVoz.numero);
    },
    /* Método para comprobar la respuesta y emitir un evento para mostrar el segundo ejercicio */
    comprobar() {
      this.correcto = arguments[0] == arguments[1];

      this.emitter.emit("correcto", this.correcto);
    },
  },
};
</script>

<style scoped>
.altavoz {
  height: 1.875em;
}
</style>