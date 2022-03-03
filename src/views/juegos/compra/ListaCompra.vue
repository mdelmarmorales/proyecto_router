<template>
  <div id="cuadroLista" class="col-5 mb-4">
    <h3 id="tituloLista">Lista de la compra</h3>
    <ul class="lista">
      <li v-for="item in listaCompra" v-bind:key="item">
        {{ item.producto }}: {{ item.cantidad }}
      </li>
    </ul>
  </div>
  <Cesta :productos="productos" :listaCompra="listaCompra" />
</template>


<script>
import Cesta from "./Cesta.vue";

export default {
  name: "ListaCompra",
  components: {
    Cesta,
  },
  props: {
    productos: Array,
  },
  data() {
    return {
      cantidad: "",
      productos: this.productos,
    };
  },
  computed: {
    max() {
      let maximo;

      if (this.edad <= 6) {
        maximo = 3;
      } else {
        if (this.edad <= 8) {
          maximo = 6;
        } else {
          if (this.edad <= 10) {
            maximo = 10;
          } else {
            maximo = 15;
          }
        }
      }
      return maximo;
    },
    listaCompra() {
      let lista = [];
      let producto, cantidad, indiceProducto;

      //Hacemos una copia de los productos disponibles
      let copiaProductos = [...this.productos];

      //Obtenemos de manera aleatoria el total de productos que vamos a comprar
      let totalProductos = this.numeroAleatorio(1, this.max);

      do {
        indiceProducto = this.numeroAleatorio(0, copiaProductos.length - 1);
        producto = copiaProductos[indiceProducto].nombre;

        cantidad = this.numeroAleatorio(1, totalProductos);

        lista.push({ producto: producto, cantidad: cantidad });

        //Eliminamos el producto añadido para que no lo vuelva a añadir en una línea diferente
        copiaProductos.splice(indiceProducto, 1);

        totalProductos = totalProductos - cantidad;
      } while (totalProductos > 0);

      return lista;
    },
  },
  methods: {
    numeroAleatorio(min, max) {
      return Math.floor(Math.random() * (max - min + 1) + min);
    },
  },
};
</script>


<style scoped>
#cuadroLista {
  background-color: #fff4ad;
  border-radius: 10px;
}

#tituloLista {
  background-color: #fdcc4b;
}
</style>