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
                  v-model="jugador.usuario"
                />
              </div>

              <div class="form-group row">
                <label class="col-4 my-auto">Contraseña: </label>
                <input
                  type="text"
                  class="form-control col-7"
                  v-model="jugador.contrasenya"
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
      jugador: {},
    };
  },
  methods: {
    async acceder() {
      let datosAcceso = {
        usuario: this.jugador.usuario,
        contrasenya: this.jugador.contrasenya,
      };

      try {
        const respuesta = await fetch(
          "http://localhost/API_proyecto/jugadores",
          {
            method: "POST",
            body: JSON.stringify(datosAcceso),
          }
        );

        if (!respuesta.ok) {
          throw new Error("Respuesta de red ok. Respuesta HTTP errónea.");
        }
        console.log(respuesta);
        //const respuestaJson = await respuesta.json();

      } catch (e) {
        console.log(e);
      }
    },
    getDataJSONFormat() {
      const data = {
        usuario: this.jugador.usuario,
        contrasenya: this.jugador.contrasenya,
      };

      return data;
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
