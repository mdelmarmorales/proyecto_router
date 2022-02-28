<template>
  <div class="row">
    <div id="cuadro_blanco" class="col-10 mx-auto mt-5 d-flex align-items-center">
      <div class="row d-flex justify-content-around">
        <img
          class="col-5"
          src="../images/inicio.png"
          alt="niños jugando con números"
        />

        <div class="col-6 d-flex flex-column justify-content-around ">
          <h1>Registro</h1>
          <form id="formulario" class="p-3" > 
            <div class="form-group row">
              <label class="col-4 my-auto">Usuario: </label>
              <input type="text" class="form-control col-7" />
            </div>
            <div class="form-group row">
              <label class="col-4 my-auto">Correo: </label>
              <input type="email" class="form-control col-7" />
            </div>
            <div class="form-group row">
              <label class="col-4 my-auto">Contraseña: </label>
              <input type="text" class="form-control col-7" />
            </div>
            <div class="form-group row">
              <label class="col-4 my-auto">Nombre del niño: </label>
              <input type="text" class="form-control col-7" />
            </div>
            <div class="form-group row">
              <label class="col-4 my-auto">Edad del niño: </label>
              <input type="text" class="form-control col-7" />
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
      url: "/bd/crud.php",
    };
  },
  created() {
    this.listarMoviles();
  },
  methods: {
    btnAlta() {
      console.log("alta");
      console.log(this.usuario);
      console.log(this.correo);
      console.log(this.contrasenya);
      console.log(this.nombreNinyo);
      console.log(this.edadNinyo);

      if (
        this.usuario &&
        this.correo &&
        this.contrasenya &&
        this.nombreNinyo &&
        this.edadNinyo
      ) {
        console.log("alta");
        this.altaUsuario();
      }
    },
    async altaUsuario() {
      var data = JSON.stringify({
        usuario: this.usuario,
        correo: this.correo,
        contrasenya: this.contrasenya,
        nombreNinyo: this.nombreNinyo,
        edadNinyo: this.edadNinyo,
      });
      var config = {
        headers: { "Access-Control-Allow-Origin": "*" },
      };

      await axios
        .post(this.url, {
          opcion: 1,
          data,
          crossdomain: true,
        })
        .then((response) => {
          console.log(response);
        });
      (this.marca = ""), (this.modelo = ""), (this.stock = 0);
    },
    listarMoviles() {
      axios.post(this.url, { opcion: 4 }).then((response) => {
        this.moviles = response.data;
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

.boton {
  background-color: #3fcfba;
  border: 2px solid #071488;
  border-radius: 5px;
}

h1{
  color: #071488;
  font-weight: bold;
}
</style>