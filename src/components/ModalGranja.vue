<template>
  <div id="finGranja" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Introduce tu respuesta</h5>
        </div>
        <div class="modal-body">
          <form
            @submit.prevent="comprobarAnimales"
            id="pregunta"
            class="col-10 mx-auto"
          >
            <p class="mt-2">
              ¿Cuántas veces ha aparecido este animal?
              <span>{{ this.animalABuscar.nombre }}</span>
            </p>
            <input v-model="numAnimales" />
            <button class="btn-comprobar mt-1 mb-2 mx-2" type="submit">
              Comprobar
            </button>
             <img
        class="correcto"
        src="@/images/correcto.png"
        alt="correcto"
        v-if="this.correcto === true"
      />
      <img
        class="correcto"
        src="@/images/incorrecto.png"
        alt="correcto"
        v-if="this.correcto === false"
      />
          </form>
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
      animalABuscar: [],
      correcto: null,
    };
  },
  mounted() {
    this.emitter.on("finGranja", (animalABuscar) => {
      this.animalABuscar=animalABuscar;
      $("#finGranja").modal("show");
    });
  },
  methods: {
    comprobarAnimales() {
      this.correcto = false;
      let puntos = JSON.parse(localStorage.getItem("puntuaciones"));

      if (parseInt(this.numAnimales) === this.animalABuscar.contador) {
        this.correcto = true;
        puntos[2]++;
        localStorage.setItem("puntuaciones", JSON.stringify(puntos));
        $("#finGranja").modal("hide");
        this.emitter.emit("puntoConseguido", true);
      }
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
span {
  font-weight: bold;
}
</style>