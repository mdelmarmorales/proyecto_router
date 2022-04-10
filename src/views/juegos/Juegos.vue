<template>
  <div class="row">
    <div id="cuadro_blanco" class="col-10 mx-auto mt-5">
      <div v-if="this.idJugador" class="row d-flex justify-content-around align-items-center">
        <div
          v-for="juego in juegosPrimeraFila"
          :key="juego.id"
          class="col-4 mt-2"
        >
          <div class="card m-2 p-2">
            <router-link :to="{ name: juego.url }">
              <div class="zoom">
              <img :src="juego.imagen" :alt="juego.nombre" class="card-img" />
               </div>
              <p class="card-text nombreJuego mx-auto mt-3">{{ juego.nombre }}</p>
            </router-link>
          </div>
        </div>
      </div>
      <!-- Si el usuario no se ha logueado, mostramos mensaje para que lo haga -->
      <div id="avisoLogin" v-else class="row d-flex justify-content-around align-items-center">
        <div class="aviso col-8 py-5">
          <p class="textoAviso">
            Tienes que introducir tus datos de usuario o crear una cuenta
            para poder jugar.
          </p>
          <button type="button" class="btnSeguir p-1">
            <router-link :to="{ name: 'Home' }">Acceder</router-link>
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Juegos",
  data() {
    return {
      idJugador: localStorage.getItem("idJugador"),
      juegosPrimeraFila: [
        {
          id: 0,
          imagen: require("@/images/boton_operaciones.svg"),
          nombre: "Practica operaciones",
          url: "Operaciones",
        },
        {
          id: 1,
          imagen: require("@/images/boton_compra.svg"),
          nombre: "Vamos a la compra",
          url: "Compra",
        },
        {
          id: 2,
          imagen: require("@/images/boton_contar.svg"),
          nombre: "A contar",
          url: "Granja",
        },
        {
          id: 3,
          imagen: require("@/images/boton_series.svg"),
          nombre: "Series numéricas",
          url: "Series",
        },
        {
          id: 4,
          imagen: require("@/images/boton_escribe.svg"),
          nombre: "Escribe el número",
          url: "Voz",
        },
        {
          id: 5,
          imagen: require("@/images/boton_hora.svg"),
          nombre: "¿Qué hora es?",
          url: "Hora",
        },
      ],
    };
  },
};
</script>

<style scoped>
.card {
  background-color: #e0f7f2;
  border: 2px solid #071488;
  border-radius: 15px;
  position: relative;
  overflow: hidden;
}

/* Enlace del router link es transformado a un "a", por eso se formatea así */
.card a {
  text-decoration: none;
  transition: all 1.5s ease;
}

.card zoom {
  overflow: hidden;
}

.card img {
  width: 100%;
  height: 30vh;
  object-fit: contain;
  transition: all 1s ease;
}

.card:hover img {
  transform: scale(1.1);
}

.nombreJuego {
  color: #071488;
}

.btnSeguir {
  background-color: #3fcfba;
  border: 2px solid #071488;
  border-radius: 5px;
}

.btnSeguir a {
  color: #071488;
  text-decoration: none;
}

#avisoLogin {
  height: 100vh;
}

.aviso {
  background-color: #e0f7f2;
  border: 2px solid #071488;
  border-radius: 15px;
}
</style>