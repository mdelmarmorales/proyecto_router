<template>
  <div class="row mt-3">
    <div class=" enunciado col-10 mx-auto">
      <p class="my-auto py-2">
        En la granja hay muchos animales. Cuenta cuántas veces aparece éste:
        <span>{{ this.animalABuscar.nombre }}</span
        >. Pulsa "Comenzar".
      </p>
    </div>
  </div>
  <div class="row">
    <div id="cuadro_granja" class="col-10 mx-auto my-3">
      <div id="fondo_granja" class="row d-flex my-2">
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
      clearInterval(this.intervalID);
      // Llamamos al modal para introducir el número
      this.emitter.emit("finGranja", this.animalABuscar);
    });
  },
  methods: {
    comenzar() {
      this.comienzo = true;
      /* Intervalo para cambiar la opacidad de las imágenes */
      this.intervalID = setInterval(this.cambiaOpacidad, 100);
    },
    /* Método para seleccionar un animal aleatorio entre los disponibles */
    eligeAnimal() {
      let indice;

      indice = this.numeroAleatorio(0, this.listaAnimales.length - 1);
      this.animalABuscar = this.listaAnimales[indice];
    },
    /* Método que modifica la opacidad de las imágenes */
    cambiaOpacidad() {
      let img = document.getElementById("animal");

      //Aprovechamos el momento en que la imagen no se ve para cargar una nueva
      if (this.opacidad <= 0) {
        this.muestraImagen();
      }

      /*La opacidad irá aumentando hasta que llegue a 1.3 y 
      luego comenzará a disminuir. Se lleva hasta 1,3 para que 
      el dibujo permanezca un poco más en la pantalla y el niño tenga tiempo suficiente
      para verlo. */
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
    /* Elegir un número aleatorio */
    numeroAleatorio(min, max) {
      return Math.floor(Math.random() * (max - min + 1) + min);
    },
    /* Método para seleccionar una imagen y actualizar el contador
    con las veces que ha aparecido */
    muestraImagen() {
      let indice;

      //Selecionamos una imagen al azar entre todas las del array
      indice = this.numeroAleatorio(0, this.listaAnimales.length - 1);
      this.imagenAMostrar = this.listaAnimales[indice];

      this.imagenAMostrar.contador = this.imagenAMostrar.contador + 1;

      //Calculamos su posición
      this.posicionImagen();
    },
    /*Calculamos una posición aleatoria para la imagen */
    posicionImagen() {
      //Obtenemos la posición del div padre
      let fondo = document.getElementById("cuadro_granja");
      let posicion = fondo.getBoundingClientRect();

      //Obtenemos una referencia para la imagen del animal
      let img = document.getElementById("animal");

      //Aplicamos unas posiciones aleatorias
      let x, y;
      x = this.numeroAleatorio(
        -((posicion.right - posicion.left) / 2),
        (posicion.right - posicion.left) / 2 - img.width
      );
      y = this.numeroAleatorio(
        posicion.top - img.height,
        posicion.bottom - posicion.top - img.height
      );
      

      img.style.marginLeft = `${x}px`;
      img.style.marginTop = `${y}px`;
    },
  },
};
</script>

<style scoped>
img {
  position: absolute;
  height: 6.25rem;
}

#cuadro_granja {
  height: 31.25em;
  background-color: #ffffff;
  border: 2px solid #071488;
  border-radius: 10px;
  background-image: url("../../../images/fondo_granja.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-position: center;
  position: relative;
  overflow: hidden;
}

span {
  text-decoration: underline;
}
</style>