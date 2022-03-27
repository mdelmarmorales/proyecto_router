<template>
  <div class="row mt-3">
    <div
      id="pregunta"
      class="col-10 mx-auto"
    >
      <p class="my-auto py-2">
        En la granja hay muchos animales. Cuenta cuántas veces aparece éste:
        <span>{{ this.animalABuscar.nombre }}</span>
      </p>
    
    </div>
  </div>
  <div class="row">
    <div id="cuadro_granja" class="col-10 mx-auto my-3">
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
      <img
        id="animal"
        :src="imagenAMostrar.imagen"
        :alt="imagenAMostrar.nombre"
      />
    </div>
  </div>
</template>


<script>
import Temporizador from "@/components/Temporizador.vue";

export default {
  name: "Granja",
  components: { Temporizador },
  data() {
    return {
      comienzo: false,
      intervalID: null,
      animalABuscar: [],
      numAnimales: "",
      opacidad: 0,
      aumentarOpacidad: true,
      imagenAMostrar: [],
      correcto: null,
      listaAnimales: [
        {
          imagen: require("@/images/burro.png"),
          nombre: "Burro",
          contador: 0,
        },
        {
          imagen: require("@/images/cerdo.png"),
          nombre: "Cerdo",
          contador: 0,
        },
        {
          imagen: require("@/images/conejo.png"),
          nombre: "Conejo",
          contador: 0,
        },
        {
          imagen: require("@/images/gallina.png"),
          nombre: "Gallina",
          contador: 0,
        },
        {
          imagen: require("@/images/gato.png"),
          nombre: "Gato",
          contador: 0,
        },
        {
          imagen: require("@/images/oveja.png"),
          nombre: "Oveja",
          contador: 0,
        },
        {
          imagen: require("@/images/pato.png"),
          nombre: "Pato",
          contador: 0,
        },
        {
          imagen: require("@/images/perro.png"),
          nombre: "Perro",
          contador: 0,
        },
        {
          imagen: require("@/images/raton.png"),
          nombre: "Raton",
          contador: 0,
        },
        {
          imagen: require("@/images/vaca.png"),
          nombre: "Vaca",
          contador: 0,
        },
      ],
    };
  },
  beforeMount() {
    this.eligeAnimal();
  },
  mounted() {
    /* Cuando el tiempo finaliza, detenemos el temporizador */
    this.emitter.on("finTiempo", (finTiempo) => {
      console.log("fin");
      clearInterval(this.intervalID);
      this.emitter.emit("finGranja", this.animalABuscar);
    });
  },
  methods: {
    comenzar() {
      this.comienzo=true;
      this.intervalID=setInterval(this.cambiaOpacidad, 100);
    },
    eligeAnimal() {
      let indice;

      indice = this.numeroAleatorio(0, this.listaAnimales.length - 1);
      this.animalABuscar = this.listaAnimales[indice];
    },
    cambiaOpacidad() {
       let img = document.getElementById("animal");
       
      //Aprovechamos el momento en que la imagen no se ve para cargar una nueva
      if (this.opacidad <= 0) {
        this.muestraImagen();
      }

      /*La opacidad irá aumentando hasta que llegue a 1,3. Entonces pondremos el flag
      a false para indicar que debe empezar a disminuir. Se lleva hasta 1,3 para que 
      el dibujo permanezca un poco más en la pantalla y el niño tenga tiempo suficiente
      para verlo.
      Cuando llegue a 0 haremos lo contrario, pondremos el flag a true para indicar
      que debe empezar a aumentar */
      if (this.aumentarOpacidad) {
        this.opacidad = this.opacidad + 0.05;
          if (this.opacidad >= 1.3) {
          this.aumentarOpacidad = false;
        }
      } else {
        this.opacidad = this.opacidad - 0.05;
        if (this.opacidad <= 0) {
          this.aumentarOpacidad = true;
        }
      }
      // Aplicamos la nueva opacidad a la imagen
      img.style.opacity = this.opacidad;
    },
    numeroAleatorio(min, max) {
      return Math.floor(Math.random() * (max - min + 1) + min);
    },
    muestraImagen() {
      let indice;

      //Selecionamos una imagen al azar entre todas las del array
      indice = this.numeroAleatorio(0, this.listaAnimales.length - 1);
      this.imagenAMostrar = this.listaAnimales[indice];

      this.imagenAMostrar.contador = this.imagenAMostrar.contador + 1;

      //Calculamos su posición
      this.posicionImagen();
    },
    posicionImagen() {
      let img = document.getElementById("animal");

      let x, y;

      x = this.numeroAleatorio(-700, 700);
      y = this.numeroAleatorio(-50, 330);

      img.style.marginLeft = `${x}px`;
      img.style.marginTop = `${y}px`;

      if (-50 < y && y < 100) {
        img.style.transform = "scale(0.7)";
      } else {
        if (100 < y && y < 200) {
          img.style.transform = "scale(0.9)";
        } else {
          img.style.transform = "scale(1.2)";
        }
      }
    },
    // comprobarAnimales() {
    //   this.correcto = false;
    //   let puntos = JSON.parse(localStorage.getItem("puntuaciones"));

    //   if (parseInt(this.numAnimales) === this.animalABuscar.contador) {
    //     this.correcto = true;
    //     puntos[2]++;
    //     localStorage.setItem("puntuaciones", JSON.stringify(puntos));
    //     this.emitter.emit("pararTiempo", true);
    //     this.emitter.emit("puntoConseguido", true);
    //   }
    // },
  },
};
</script>

<style scoped>
img {
  position: relative;
  height: 100px;
}

.correcto {
  height: 50px;
}
#cuadro_granja {
  height: 500px;
  background-color: #ffffff;
  border: 2px solid #071488;
  border-radius: 10px;
  background-image: url("../../../images/fondo_granja.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-position: center;
}

#pregunta {
  background-color: #e0f7f2;
  border: 2px solid #071488;
  border-radius: 10px;
}

.btn-comprobar {
  background-color: #3fcfba;
  border: 2px solid #071488;
  border-radius: 5px;
  width: 100px;
  height: 40px;
}

span {
  font-weight: bold;
}
</style>