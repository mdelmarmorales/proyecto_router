<template>
  <div id="cuadro_blanco" class="col-10 mx-auto mt-5">
    <div v-if="this.idJugador" class="row d-flex flex-row w-100 justify-content-around align-items-center">
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
              <router-link :to="{ name: 'Graficos', params: {idJuego: item.idJuego} }">Ver </router-link>
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
             <td> </td>
          </tr>
        </tbody>
      </table>
      <img src="../images/logros.jpg" alt="logros" class="col-2"/>
    </div>
       <div id="avisoLogin" v-else class="row d-flex justify-content-around align-items-center">
        <div class="aviso col-8 py-5">
          <p class="textoAviso">
            Tienes que introducir tus datos de usuario o crear una cuenta
            para poder jugar.
          </p>
          <button type="button" class="btnSeguir">
            <router-link :to="{ name: 'Home' }">Acceder</router-link>
          </button>
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
    };
  },
  mounted() {
    this.carga();
  },
  methods: {
    carga() {
      this.consultarPuntos();
    },
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
    calcularPuntosTotales() {
      this.puntos.forEach((punto) => {
        this.puntuacionTotal += parseInt(punto.puntuacion);
      });
      this.calcularLogros();
    },
    calcularLogros() {
      let numTrofeos = Math.floor(this.puntuacionTotal / 50);
      let numMedallas;

      for (let i = 0; i < this.puntos.length; i++) {
        numMedallas = Math.floor(this.puntos[i].puntuacion / 15);
        this.puntos[i].medallas = [];
        //console.log("medalla", numMedallas);

        for (let j = 0; j < numMedallas; j++) {
          this.puntos[i].medallas.push(require("../images/medalla.png"));
        }
        console.log(this.puntos[i].medallas);
      }
      for (let i = 0; i < numTrofeos; i++) {
        this.imgTrofeos[i] = require("../images/trofeo.png");
      }
    },
  },
};
</script>

<style scoped>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#fondo {
  background-image: url("../images/fondo.png");
  background-size: cover;
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-position: center;
}

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
  height: 30px;
}

.img_logros{
   height: 250px;
}
#avisoLogin{
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
