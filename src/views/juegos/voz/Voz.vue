<template>
  <div class="row">
    <div id="cuadro_blanco" class="col-10 mx-auto mt-5">
       <div class="row d-flex my-2">
      <Temporizador class="col-1 ml-auto" />
      </div>
      <Ejercicio1 :numeroVoz="numeroVoz" />
      <Ejercicio2 :numeroVoz="numeroVoz" />

      
      <form
        v-if="this.acierto2"
        @submit.prevent="
          this.acierto3 = comprobar(this.numeroVoz3, numero, letras)
        "
      >
        <p>Esucha y escribe con números y con letras</p>
        <button type="button" @click="speak(this.numeroVoz3.numero)">
          <img class="altavoz" src="@/images/altavoz.png" />
        </button>
        <p>Número:</p>
        <input v-model="numero" />
        <p>Letras:</p>
        <input v-model="letras" />
        <button type="submit">Comprobar</button>
        <img
          class="correcto"
          src="@/images/correcto.png"
          alt="correcto"
          v-if="this.acierto3 === true"
        />
        <img
          class="correcto"
          src="@/images/incorrecto.png"
          alt="correcto"
          v-if="this.acierto3 === false"
        />
      </form>
    </div>
  </div>
</template>

<script>
import json from "@/json/listaNumeros.json";
import Temporizador from "@/components/Temporizador.vue";
import Ejercicio1 from "./Ejercicio1.vue";
import Ejercicio2 from "./Ejercicio2.vue";

export default {
  name: "Voz",
  components: { Temporizador, Ejercicio1, Ejercicio2 },
  data() {
    return {
      synth: window.speechSynthesis,
      voices: [],
      speakText: null,
      numeros: json,
      correctoVoz: null,
      correcto: null,
      acierto1: null,
      acierto2: null,
      acierto3: null,
    };
  },
  computed: {
    voiceSelect() {
      return document.querySelector("select");
    },
    inputForm() {
      return document.querySelector("form")[0];
    },
    inputTxt() {
      return document.querySelector(".txt");
    },
    numeroVoz() {
      return this.obtenerNumero();
    },
    numeroVoz2() {
      return this.obtenerNumero();
    },
    numeroVoz3() {
      return this.obtenerNumero();
    },
  },
  beforeMount() {
    //Inicia la API speechSyntheu
    this.populateVoiceList();
    if (speechSynthesis.onvoiceschanged !== undefined) {
      speechSynthesis.onvoiceschanged = this.populateVoiceList;
    }
  },
    mounted() {
    this.emitter.on("numeroVoz", (numeroVoz) => {
      //this.productoSeleccionado = productoSeleccionado; //Guardamos el valor leído desde otro componente a un dato de éste
      this.speak(numeroVoz);
    });
  },
  methods: {
    numeroAleatorio(min, max) {
      return Math.floor(Math.random() * (max - min + 1) + min);
    },
    obtenerNumero() {
      let indice;
      indice = this.numeroAleatorio(0, this.numeros.length - 1);
      console.log(this.numeros[indice]);
      return this.numeros[indice];
    },
    comprobar() {
  
      let acierto = false;
      if (arguments.length == 2) {
        acierto = arguments[0] == arguments[1];
      } else {
        acierto =
          arguments[0].numero == arguments[1] &&
          arguments[0].nombre == arguments[2];
      }
      console.log("acierto " + acierto);
      return acierto;
    },
    //Recuperamos el listado de voces disponibles en la API
    populateVoiceList() {
      this.voices = this.synth.getVoices();
    },
    speak(lectura) {
      if (this.synth.speaking) {
        console.error("Already speaking...");
        return;
      }

      // if (this.inputTxt.value !== "") {
      if (this.numeroVoz !== "") {
        this.speakText = new SpeechSynthesisUtterance(lectura);

        //La voz será la española
        this.speakText.voice = this.voices.filter(
          (voice) => voice.name == "Google español de Estados Unidos"
        )[0];
        this.speakText.rate = 1;
        this.speakText.pitch = 1;

        this.synth.speak(this.speakText);
      }
    },
  },
};
</script>


<style scoped>
.correcto,
.altavoz {
  height: 30px;
}

#cuadro_blanco {
  min-height: 500px;
  width: 90%;
  background-color: #ffffff;
  border: 2px solid blue;
  border-radius: 10px;
}
</style>