<template>
  <div class="row alimentos">
    <div
      class="cuadroAlimentos col-9 d-flex flex-row justify-content-around ml-3 my-3 p-3"
    >
      <img
        class="alimentosImagen"
        v-for="item in productos"
        v-bind:key="item"
        :src="item.imagen"
        :alt="item.nombre"
        @click="llenarCesta"
      />
    </div>
  </div>
</template>

<script>
export default {
  name: "Alimentos",
  props: {
    productos: Array,
    comienzo: Boolean
  },
  methods: {
    /*Método que, si el juego ya ha comenzado, pasa por el bus de eventos
    la imagen que hemos pulsado para que entre en la cesta */
    llenarCesta(event) {
      // if (this.comienzo){
        this.emitter.emit("productoSelec", event.target.alt);
      // }
    },
  },
};
</script>

<style scoped>
.cuadroAlimentos {
  background-color: #3fcfba;
  border: 3px solid #071488;
  border-radius: 8px;
}

.alimentosImagen {
  height: 3.125em;
  filter: drop-shadow(0 6px 3px rgba(0, 0, 0, 0.7));
}
</style>