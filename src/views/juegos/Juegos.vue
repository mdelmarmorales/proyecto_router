<template>
<div class="row">
  <div id="cuadro_blanco" class="col-10 mx-auto mt-5">
    <div class="row justify-content-around">
      <div v-for="juego in juegosPrimeraFila" :key="juego.id" class="col-sm-3 mt-2">
        <div class="card m-2 p-2">
          <router-link :to="{ name: juego.url }">
            <img
              :src="juego.imagen"
              :alt="juego.nombre"
              class="card-img py-2"
            />
            <div class="card-body">
              <p class="card-title nombreJuego mx-auto">{{ juego.nombre }}</p>
            </div>
          </router-link>
        </div>
      </div>
    </div>
       <div class="row justify-content-around">
      <div v-for="juego in juegosSegundaFila" :key="juego.id" class="col-sm-3 mb-2">
        <div class="card m-2 p-2">
          <router-link :to="{ name: juego.url }">
            <img
              :src="juego.imagen"
              :alt="juego.nombre"
              class="card-img py-2"
            />
            <div class="card-body">
              <p class="card-title nombreJuego mx-auto">{{ juego.nombre }}</p>
            </div>
          </router-link>
        </div>
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
      juegosPrimeraFila: [
        {
          id: 0,
          imagen: require("@/images/boton_operaciones.png"),
          nombre: "Practica operaciones",
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
.card {
  background-color: #e0f7f2;
  border: 2px solid #071488;
  border-radius: 15px;
}

/* Enlace del router link es transformado a un "a", por eso se formatea así */
.card a{
  text-decoration:none;
}

.card-img{
  height: 150px;
}

.nombreJuego {
  color: #071488;
}

#cuadro_blanco {
  min-height: 500px;
  width: 90%;
  background-color: #ffffff;
  border: 2px solid blue;
  border-radius: 10px;
}
</style>