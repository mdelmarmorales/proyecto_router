<template>
  <div v-if="this.correctoOperacion" id="cuadroManzanas" class="col-6 mb-4">
    <div id="tablero">
      <p class="enunciado">
        ¡Muy bien! <br />Ahora pincha en los dibujos para meter
        {{ this.resultado }} manzanas
      </p>
      <div id="manzanas" class="row mx-auto my-2 py-2 justify-content-around">
        <div class="col-4 d-flex justify-content-around">
          <img
            class="manzana"
            src="@/images/manzana.png"
            alt="1 manzana"
            @click="sumarManzanas"
          />
          <img
            class="manzana"
            src="@/images/10manzanas.png"
            alt="10 manzanas"
            @click="sumarManzanas"
          />
          <img
            class="manzana"
            src="@/images/100manzanas.png"
            alt="100 manzanas"
            @click="sumarManzanas"
          />
        </div>
        <div class="row d-flex justify-content-around">
          <form @submit.prevent="corregirManzana">
            <button class="btn-vaciar my-2 py-1" type="submit">Corregir</button>
          </form>

          <form @submit.prevent="comprobarManzanas">
            <button class="btn-comprobar m-2" type="submit">Comprobar</button>
            <img
              class="correcto"
              src="@/images/correcto.png"
              alt="correcto"
              v-if="this.correctoManzana === true"
            />
            <img
              class="correcto"
              src="@/images/incorrecto.png"
              alt="correcto"
              v-if="this.correctoManzana === false"
            />
          </form>
        </div>
      </div>

      <div v-if="manzanas">
        <img
          v-for="item in manzanas"
          v-bind:key="item"
          :src="item.url"
          :alt="item.name"
          class="manzana mx-2 mb-3"
        />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Calculadora",
  inject: ["id"],
  data() {
    return {
      correctoOperacion: null,
      correctoManzana: null,
      manzanas: [],
      contador: 0,
      resultado: 0,
    };
  },
  mounted() {
    /* Esperamos recibir el nº resultante de la operación
    y si éste es correcto o no */
    this.emitter.on("calculos", (calculos) => {
      this.resultado = calculos.resultado;
      this.correctoOperacion = calculos.correcto;
    });
  },
  methods: {
    /* Comprobamos si el nº de manzanas es el correcto */
    comprobarManzanas() {
      let puntos = JSON.parse(localStorage.getItem("puntuaciones"));
      this.correctoManzana = false;

      //Si acierta, sumamos un punto, paramos el temporizador y mostramos mensaje
      if (this.resultado == this.contador) {
        this.correctoManzana = true;
        puntos[0]++;
        localStorage.setItem("puntuaciones", JSON.stringify(puntos));
        this.emitter.emit("pararTiempo", true);
        this.emitter.emit("puntoConseguido", true);
      }
    },
    /* Mñetodo para borrar las manzanas y poner el contador a cero */
    corregirManzana() {
      this.manzanas = [];
      this.contador = 0;
      this.correctoManzana=null;
    },
    /* Método para contabilizar las manzanas en la cesta */
    sumarManzanas(event) {
      let imagen = event.target.getAttribute("src");
      let item;

      if (imagen.includes("100manzanas")) {
        this.contador += 100;
        item = {
          url: require("@/images/100manzanas.png"),
          name: "100 manzanas",
        };
      } else {
        if (imagen.includes("10manzanas")) {
          this.contador += 10;
          item = {
            url: require("@/images/10manzanas.png"),
            name: "10 manzanas",
          };
        } else {
          this.contador += 1;
          item = {
            url: require("@/images/manzana.png"),
            name: "1 manzana",
          };
        }
      }

      this.manzanas.push(item);
    },
  },
};
</script>

<style scoped>
#cuadroManzanas {
  background-color: #e0f7f2;
  border-radius: 10px;
}

.manzana {
  height: 3.125em;
  filter: drop-shadow(0 6px 3px rgba(0, 0, 0, 0.7));
}

.enunciado {
  font-weight: bold;
  background-color: #3fcfba;
}

.btn-vaciar {
  background-color: #ffa934;
  border: 2px solid #fd6400;
  border-radius: 5px;
  width: 6.25em;
  height: 2.5em;
}
</style>