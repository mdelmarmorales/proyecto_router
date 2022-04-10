<!-- Mostramos los puntos y medallas conseguidos por el jugador -->
<template>
<div class="row">
  <div id="cuadro_blanco" class="col-10 mx-auto mt-5 d-flex align-items-center">
    <!-- Si el jugador está logueado y no es la primera vez que juega -->
    <div
      v-if="this.idJugador && !this.nuevoJugador"
      class="row d-flex flex-row justify-content-center"
    >
      <table class="table table-striped table-bordered col-9">
        <thead class="thead">
          <tr>
            <th>Juego</th>
            <th>Puntos</th>
            <th>Medallas</th>
            <th>Detalles</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="item in puntos" v-bind:key="item">
            <td>
              {{ item.nombre }}
            </td>
            <td>
              {{ item.puntuacion }}
            </td>
            <td>
              <img
                v-for="elem in item.medallas"
                v-bind:key="elem"
                :src="elem"
                alt="medalla"
                class="logros"
              />
            </td>
            <td>
              <!-- Pasamos como parámetro el ID del juego para formar la ruta dinámica -->
              <router-link
                :to="{ name: 'Graficos', params: { idJuego: item.idJuego } }"
                >Ver
              </router-link>
            </td>
          </tr>
          <tr>
            <td>Puntuación total</td>
            <td>{{ this.puntuacionTotal }}</td>
            <td>
              <img
                v-for="item in imgTrofeos"
                v-bind:key="item"
                :src="item"
                alt="trofeo"
                class="logros"
              />
            </td>
            <td></td>
          </tr>
        </tbody>
      </table>
      <img src="../images/logros.jpg" alt="logros" class="col-2 my-auto" />
    </div>
    <!-- Si el jugador no está logueado, le pedimos que lo haga -->
    <div
      id="avisoLogin"
      v-else-if="!this.idJugador"
      class="row w-100 d-flex justify-content-around align-items-center"
    >
      <div class="aviso col-8 py-5">
        <p class="textoAviso">
          Tienes que introducir tus datos de usuario o crear una cuenta para
          poder jugar.
        </p>
        <button type="button" class="btnSeguir p-1">
          <router-link :to="{ name: 'Home' }">Acceder</router-link>
        </button>
      </div>
    </div>
    <!-- Si el usuario está recién registrado, se le indicará que puede consultar los puntos la próxima vez que acceda.
      Hacemos esto porque los puntos se almacenarán en la BD cuando se desconecte y ahora mismo todavía no están almacenados -->
    <div
      id="avisoLogin"
      v-else
      class="row w-100 d-flex justify-content-around align-items-center"
    >
      <div class="aviso col-8 py-5">
        <p class="textoAviso">
          Podrás consultar tus logros la próxima vez que accedas.
        </p>
        <button type="button" class="btnSeguir p-1">
          <router-link :to="{ name: 'Juegos' }">Elegir juego</router-link>
        </button>
      </div>
    </div>
  </div>
  </div>
</template>

<script>
export default {
  name: "Logros",
  data() {
    return {
      idJugador: localStorage.getItem("idJugador"),
      puntos: [],
      puntuacionTotal: 0,
      medallas: "",
      trofeos: "",
      imgMedallas: [],
      imgTrofeos: [],
      nuevoJugador: localStorage.getItem("nuevoJugador"),
    };
  },
  mounted() {
    this.carga();
  },
  methods: {
    carga() {
      if (!this.nuevoJugador) {
        this.consultarPuntos();
      }
    },
    /* Método para consultar los puntos conseguidos en cada juego */
    consultarPuntos() {
      let idJugador = localStorage.getItem("idJugador");

      fetch("http://localhost/API_proyecto/consultarLogros", {
        method: "POST",
        body: JSON.stringify(idJugador),
      })
        .then((respuesta) => respuesta.json())
        .then((datosRespuesta) => {
          this.puntos = datosRespuesta;
          this.calcularPuntosTotales();
        });
    },
    // Sumamos los puntos conseguidos en cada juego para conseguir los puntos totales
    calcularPuntosTotales() {
      this.puntos.forEach((punto) => {
        this.puntuacionTotal += parseInt(punto.puntuacion);
      });
      this.calcularLogros();
    },
    /* Método que calcula las medallas y los trofeos */
    calcularLogros() {
      /* Por cada 50 puntos, se concede un trofeo */
      let numTrofeos = Math.floor(this.puntuacionTotal / 50);
      let numMedallas;

      /* En cada juego se consigue una medalla cada 15 puntos */
      for (let i = 0; i < this.puntos.length; i++) {
        numMedallas = Math.floor(this.puntos[i].puntuacion / 15);
        this.puntos[i].medallas = [];

        /* Creamos un vector con las imágenes de las medallas conseguidas */
        for (let j = 0; j < numMedallas; j++) {
          this.puntos[i].medallas.push(require("../images/medalla.png"));
        }
      }

      /* Creamos un vector con las imágenes de los trofeos conseguidos */
      for (let i = 0; i < numTrofeos; i++) {
        this.imgTrofeos[i] = require("../images/trofeo.png");
      }
    },
  },
};
</script>

<style scoped>
#formulario {
  background-color: #e0f7f2;
  border: 2px solid #071488;
  border-radius: 15px;
}
.boton {
  background-color: #3fcfba;
  border: 2px solid #071488;
  border-radius: 5px;
}

h1 {
  color: #071488;
  font-weight: bold;
}

.logros {
  height: 1.875em;
}

.img_logros {
  height: 15.625em;
}
#avisoLogin {
  height: 100vh;
}

.aviso {
  background-color: #e0f7f2;
  border: 2px solid #071488;
  border-radius: 15px;
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
</style>
