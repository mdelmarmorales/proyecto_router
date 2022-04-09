<!-- Modal para confirmar la salida -->
<template>
  <div id="salir" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Salir del juego</h5>
        </div>
        <div class="modal-body">
          <p>¿Seguro que quieres salir?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btnSeguir p-1" data-dismiss="modal">
            Cancelar
          </button>
          <button
            type="button"
            data-dismiss="modal"
            class="btnSalir p-1"
            @click="salir"
          >
            <router-link :to="{ name: 'Home' }">Salir</router-link>
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
    //Espera el evento para mostarse
    this.emitter.on("salir", (salir) => {
      $("#salir").modal("show");
    });
  },
  methods: {
    /* Cuando confirmamos la salida, almacenamos los datos en la BD */
    async salir() {
      let datosSalir = {
        idJugador: localStorage.getItem("idJugador"),
        puntuaciones: JSON.parse(localStorage.getItem("puntuaciones")),
        puntuacionesInicio: JSON.parse(
          localStorage.getItem("puntuacionesInicio")
        ),
      };

      await fetch("http://localhost/API_proyecto/actualizarPuntos", {
        method: "POST",
        body: JSON.stringify(datosSalir),
      })
        .then((respuesta) => respuesta.json())
        .then((datosRespuesta) => {
          if (datosRespuesta.success == "1") {
            // Eliminamos los datos almacenados en el navegador
            localStorage.clear();
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

.btnSeguir {
  background-color: #3fcfba;
  border: 2px solid #071488;
  border-radius: 5px;
}

.btnSalir {
  background-color: #ffa934;
  border: 2px solid #fd6400;
  border-radius: 5px;
}

.btnSeguir a {
  color: #071488;
  text-decoration: none;
}
.btnSalir a {
  color: #3f332b;
  text-decoration: none;
}
</style>