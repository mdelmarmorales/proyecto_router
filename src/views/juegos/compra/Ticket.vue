<template>
<div>
  <!-- Formulario para comprobar que se ha sumado correctamente el precio de los productos -->
  <form @submit.prevent="comprobarPrecio">
    <p>¿Cuánto cuesta?</p>
    <table>
      <tr v-for="item in cesta" v-bind:key="item">
        <td>{{ item.precio }}</td>
        <td>
          <img :src="item.imagen" :alt="item.nombre" class="alimentosImagen" />
        </td>
      </tr>
    </table>
    <input v-model="precioPropuesto" />
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
    <p v-if="this.correcto === false">¡Ups! Revisa el ticket.</p>
  </form>

  <!-- Formulario para comprobar que se ha calculado correctamente cuánto dinero sobra -->
  <form v-if="this.correcto" @submit.prevent="comprobarVuelta">
    <p>¿Cuánto sobra?</p>
    <table>
      <tr>
        <td>{{ this.dineroDisponible }}</td>
      </tr>
      <tr>
        <td>-</td>
        <td>{{ this.precioPropuesto }}</td>
      </tr>
    </table>
    <input v-model="vueltaPropuesta" />
    <button type="submit">Comprobar</button>
    <img
      class="correcto"
      src="@/images/correcto.png"
      alt="correcto"
      v-if="this.correctaVuelta === true"
    />
    <img
      class="correcto"
      src="@/images/incorrecto.png"
      alt="correcto"
      v-if="this.correctaVuelta === false"
    />
    <p v-if="this.correctaVuelta === false">¡Ups! Revisa la cuenta.</p>
  </form>
  </div>
</template>

<script>
export default {
  name: "Ticket",
  props: {
    cesta: Array,
  },
  data() {
    return {
      precioPropuesto: "",
      vueltaPropuesta: "",
      correcto: null,
      correctaVuelta: null,
    };
  },
  computed: {
    dineroDisponible() {
      let dinero;
      let precioPropInt = parseInt(this.precioPropuesto, 10);

      dinero = this.numeroAleatorio(precioPropInt, precioPropInt + 20);

      return dinero;
    },
  },
  methods: {
    comprobarPrecio() {
      let precio = 0;
      this.correcto = false;

      this.cesta.forEach((producto) => (precio += producto.precio));

      if (precio == this.precioPropuesto) {
        this.correcto = true;
      }
      console.log(this.correcto);
    },
    numeroAleatorio(min, max) {
      return Math.floor(Math.random() * (max - min + 1) + min);
    },
    comprobarVuelta() {
      this.correctaVuelta = false;

      if (
        this.dineroDisponible - this.precioPropuesto ==
        this.vueltaPropuesta
      ) {
        this.correctaVuelta = true;
      }
    },
  },
};
</script>

<style scoped>
.alimentosImagen,
.correcto {
  height: 30px;
}
</style>