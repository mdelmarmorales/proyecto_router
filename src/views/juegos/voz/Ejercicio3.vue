<template>
  <div v-if="this.acierto2" class="row juego mx-3 my-4">
    <form
      class="col-9 mx-auto my-4"
      @submit.prevent="comprobar(this.numeroVoz, numero, letras)"
    >
      <div class="row justify-content-center">
        <p>Escucha y escribe con números y con letras</p>
        </div>
         <div class="row justify-content-center">
        <button class="mr-5" type="button" @click="habla(this.numeroVoz.numero)">
          <img class="altavoz" src="@/images/altavoz.png" />
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
    this.emitter.on("correcto2", (correcto) => {
      
      this.acierto2 = correcto;
    });
  },
  methods: {
    habla(lectura) {
      this.emitter.emit("numeroVoz", this.numeroVoz.numero);
    },
    comprobar() {
      this.correcto =
        arguments[0].numero == arguments[1] &&
        arguments[0].nombre == arguments[2].toLowerCase();
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
.correcto,
.altavoz {
  height: 30px;
}
</style>