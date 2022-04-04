<!-- Modal que aparece si finaliza el tiempo del juego. 
Preguntamos si queremos jugar a otro juego o salir de la aplicación -->
<template>
  <div id="tiempo" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Fin del juego</h5>
        </div>
        <div class="modal-body">
          <p>
            El tiempo ha finalizado. <br />
            ¿Qué quieres hacer ahora?
          </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btnSeguir" data-dismiss="modal">
            <router-link :to="{ name: 'Juegos' }">Elegir juego</router-link>
          </button>
          <button
            type="button"
            class="btnSalir"
            data-dismiss="modal"
            @click="salir"
          >
            Salir
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
  computed:{
    nombrePagina (){
      return this.$route.name;
    },
  },
  mounted() {
    // Si estamos jugando al juego "A contar" no mostramos el modal
    // porque antes debe aparecer otro. Lo mostramos para los demás-
    this.emitter.on("finTiempo", (finTiempo) => {
      if(this.nombrePagina!='Granja'){
        $("#tiempo").modal("show");
      }   
    });
  },
  methods: {
    //Emitimos el evento para mostrar el modal de Salida
     salir(){
      this.emitter.emit("salir", true);
    }
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