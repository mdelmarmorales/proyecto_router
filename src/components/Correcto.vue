<template>
  <div>
    <button type="submit">Comprobar</button>
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
  </div>
</template>

<script>
export default {
  name: "Correcto",
  data() {
    return {
      correcto: null,
    };
  },
  props: {
    propuesto: String,
    solucion: Number,
  },
   mounted() {
    this.emitter.on("comprueba", (propuesto, solucion) => {
         console.log ("solucion" + solucion);
        console.log ("propuesto" + propuesto);
      //this.productoSeleccionado = productoSeleccionado; //Guardamos el valor leído desde otro componente a un dato de éste
      this.comprobar(propuesto, solucion);
    });
  },
  methods: {
    comprobar(propuesto, solucion) {
       
       
      this.correcto = false;

      if (propuesto == solucion) {
        this.correcto = true;
      }
    },
  },
};
</script>

<style scoped>
.correcto {
  height: 30px;
}
</style>