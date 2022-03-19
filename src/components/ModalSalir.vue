<template>
  <div id="salir" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Abandonar</h5>
        </div>
        <div class="modal-body">
          <p>¿Seguro que quieres salir?</p>
        </div>
        <div class="modal-footer">
          <button
            type="button"
            data-dismiss="modal"
            class="btnRecargar"
            @click="salir"
          >
            <router-link :to="{ name: 'Home' }">Salir</router-link>
          </button>
          <button type="button" class="btnJuegos" data-dismiss="modal">
            Cancelar
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "ModalFinTiempo",
  data() {
    return {
      finTiempo: null,
    };
  },
  mounted() {
    this.emitter.on("salir", (salir) => {
      $("#salir").modal("show");
    });
  },
  methods: {
    async salir() {
      let datosSalir = {
        idJugador: localStorage.getItem("idJugador"),
        puntuaciones: JSON.parse(localStorage.getItem("puntuaciones")),
        puntuacionesInicio: JSON.parse(localStorage.getItem("puntuacionesInicio"))
      };


      fetch("http://localhost/API_proyecto/actualizarPuntos", {
        method: "POST",
        body: JSON.stringify(datosSalir),
      })
        .then((respuesta) => respuesta.json())
        .then((datosRespuesta) => {
          if (datosRespuesta.success == "1") {
            console.log("salir", datosSalir);
            //window.location.href = "/juegos";
          }
        });

    },
  },
};
</script>

<style scoped>
.modal-header {
  background-color: #3fcfba;
  color: #071488;
  font-weight: bold;
}

.btnRecargar {
  background-color: #3fcfba;
  border: 2px solid #071488;
  border-radius: 5px;
}

.btnJuegos {
  background-color: #ffa934;
  border: 2px solid #fd6400;
  border-radius: 5px;
}

.btnRecargar a {
  color: #071488;
  text-decoration: none;
}
.btnJuegos a {
  color: #3f332b;
  text-decoration: none;
}
</style>