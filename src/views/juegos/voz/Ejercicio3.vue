<template>
  <div v-if="this.acierto2" class="row juego mx-3 my-4">
    <form
      class="col-9 mx-auto my-2"
      @submit.prevent="comprobar(this.numeroVoz, parseInt(numero), letras)"
    >
      <div class="row justify-content-center">
        <p>Escucha y escribe con números y con letras</p>
      </div>
      <div class="row justify-content-center">
        <button
          class="mr-5"
          type="button"
          @click="habla(this.numeroVoz.numero)"
        >
          <img class="altavoz p-1" src="@/images/altavoz.png" />
        </button>
        <p class="my-auto">Número:</p>
        <input class="col-1 mx-2" v-model="numero" />
        <p class="my-auto ml-3 mr-2">Letras:</p>
        <input col="col-4 mx-2" v-model="letras" />
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
  name: "Ejecicio3",
  props: {
    numeroVoz: Object,
  },
  data() {
    return {
      correctoVoz: null,
      correcto: null,
      acierto2: null,
    };
  },
  mounted() {
    //Esperamos el evento que indique que ha acertado el segundo juego
    this.emitter.on("correcto2", (correcto) => {
      this.acierto2 = correcto;
    });
  },
  methods: {
    // Método que pasa el nº al padre para que lo reproduzca */
    habla(lectura) {
      this.emitter.emit("numeroVoz", this.numeroVoz.numero);
    },
    /* Método para comprobar la respuesta*/
    comprobar() {
      let puntos = JSON.parse(localStorage.getItem("puntuaciones"));

      this.correcto =
        arguments[0].numero == arguments[1] &&
        arguments[0].nombre == arguments[2].toLowerCase();

      if (this.correcto) {
        //Si acierta, sumamos un punto, paramos el temporizador y mostramos mensaje
        puntos[4]++;
        localStorage.setItem("puntuaciones", JSON.stringify(puntos));
        this.emitter.emit("pararTiempo", true);
        this.emitter.emit("puntoConseguido", true);
      }
    },
  },
};
</script>

<style scoped>
.altavoz {
  height: 1.875em;
}
</style>