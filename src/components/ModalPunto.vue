<template>
  <div id="punto" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Punto conseguido</h5>
        </div>
        <div class="modal-body">
          <p>
            ¡Muy bien! Has ganado un punto. Sigue así. <br />
            ¿Qué quieres hacer ahora?
          </p>
          <img src="../images/puntos.jpg" alt="puntuacion" class="col-10" />
        </div>
        <div class="modal-footer">
           <button
            type="button"
            class="btnRecargar"
            @click=volver()
            data-dismiss="modal"
          >
           Jugar de nuevo
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
  name: "ModalPunto",
  data() {
    return {
      puntoConseguido: null,
    };
  },
  mounted() {
    this.emitter.on("puntoConseguido", (puntoConseguido) => {
      $("#punto").modal("show");
    });
  },
  methods: {
    volver(){
      this.$router.go(0);
    }
  }
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