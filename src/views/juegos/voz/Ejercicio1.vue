<template>
  <form
    @submit.prevent="comprobar(this.numeroVoz.numero, numPropuestoOido)
    "
  >
    <p>Pulsa el icono para escuchar el número y luego escríbelo</p>
    <button type="button" @click="habla(this.numeroVoz.numero)">
      <img class="altavoz" src="@/images/altavoz.png" />
    </button>

    <input v-model="numPropuestoOido" />
    <button type="submit">Comprobar</button>
    <img
      class="correcto"
      src="@/images/correcto.png"
      alt="correcto"
      v-if="this.acierto1 === true"
    />
    <img
      class="correcto"
      src="@/images/incorrecto.png"
      alt="correcto"
      v-if="this.acierto1 === false"
    />
  </form>
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
    //   acierto1: null,
    };
  },
  methods:{
      habla(lectura) {
          this.emitter.emit("numeroVoz", this.numeroVoz.numero);
      },
      comprobar() {
      console.log("solucion" + arguments[0].nombre);
      console.log("solucion" + arguments[0].numero);
      console.log("propuesto" + arguments[1]);
      console.log("propuesto" + arguments[2]);
      this.correcto= false;

      if (arguments.length == 2) {
        this.correcto = arguments[0] == arguments[1];
      } else {
        this.correcto =
          arguments[0].numero == arguments[1] &&
          arguments[0].nombre == arguments[2];
      }

    this.emitter.emit("correcto", this.correcto);
    },
  }
};
</script>

<style scoped>
.correcto,
.altavoz {
  height: 30px;
}
</style>