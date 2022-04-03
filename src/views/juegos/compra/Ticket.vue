<template>
  <div class="col-5">
    <!-- Formulario para comprobar que se ha sumado correctamente el precio de los productos -->
    <h3 class="tituloTicket">¿Cuánto cuesta?</h3>

    <table class="table table-striped">
      <thead class="thead">
        <tr>
          <th class="col-2">Producto</th>
          <th class="col-2">Precio</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="item in cesta" v-bind:key="item">
          <td>
            <img
              :src="item.imagen"
              :alt="item.nombre"
              class="alimentosImagen"
            />
          </td>
          <td class="precioUnit mb-1">{{ item.precio }}</td>
        </tr>
      </tbody>
    </table>

    <form @submit.prevent="comprobarPrecio">
      <input v-model="precioPropuesto" />
      <button class="btn-comprobar m-2" type="submit">Comprobar</button>
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
  <div class="col-5">
    <!-- Formulario para comprobar que se ha calculado correctamente cuánto dinero sobra -->
    <form v-if="this.correcto" @submit.prevent="comprobarVuelta">
      <h3 class="tituloTicket">¿Cuánto sobra?</h3>
      <table class="table">
        <tbody>
          <tr>
            <th>Disponible</th>
            <td></td>
            <td class="text-left">{{ this.dineroDisponible }}</td>
          </tr>
          <tr>
            <th>Gastado</th>
            <td class="text-right">-</td>
            <td class="text-left">{{ this.precioPropuesto }}</td>
          </tr>
        </tbody>
      </table>

      <input v-model="vueltaPropuesta" />
      <button class="btn-comprobar m-2" type="submit">Comprobar</button>
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
    /* Varible que varía en función de la edad del niño y que se utiliza para 
    calcular el dinero disponible */
    auxDisponible() {
      let maximo;
      let edad=localStorage.getItem("edadNinyo");

      if (edad <= 8) {
        maximo = 5;
      } else {
        if (edad <= 10) {
          maximo = 10;
        } else {
          if (edad <= 12) {
            maximo = 30;
          } else {
            maximo = 50;
          }
        }
      }
      return maximo;
    },
    /* El dinero disponible se calcula sumando un nº aleatorio
    al precio de los productos */
    dineroDisponible() {
      let dinero;
      let precioPropInt = parseInt(this.precioPropuesto, 10);

      dinero = this.numeroAleatorio(precioPropInt, precioPropInt + this.auxDisponible);

      return dinero;
    },
  },
  methods: {
    /* Método para calcular si el niño ha sumado correctamente el precio de los productos */
    comprobarPrecio() {
      let precio = 0;
      this.correcto = false;

      this.cesta.forEach((producto) => (precio += producto.precio));

      if (precio == parseInt(this.precioPropuesto)) {
        this.correcto = true;
      }
    },
    /* Método para obtener un nº aleatorio */
    numeroAleatorio(min, max) {
      return Math.floor(Math.random() * (max - min + 1) + min);
    },
    /* Método para comprobar si el niño ha calculado correctamente el dinero sobrante */
    comprobarVuelta() {
      this.correctaVuelta = false;
      let puntos = JSON.parse(localStorage.getItem("puntuaciones"));

      if (
        this.dineroDisponible - parseInt(this.precioPropuesto) ==
        parseInt(this.vueltaPropuesta)
      ) {
        this.correctaVuelta = true;
        //Si acierta, sumamos un punto, paramos el temporizador y mostramos mensaje
        puntos[1]++;
        localStorage.setItem("puntuaciones", JSON.stringify(puntos));
        this.emitter.emit("pararTiempo", true);
        this.emitter.emit("puntoConseguido", true);
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

.alimentosImagen {
  filter: drop-shadow(0 6px 3px rgba(0, 0, 0, 0.7));
}

.btn-comprobar {
  background-color: #3fcfba;
  border: 2px solid #071488;
  border-radius: 5px;
  width: 100px;
  height: 40px;
}
.table {
  background-color: #e0f7f2;
  border-radius: 10px;
}

.tituloTicket {
  background-color: #3fcfba;
}
</style>