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
            class="btnSeguir"
            data-dismiss="modal"
           
          >
           <router-link :to="{name: this.nombrePagina}">Jugar de nuevo</router-link> 
          </button>
          <button type="button" class="btnSeguir" data-dismiss="modal">
            <router-link :to="{ name: 'Juegos' }">Otro juego</router-link>
          </button>
          <button type="button" class="btnSalir" data-dismiss="modal" @click="salir">
           Salir
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
  //   volver(){
  //     console.log(this.nombrePagina);
  //     this.$router.push(this.nombrePagina);
  //   }
     salir(){
      this.emitter.emit("salir", true);
    }
   }, 
  computed:{
    nombrePagina (){
      return this.$route.name;
    }}
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