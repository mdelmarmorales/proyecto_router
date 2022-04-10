<template>
  <div id="cuadroCesta" v-if="cesta" class="col-5 mb-4">
    <h3 id="tituloCesta">Cesta</h3>
    <img
      v-for="item in cesta"
      v-bind:key="item"
      :src="item.imagen"
      :alt="item.nombre"
      class="alimentosImagen m-2"
    />
    <div class="row d-flex justify-content-around">
      <form @submit.prevent="corregirCesta">
        <button class="btn-vaciar my-2 py-1" type="submit">Corregir</button>
      </form>

      <form @submit.prevent="comprobarCesta">
        <button class="btn-comprobar my-2 py-1" type="submit">Comprobar</button>
        <img
          class="correcto m-1"
          src="@/images/correcto.png"
          alt="correcto"
          v-if="this.correctoCesta === true"
        />
        <img
          class="correcto m-1"
          src="@/images/incorrecto.png"
          alt="correcto"
          v-if="this.correctoCesta === false"
        />
      </form>
    </div>
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
      //Mientras no hayamos validado la cesta, podemos seguir metiendo productos
      if(!this.correctoCesta){
        this.llenarCesta(productoSeleccionado);
      }      
    });
  },
  methods: {
    /* Método para almacenar los productos en la cesta. Buscamos el nombre del producto
    en el array de productos. */
    llenarCesta(productoSeleccionado) {
      const nuevoProducto = this.productos.find(
        (producto) => producto.nombre === productoSeleccionado
      );

      this.cesta.push(nuevoProducto);
    },
    /* Método para comprobar que los productos introducidos en la cesta son correctos */
    comprobarCesta() {
      let nombreProducto = "";
      this.correctoCesta = true;

      /*Comprobamos que todos los productos de la lista estén en la cesta 
    con la misma cantidad */
      this.listaCompra.some((element) => {
        nombreProducto = element.producto;
        const hayProducto = this.cesta.filter(
          (alimento) => alimento.nombre === nombreProducto
        );

        if (hayProducto.length !== element.cantidad) {
          return (this.correctoCesta = false);
        }
      });

      /*Luego buscamos productos en la cesta que no estén en la lista.
Si los hay, lo marcamos como incorrecto */
      this.cesta.some((element) => {
        nombreProducto = element.nombre;
        const hayProducto = this.listaCompra.filter(
          (alimento) => alimento.producto === nombreProducto
        );

        if (!hayProducto.length) {
          return (this.correctoCesta = false);
        }
      });
    },
    /* Metódo para eliminar el último producto de la cesta 
    cuando se pulsa "Corregir" */
    corregirCesta() {
      if(!this.correctoCesta){
      this.cesta.pop();
      }
    },
  },
};
</script>

<style scoped>
#cuadroCesta {
  background-color: #fff4ad;
  border-radius: 10px;
}

#tituloCesta {
  background-color: #fdcc4b;
}
/* .btn-comprobar {
  background-color: #3fcfba;
  border: 2px solid #071488;
  border-radius: 5px;
  width: 100px;
  height:40px;
} */

.btn-vaciar {
  background-color: #ffa934;
  border: 2px solid #fd6400;
  border-radius: 5px;
  width: 100px;
  height:40px;
}

.alimentosImagen {
  height: 50px;
  filter: drop-shadow(0 6px 3px rgba(0, 0, 0, 0.7));
}
/* .correcto {
  height: 40px;
} */
</style>