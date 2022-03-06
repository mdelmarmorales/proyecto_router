<template>
  <div class="row">
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

        <div class="col-6 d-flex flex-column justify-content-around">
          <h1>Registro</h1>
          <form id="formulario" class="p-3" @submit.prevent="registrar">
            <div class="form-group row">
              <label class="col-4 my-auto">Usuario: </label>
              <input
                type="text"
                class="form-control col-7"
                v-model="jugador.usuario"
              />
            </div>
            <div class="form-group row">
              <label class="col-4 my-auto">Correo: </label>
              <input
                type="email"
                class="form-control col-7"
                v-model="jugador.correo"
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
            <div class="form-group row">
              <label class="col-4 my-auto">Nombre del niño: </label>
              <input
                type="text"
                class="form-control col-7"
                v-model="jugador.nombreNinyo"
              />
            </div>
            <div class="form-group row">
              <label class="col-4 my-auto">Edad del niño: </label>
              <input
                type="text"
                class="form-control col-7"
                v-model="jugador.edadNinyo"
              />
            </div>
            <div>
              <input type="submit" class="boton" value="Registrar" />
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Registro",
  data() {
    return {
      jugador: {},
    };
  },
  methods: {
    async registrar() {
      let datosRegistro = {
        usuario: this.jugador.usuario,
        correo: this.jugador.correo,
        contrasenya: this.jugador.contrasenya,
        nombreNinyo: this.jugador.nombreNinyo,
        edadNinyo: this.jugador.edadNinyo,
      };

      // fetch("http://localhost/API_proyecto/jugadores", {
      //   mode: "cors",
      //   method: "POST",
      //   body: JSON.stringify(datosRegistro),
      // }).then((respuesta) => respuesta.json());

      try {
        const respuesta = await fetch(
          "http://localhost/API_proyecto/jugadores",
          {
            // mode: "cors",
            method: "POST",
            body: JSON.stringify(datosRegistro),
          }
        );
        if (!respuesta.ok) {
          throw new Error("Respuesta de red ok. Respuesta HTTP errónea.");
        }

        const respuestaJson = await respuesta.json();
      } catch (e) {
        console.log(e);
      }
      window.location.href='/';
    },
  },
};
</script>

<style scoped>
#cuadro_blanco {
  min-height: 500px;
  width: 90%;
  background-color: #ffffff;
  border: 2px solid #071488;
  border-radius: 10px;
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