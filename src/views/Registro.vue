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

<!-- Formulario de registro de un nuevo jugador -->
        <div class="col-6 d-flex flex-column justify-content-around">
          <h1>Registro</h1>
          <form id="formulario" class="p-3" @submit.prevent="registrar">
            <div class="form-group row">
              <label class="col-4 my-auto">Usuario: </label>
              <input
                type="text"
                class="form-control col-7"
                v-model="jugador.usuario" required
              />
            </div>
            <div class="form-group row">
              <label class="col-4 my-auto">Correo: </label>
              <input
                type="email"
                class="form-control col-7"
                v-model="jugador.correo" required
              />
            </div>
            <div class="form-group row">
              <label class="col-4 my-auto">Contraseña: </label>
              <input
                type="text"
                class="form-control col-7"
                v-model="jugador.contrasenya" required
              />
            </div>
            <div class="form-group row">
              <label class="col-4 my-auto">Nombre del niño: </label>
              <input
                type="text"
                class="form-control col-7"
                v-model="jugador.nombreNinyo" required
              />
            </div>
            <div class="form-group row">
              <label class="col-4 my-auto">Edad del niño: </label>
              <input
                type="number"
                class="form-control col-7"
                v-model="jugador.edadNinyo" required
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
export default {
  name: "Registro",
  data() {
    return {
      jugador: {},
    };
  },
  methods: {
    // Método para insertar un nuevo jugador en la BD
    async registrar() {
      localStorage.setItem("nuevoJugador", true);

      let datosRegistro = {
        usuario: this.jugador.usuario,
        correo: this.jugador.correo,
        contrasenya: this.jugador.contrasenya,
        nombreNinyo: this.jugador.nombreNinyo,
        edadNinyo: this.jugador.edadNinyo,
      };

       fetch("http://localhost/API_proyecto/insertar", {
        method: "POST",
        body: JSON.stringify(datosRegistro),
      })
        .then((respuesta) => respuesta.json())
        .then((datosRespuesta) => {
          if (datosRespuesta.success == "1") {
            //Si todo va OK, emitimos un evento para que aparezca el modal
            this.emitter.emit("registroRealizado", true);
          } 
        });
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