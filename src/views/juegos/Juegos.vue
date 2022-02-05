<template>
  <div>
    <div v-for="juego in juegosPrimeraFila" :key="juego.id">
      <!-- <router-link :to="{name: 'Juegos'}"> -->
      <router-link :to="{ name: juego.url }">
        <img :src="juego.imagen" :alt="juego.nombre" class="imagen py-2" />
        <p class="nombreJuego mx-auto">{{ juego.nombre }}</p>
      </router-link>
    </div>
    <div v-for="juego in juegosSegundaFila" :key="juego.id">
      <!-- <router-link :to="{name: 'Juegos'}"> -->
      <router-link :to="{ name: juego.url }">
        <img :src="juego.imagen" :alt="juego.nombre" class="imagen py-2" />
        <p class="nombreJuego mx-auto">{{ juego.nombre }}</p>
      </router-link>
    </div>
  </div>
  <!-- <div class="row filaJuego mt-lg-5 d-flex justify-content-around">
      <a
        :href="juego.nombre"
        class="boton col-lg-3 my-lg-2 text-decoration-none font-weight-bold"
        v-bind:key="juego.id"
        v-for="juego in juegosPrimeraFila"
      >
        <img :src="juego.imagen" :alt="juego.nombre" class="imagen py-2" />
        <p class="nombreJuego mx-auto">{{ juego.nombre }}</p>
      </a>
    </div>

    <div class="row filaJuego mt-lg-5">
      <a
        :href="juego.nombre"
        class="
          boton
          col-lg-3
          my-lg-2
          mx-auto
          text-decoration-none
          font-weight-bold
        "
        v-bind:key="juego.id"
        v-for="juego in juegosSegundaFila"
      >
        <img :src="juego.imagen" :alt="juego.nombre" class="imagen py-2" />
        <p class="nombreJuego mx-auto">{{ juego.nombre }}</p>
      </a>
    </div> -->
</template>

<script>
export default {
  name: "Juegos",
  data() {
    return {
      juegosPrimeraFila: [
        {
          id: 0,
          imagen: require("@/images/boton_operaciones.png"),
          nombre: "Practica las operaciones",
          url: "Operaciones",
        },
        {
          id: 1,
          imagen: require("@/images/boton_compra.png"),
          nombre: "Vamos a la compra",
          url: "Compra",
        },
        {
          id: 2,
          imagen: require("@/images/boton_contar.png"),
          nombre: "A contar",
          url: "Granja",
        },
      ],
      juegosSegundaFila: [
        {
          id: 3,
          imagen: require("@/images/boton_series.png"),
          nombre: "Series numéricas",
          url: "Series",
        },
        {
          id: 4,
          imagen: require("@/images/boton_escribe.png"),
          nombre: "Escribe el número",
          url: "Voz",
        },
        {
          id: 5,
          imagen: require("@/images/boton_hora.png"),
          nombre: "¿Qué hora es?",
          url: "Hora",
        },
      ],
    };
  },
};
</script>

<style scoped>
.boton {
  background-color: #e0f7f2;
  border: 2px solid #071488;
  border-radius: 15px;
}

.imagen {
  height: 150px;
}

.nombreJuego {
  color: #071488;
}
</style>