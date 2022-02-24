<template>
  <div class="row alimentos">
      <div class="col-9 d-flex flex-row justify-content-around mb-3">
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
  },
   methods: {
    llenarCesta(event) {
      this.emitter.emit("productoSelec", event.target.alt);
    },
  },

}
</script>

<style>
.alimentosImagen {
  height: 50px;
}
</style>