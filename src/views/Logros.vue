<template>
  <div id="cuadro_blanco" class="col-10 mx-auto mt-5 d-flex align-items-center">
    <div class="row d-flex flex-row justify-content-around">
      <table class="table table-striped col-10">
        <thead class="thead">
          <tr>
            <th>Juego</th>
            <th>Puntos</th>
            <th>Medallas</th>
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
              <router-link :to="{ name: 'Graficos', params: {idJuego: item.idJuego} }">Detalles </router-link>
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
          </tr>
        </tbody>
      </table>
      <img src="../images/logros.jpg" alt="logros" class="img_logros"/>
    </div>
    </div>
</template>

<script>
export default {
  name: "Logros",
  data() {
    return {
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

      // for (let i = 0; i < this.puntos.length; i++) {
      //   numMedallas = Math.floor(this.puntos[i].puntuacion / 15);
      //   this.imgMedallas[i] = [];
      //   //console.log("medalla", numMedallas);

      //   for (let j = 0; j < numMedallas; j++) {
      //     this.imgMedallas[i][j] = require("../images/medalla.png");
      //   }
      //   console.log(this.imgMedallas[i]);
      // }

      //console.log(this.imgMedallas);

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
   height: 150px;
}
</style>
