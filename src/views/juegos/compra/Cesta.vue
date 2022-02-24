<template>
  <div id="cuadroCesta" v-if="cesta" class="col-5 mb-4">
    <h3 id="tituloCesta">Cesta</h3>
    <img
      v-for="item in cesta"
      v-bind:key="item"
      :src="item.imagen"
      :alt="item.nombre"
      class="alimentosImagen"
    />
    <form @submit.prevent="comprobarCesta">
      <button class="btn-comprobar my-2" type="submit">Comprobar</button>
      <img
        class="correcto"
        src="@/images/correcto.png"
        alt="correcto"
        v-if="this.correctoCesta === true"
      />
      <img
        class="correcto"
        src="@/images/incorrecto.png"
        alt="correcto"
        v-if="this.correctoCesta === false"
      />
    </form>
    <p v-if="this.correctoCesta === false">¡Ups! Revisa la cesta.</p>
  </div>

  <Ticket
    v-if="this.correctoCesta === true"
    :productos="productos"
    :cesta="cesta"
    class="row d-flex flex-row justify-content-around"
  />
  
</template>

<script>
import Ticket from "./Ticket.vue";
export default {
  name: "Cesta",
  components: {
    Ticket,
  },
  props: {
    listaCompra: Array,
    productos: Array,
  },
  data() {
    return {
      cesta: [],
      cantidad: "",
      correctoCesta: null,
      productoSeleccionado: "",
    };
  },
  mounted() {
    this.emitter.on("productoSelec", (productoSeleccionado) => {
      this.productoSeleccionado = productoSeleccionado; //Guardamos el valor leído desde otro componente a un dato de éste

      this.llenarCesta(productoSeleccionado);
    });
  },
  methods: {
    llenarCesta(productoSeleccionado) {
      const nuevoProducto = this.productos.find(
        (producto) => producto.nombre === productoSeleccionado
      );
      console.log("Selec" + nuevoProducto);
      this.cesta.push(nuevoProducto);
      console.log(this.cesta);
    },
    comprobarCesta() {
      let nombreProducto = "";

      this.listaCompra.forEach((element) => {
        nombreProducto = element.producto;
        const hayProducto = this.cesta.filter(
          (alimento) => alimento.nombre === nombreProducto
        );

        if (hayProducto.length == element.cantidad) {
          this.correctoCesta = true;
        } else {
          this.correctoCesta = false;
        }
      });
    },
  },
};
</script>

<style>
#cuadroCesta {
  background-color: #faea7d;
  border-radius: 10px;
}

#tituloCesta {
  background-color: #fdcc4b;
}
.btn-comprobar {
  background-color: #3fcfba;
  border: 2px solid #071488;
  border-radius: 10px;
}

.correcto,
.alimentosImagen {
  height: 50px;
}
</style>