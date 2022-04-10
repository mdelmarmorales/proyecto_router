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
      <Ejercicio1 v-if="this.comienzo" :numeroVoz="numeroVoz" />
      <Ejercicio2 :numeroVoz="numeroVoz2" />
      <Ejercicio3 :numeroVoz="numeroVoz3" />
    </div>
  </div>
</template>

<script>
import json from "@/json/listaNumeros.json"; //Importamos el JSON con la lista de números
import Temporizador from "@/components/Temporizador.vue";
import Ejercicio1 from "./Ejercicio1.vue";
import Ejercicio2 from "./Ejercicio2.vue";
import Ejercicio3 from "./Ejercicio3.vue";

export default {
  name: "Voz",
  components: { Temporizador, Ejercicio1, Ejercicio2, Ejercicio3 },
  data() {
    return {
      comienzo: false,
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
    // Variable que varía en función de la edad del niño
    max() {
      let maximo;
      let edad = localStorage.getItem("edadNinyo");

      if (edad <= 6) {
        maximo = 10;
      } else {
        if (edad <= 8) {
          maximo = 30;
        } else {
          if (edad <= 10) {
            maximo = 50;
          } else {
            maximo = 100;
          }
        }
      }
      return maximo;
    },
    //Seleccionamos un nº diferente para cada juego
     numeroVoz() {
      return this.obtenerNumero();
    },
    numeroVoz2() {
      return this.obtenerNumero();
    },
    numeroVoz3() {
      return this.obtenerNumero();
    },
    /* Extraemos los elementos necesarios para la Web Speech API */
    voiceSelect() {
      return document.querySelector("select");
    },
    inputForm() {
      return document.querySelector("form")[0];
    },
    inputTxt() {
      return document.querySelector(".txt");
    },
   
  },
  beforeMount() {
    //Inicia la Web Speech API
    this.populateVoiceList();
    if (speechSynthesis.onvoiceschanged !== undefined) {
      speechSynthesis.onvoiceschanged = this.populateVoiceList;
    }
  },
  mounted() {
    this.emitter.on("numeroVoz", (numeroVoz) => {
      this.speak(numeroVoz);
    });
  },
  methods: {
    comenzar() {
      this.comienzo = true;
    },
    numeroAleatorio(min, max) {
      return Math.floor(Math.random() * (max - min + 1) + min);
    },
    /* Obtenemos un números aleatorio del listado */
    obtenerNumero() {
      let indice;
      indice = this.numeroAleatorio(0, this.numeros.length - 1);
      return this.numeros[indice];
    },
    /* Comprobamos si la respuesta es correcta */
    // comprobar() {
    //   let acierto = false;
    //   if (arguments.length == 2) {
    //     acierto = arguments[0] == arguments[1];
    //   } else {
    //     acierto =
    //       arguments[0].numero == arguments[1] &&
    //       arguments[0].nombre == arguments[2];
    //   }
    //   return acierto;
    // },
    //Recuperamos el listado de voces disponibles en la API
    populateVoiceList() {
      this.voices = this.synth.getVoices();
    },
    /* Método que permite reproducir el texto */
    speak(lectura) {
      if (this.synth.speaking) {
        console.error("Already speaking...");
        return;
      }

      if (this.numeroVoz !== "") {
        this.speakText = new SpeechSynthesisUtterance(lectura);

        //Seleccionamos la voz española
        this.speakText.voice = this.voices.filter(
          (voice) => voice.name == "Google español de Estados Unidos"
        )[0];
        /* Variables para definir la velocidad y el tono de la voz */
        this.speakText.rate = 1;
        this.speakText.pitch = 1;

        this.synth.speak(this.speakText);
      }
    },
  },
};
</script>


<style scoped>

.altavoz {
  height: 30px;
}

/* #cuadro_blanco {
  min-height: 500px;
  width: 90%;
  background-color: #ffffff;
  border: 2px solid #071488;
  border-radius: 10px;
} */
</style>