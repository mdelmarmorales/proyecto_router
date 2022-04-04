<!-- Página de inicio -->
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

        <!-- Formulario de acceso -->
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

            <!-- Aviso si los datos introducidos no son correctos -->
            <div
              class="alert alert-danger"
              role="alert"
              v-if="this.accesoInvalido"
            >
              Los datos introducidos no son correctos.<br />
              Inténtalo de nuevo.
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Home",
  data() {
    return {
      datosForm: {},
      accesoInvalido: null,
    };
  },
  methods: {
    /* Método que consulta los datos de acceso a la BD y extrae los datos necesarios
    para el funcionamiento de la aplicación */
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
          // Si el jugador no existe en la BD
          if (datosRespuesta.success == "0") {
            this.accesoInvalido = true;
          } else {
            // Si existe, extraemos los datos necesarios
            this.accesoInvalido = false;

            //Almacenamos los datos en el navegador
            localStorage.setItem("idJugador", datosRespuesta[0].idJugador);
            localStorage.setItem("edadNinyo", datosRespuesta[0].edadNinyo);

            this.consultarPuntos(datosRespuesta[0].idJugador);
          }
        });
    },

    /* Método para consultar si ya existen puntuaciones para el día de hoy. Con esto
    pretendemos actualizar los registros de puntos que existan en la BD para la fecha actual. 
    Se crea un array de ceros. Se conulta si ya existen puntuaciones para el día de hoy
    porque el niño ya haya jugado anteriormente. Estas puntuaciones se almacenan en el vector
    de ceros. Así se pueden actualizar con los puntos que consiga ahora
        Array de puntuaciones. Posiciones:
            0- operaciones,
            1- compra
            2- contar
            3- series
            4- voz
            5- horas */
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
          (posiciones == 0). Al salir se compararán los dos arrays de puntuaciones. Si no había registros,
          haremos un insert; si había, haremos un update */
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
