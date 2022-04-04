<template>
  <div id="acceso" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Acceso no válido</h5>
        </div>
        <div class="modal-body">
          <p>
            Los datos introducidos no son válidos. <br />
            Inténtalo de nuevo.
          </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btnJuegos" data-dismiss="modal">
            Cerrar
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "ModalAcceso",
  data() {
    return {
      accesoInvalido: null,
    };
  },
  mounted() {
    this.emitter.on("accesoInvalido", (accesoInvalido) => {
      $("#acceso").modal("show");
    });
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