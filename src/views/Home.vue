<template>
  <div id="home" class="row">
    <div
      id="cuadro_blanco"
      class="col-10 mx-auto mt-5 d-flex align-items-center"
    >
      <div class="row d-flex justify-content-around">
        <img
          class="col-5"
          src="../images/inicio.png"
          alt="niños jugando con números"
        />

        <div class="col-6 d-flex flex-column justify-content-center">
          <h1>Acceso</h1>
          <div id="formulario">
            <form class="p-3" @submit.prevent="acceder">
              <div class="form-group row">
                <label class="col-4 my-auto">Usuario: </label>
                <input
                  type="text"
                  class="form-control col-7"
                  v-model="datosForm.usuario"
                />
              </div>

              <div class="form-group row">
                <label class="col-4 my-auto">Contraseña: </label>
                <input
                  type="password"
                  class="form-control col-7"
                  v-model="datosForm.contrasenya"
                />
              </div>
              <div>
                <input type="submit" class="boton" value="Acceder" />
              </div>
            </form>
            <div class="row d-flex justify-content-center">
              <router-link :to="{ name: 'Registro' }" class="item"
                >Crear cuenta</router-link
              >
            </div>
            <div class="alert alert-danger" role="alert" v-if="this.accesoInvalido">
              Los datos introducidos no son correctos.<br>
              Inténtalo de nuevo.
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
// import router from '@/router'
export default {
  name: "Home",
  inject: ["id"],
  data() {
    return {
      datosForm: {},
      jugador: {},
      accesoInvalido: null,
    };
  },
  methods: {
    async acceder() {
      let datosAcceso = {
        usuario: this.datosForm.usuario,
        contrasenya: this.datosForm.contrasenya,
      };

      fetch("http://localhost/API_proyecto/consultar", {
        method: "POST",
        body: JSON.stringify(datosAcceso),
      })
        .then((respuesta) => respuesta.json())
        .then((datosRespuesta) => {
          if (datosRespuesta.success == "0") {
            this.accesoInvalido=true;
            //this.emitter.emit("accesoInvalido", true);
          } else {
            this.accesoInvalido=false;
            /*Array de puntuaciones. Posiciones:
            0- operaciones,
            1- compra
            2- contar
            3- series
            4- voz
            5- horas */
            localStorage.setItem("idJugador", datosRespuesta[0].idJugador);
            localStorage.setItem("edadNinyo", datosRespuesta[0].edadNinyo);
            //localStorage.setItem("puntuaciones", JSON.stringify(new Array(6).fill(0)));

            this.consultarPuntos(datosRespuesta[0].idJugador);
            // this.$router.push("/juegos");
          }
        });
    },
    /* Se crea un array de ceros. Se conulta si ya existen puntuaciones para el día de hoy
    porque el niño ya haya jugado anteriormente. Estas puntuaciones se almacenan en el vector de ceros.
    Así se pueden actualizar con los puntos que consiga ahora */
    consultarPuntos(idJugador) {
      let puntuaciones = new Array(6).fill(0);

      fetch("http://localhost/API_proyecto/consultarPuntos", {
        method: "POST",
        body: JSON.stringify(idJugador),
      })
        .then((respuesta) => respuesta.json())
        .then((datosRespuesta) => {
          if (datosRespuesta.success != "0") {
            datosRespuesta.forEach((dato) => {
              puntuaciones[dato.idJuego - 1] += parseInt(dato.puntuacion);
            });
          }
          /* Array que se actualiza con los puntos que vaya consiguiendo */
          localStorage.setItem("puntuaciones", JSON.stringify(puntuaciones));
          /* Array que nos sirve para saber de qué juegos no había todavía registros en la BD
          (posiciones = 0). Al salir se compararán los dos arrays de puntuaciones. Si no había registros,
          haremos un insert, si había haremos un update */
          localStorage.setItem(
            "puntuacionesInicio",
            JSON.stringify(puntuaciones)
          );
          this.$router.push("/juegos");
        });
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
</style>
