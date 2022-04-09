<template>
<div v-if="this.acierto1" class="row juego mx-3 my-4">
  <form class="col-9 mx-auto my-2"
    
    @submit.prevent="comprobar(this.numeroVoz.nombre, numPropuestoOido)"
  >
  <div class="row justify-content-center">
    <p>¿Cómo se escribe el nombre de este número? (con letras)</p>
    </div>
    <div class="row justify-content-center">
    <button class="mr-5" type="button" @click="habla(this.numeroVoz.numero)">
      <img class="altavoz p-1" src="@/images/altavoz.png" />
    </button>
    <input  col="col-4 mx-2 text-center" type="text" v-model="numPropuestoOido" />
    <button class="btn-comprobar mx-2"  type="submit">Comprobar</button>
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
    //Esperamos el evento que indique que ha acertado el primer juego
    this.emitter.on("correcto", (correcto) => {
      
      this.acierto1 = correcto;
    });
  },
  methods: {
    // Método que pasa el nº al padre para que lo reproduzca */
    habla(lectura) {
      this.emitter.emit("numeroVoz", this.numeroVoz.numero);
    },
    /* Método para comprobar la respuesta y emitir un evento para mostrar el tercer ejercicio */
    comprobar() {
      this.correcto = arguments[0] == arguments[1].toLowerCase();
      this.emitter.emit("correcto2", this.correcto);
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
  width: 6.25em;
  height:2.5em;
}

.correcto,
.altavoz {
  height: 1.875em;
}
</style>