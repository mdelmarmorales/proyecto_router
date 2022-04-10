<!-- Modal que aparece cuando el usuario se ha registrado. 
Le pedimos que acceda con sus nuevos datos -->
<template>
  <div id="registro" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Registro finalizado</h5>
        </div>
        <div class="modal-body">
          <p>
            Registro realizado con éxito. <br />
            ¡Ya puedes comenzar a jugar!
          </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btnJuegos p-1" data-dismiss="modal">
            <router-link :to="{ name: 'Home' }">Acceder</router-link>
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "ModalRegistro",
  data() {
    return {
      registroRealizado: null,
    };
  },
  mounted() {
    //Espera el evento para mostrarse
    this.emitter.on("registroRealizado", (registroRealizado) => {
      $("#registro").modal("show");
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