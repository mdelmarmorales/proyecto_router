<template>
  <div v-if="this.correctoOperacion" id="cuadroManzanas" class="col-6 mb-4">
    <div id="tablero">
      <p class="enunciado">
        ¡Muy bien! <br/>Ahora pincha en los dibujos para meter
        {{ this.resultado }} manzanas
      </p>
      <div id="manzanas" class="row mx-auto my-2 py-2 justify-content-around">
        <div class="col-4 d-flex justify-content-around">
          <img
            class="manzana"
            src="@/images/10manzanas.png"
            alt="10 manzanas"
            @click="sumarManzanas"
          />
          <img
            class="manzana"
            src="@/images/manzana.png"
            alt="1 manzana"
            @click="sumarManzanas"
          />
        </div>
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
          <p v-if="this.correctoManzana === false">
            ¡Ups! Tenías que meter {{ this.resultado }} manzanas, pero hay
            {{ this.contador }}
          </p>
        </form>
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
    this.emitter.on("calculos", (calculos) => {
      this.resultado = calculos.resultado;
      this.correctoOperacion = calculos.correcto;
      console.log(this.resultado + "result manzasas");
      console.log(this.correctoOperacion + "correcto manzasas");
    });
  },
  methods: {
    comprobarManzanas() {
      this.correctoManzana = false;

      if (this.resultado == this.contador) {
        this.correctoManzana = true;
      }
    },
    sumarManzanas(event) {
      let imagen = event.target.getAttribute("src");
      let item;

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
.correcto,
.manzana {
  height: 50px;
}

.enunciado {
  font-weight: bold;
  background-color: #3fcfba;
}

.btn-comprobar {
  background-color: #3fcfba;
  border: 2px solid #071488;
  border-radius: 10px;
}

.manzana{
  filter: drop-shadow(0 6px 3px rgba(0,0,0,0.7));
}
</style>