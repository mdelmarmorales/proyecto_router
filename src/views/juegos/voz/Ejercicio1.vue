<template>
  <div class="row juego mx-3 my-4">
    <form
      class="col-9 mx-auto my-4"
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
          <img class="altavoz" src="@/images/altavoz.png" />
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
    habla(lectura) {
      this.emitter.emit("numeroVoz", this.numeroVoz.numero);
    },
    comprobar() {
      this.correcto = arguments[0] == arguments[1];

      this.emitter.emit("correcto", this.correcto);
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
   border-radius: 5px;
  width: 100px;
  height:40px;
}
.correcto,
.altavoz {
  height: 30px;
}
</style>