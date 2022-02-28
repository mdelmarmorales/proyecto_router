<template>
  <div class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Fin del juego</h5>
        </div>
        <div class="modal-body">
          <p>
            El tiempo ha finalizado. <br />
            ¿Quieres jugar de nuevo o elegir otro juego?
          </p>
        </div>
        <div class="modal-footer">
          <button
            type="button"
            onclick="javascript:window.location.reload()"
            class="btnRecargar"
          >
            <router-link :to="{ name: self }">Jugar de nuevo</router-link>
          </button>
          <button type="button" class="btnJuegos" data-dismiss="modal">
            <router-link :to="{ name: 'Juegos' }">Otro juego</router-link>
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
    this.emitter.on("finTiempo", (finTiempo) => {
      $(".modal").modal({ show: false });
      //this.productoSeleccionado = productoSeleccionado; //Guardamos el valor leído desde otro componente a un dato de éste
      // this.finTiempo = finTiempo;
      
      $(".modal").modal("show");
    });
  },
};
</script>

<style scoped>

.modal-header{
background-color: #3fcfba;
color: #071488;
font-weight: bold;
}

.btnRecargar{
   background-color: #3fcfba;
  border: 2px solid #071488;
  border-radius: 5px;
  color: black;
}

.btnJuegos{
    background-color: #ffa934;
  border: 2px solid #fd6400;
  border-radius: 5px;
}
</style>