<template>
<div>
  <div class="row">
  <div id="cuadro_blanco" class="col-10 mx-auto mt-5">
  <Temporizador />
    <img
      id="animal"
      :src="imagenAMostrar.imagen"
      :alt="imagenAMostrar.nombre"
    />
    <form @submit.prevent="comprobarAnimales">
      <p>¿Cuántas veces ha aparecido este animal? {{this.animalABuscar.nombre}}</p>
               <!-- ¿Quitar este div ? -->
        <input v-model="numAnimales" />
        <button type="submit">Comprobar</button>
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
        </form>
        </div>
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
          imagen: require("@/images/caballo.png"),
          nombre: "Caballo",
          contador: 0,
        },
        {
          imagen: require("@/images/cabra.png"),
          nombre: "Cabra",
          contador: 0,
        },
        {
          imagen: require("@/images/carnero.png"),
          nombre: "Carnero",
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
          imagen: require("@/images/gallo.png"),
          nombre: "Gallo",
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
          imagen: require("@/images/pavo.png"),
          nombre: "Pavo",
          contador: 0,
        },
        {
          imagen: require("@/images/perro.png"),
          nombre: "Perro",
          contador: 0,
        },
        {
          imagen: require("@/images/pollito.png"),
          nombre: "Pollito",
          contador: 0,
        },
        {
          imagen: require("@/images/raton.png"),
          nombre: "Raton",
          contador: 0,
        },
        {
          imagen: require("@/images/toro.png"),
          nombre: "Toro",
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
    this.carga();
  },
  methods: {
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

      /*La opacidad irá aumentando hasta que llegue a 1. Entonces pondremos el flag
      a false para indicar que debe empezar a disminuir. 
      Cuando llegue a 0 haremos lo contrario, pondremos el flag a true para indicar
      que debe empezar a aumentar */
      if (this.aumentarOpacidad) {
        this.opacidad = this.opacidad + 0.1;
        if (this.opacidad >= 1) {
          this.aumentarOpacidad = false;
        }
      } else {
        this.opacidad = this.opacidad - 0.1;
        if (this.opacidad <= 0) {
          this.aumentarOpacidad = true;
        }
      }
      // Aplicamos la nueva opacidad a la imagen
      img.style.opacity = this.opacidad;
    },
    carga() {
      this.eligeAnimal();
      setInterval(this.cambiaOpacidad, 100);
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
      console.log(this.imagenAMostrar);
      //Calculamos su posición
      this.posicionImagen();
    },
    posicionImagen() {
      let img = document.getElementById("animal");

      let x, y;

      x = this.numeroAleatorio(-500, 500);
      y = this.numeroAleatorio(150, 570);

      img.style.marginLeft = `${x}px`;
      img.style.marginTop = `${y}px`;

      if (0 < y && y < 200) {
        img.style.transform = "scale(0.7)";
      } else {
        if (200 < y && y < 400) {
          img.style.transform = "scale(0.9)";
        } else {
          img.style.transform = "scale(1.2)";
        }
      }
    },
    comprobarAnimales() {
      console.log("comrpou");

      this.correcto = false;

      if (parseInt(this.numAnimales) === this.animalABuscar.contador) {
        this.correcto = true;
      }
    },
  },
};
</script>

<style scoped>
img {
  /* opacity: 0; */
  position: relative;
  height: 100px;
}

.correcto {
  height: 50px;
}
#cuadro_blanco {
  min-height: 500px;
  width: 90%;
  background-color: #ffffff;
  border: 2px solid blue;
  border-radius: 10px;
}
</style>