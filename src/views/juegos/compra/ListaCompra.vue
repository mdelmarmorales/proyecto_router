<template>
     <div id="cuadroLista" class="col-3">
      <h3 id="tituloLista">Lista de la compra</h3>
      <ul class="lista">
        <li v-for="item in listaCompra" v-bind:key="item">
          {{ item.producto }}: {{ item.cantidad }}
        </li>
      </ul>
      </div>
   
    <div id="cuadroCesta" v-if="cesta" class="col-3">
      <h3 id="tituloCesta">Cesta</h3>
      <img
        v-for="item in cesta"
        v-bind:key="item"
        :src="item.imagen"
        :alt="item.nombre"
        class="alimentosImagen"
      />

      <form @submit.prevent="comprobarCesta">
        <button type="submit">Comprobar</button>
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
        <p v-if="this.correctoCesta === false">¡Ups! Revisa la cesta.</p>
      </form>
    </div>

    <div v-if="correctoCesta" class="col-4">
      <Ticket :cesta="cesta"  />
    </div>

</template>


<script>
import Ticket from "./Ticket.vue";

export default {
  name: "ListaCompra",
  components: {
    Ticket,
  },
  props: {
    productos: Array,
  },
  data() {
    return {
      lista: [],
      cesta: [],
      cantidadesCesta: [],
      cantidad: "",
      correctoCesta: null,
      productoSeleccionado: "",
    };
  },
  computed: {
    listaCompra() {
      let lista = [];
      let producto, cantidad, indiceProducto;

      //Hacemos una copia de los productos disponibles
      let copiaProductos = [...this.productos];

      //Obtenemos de manera aleatoria el total de productos que vamos a comprar
      let totalProductos = this.numeroAleatorio(1, 6);

      do {
        indiceProducto = this.numeroAleatorio(0, copiaProductos.length - 1);
        producto = copiaProductos[indiceProducto].nombre;

        cantidad = this.numeroAleatorio(1, totalProductos);

        lista.push({ producto: producto, cantidad: cantidad });
        copiaProductos.splice(indiceProducto, 1);

        totalProductos = totalProductos - cantidad;
      } while (totalProductos > 0);
      return lista;
    },
  },
  mounted() {
    this.emitter.on("productoSelec", (productoSeleccionado) => {
      //this.productoSeleccionado = productoSeleccionado; //Guardamos el valor leído desde otro componente a un dato de éste
      this.llenarCesta(productoSeleccionado);
    });
  },
  methods: {
    numeroAleatorio(min, max) {
      return Math.floor(Math.random() * (max - min + 1) + min);
    },
    llenarCesta(productoSeleccionado) {
      const nuevoProducto = this.productos.find(
        (producto) => producto.nombre === productoSeleccionado
      );
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


<style scoped>
.correcto,
.alimentosImagen {
  height: 50px;
}

#cuadroLista{
  background-color: #faea7d;
  border-radius: 10px;
}

#tituloLista {
  background-color: #fdcc4b;
}

#cuadroCesta{
  background-color: #e0f7f2;
  border-radius: 10px;
}

#tituloCesta{
  background-color: #3fcfba;
}

</style>