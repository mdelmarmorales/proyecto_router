<template>
<div>
  <form @submit.prevent="comprobarResultado">
    <div v-if="this.operacion">
      <p>Cálculo</p>
      <table>
        <tr>
          <td>
            {{ this.operandos.oper1 }}
          </td>
        </tr>
        <tr>
          <td>
            {{ this.operandos.simbolo }}
          </td>
          <td>
            {{ this.operandos.oper2 }}
          </td>
        </tr>
      </table>
      <div id="v-model-basic" class="demo">
        <!-- ¿Quitar este div ? -->
        <input v-model="resultado" />
        <button type="submit">Comprobar</button>
      </div>
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
  </form>

  <div id="imagenes" v-if="this.correcto">
    <div id="tablero">
      <p>
        ¡Muy bien! Ahora pincha en los dibujos para meter
        {{ this.resultado }} manzanas
      </p>
      <div v-if="manzanas">
        <img
          v-for="item in manzanas"
          v-bind:key="item"
          :src="item.url"
          :alt="item.name"
          class="manzana"
        />
      </div>
    </div>
    <div id="manzanas">
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
      <button type="submit">Comprobar</button>
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
      <p v-if="this.correctoManzana === false">¡Ups! Tenías que meter {{this.resultado}} manzanas, pero hay {{this.contadorManzanas}}</p>
    </form>
  </div>
  </div>
</template>

<script>
export default {
  name: "Calculadora",
  data() {
    return {
      resultado: "",
      operacion: "",
      oper1: 0,
      oper2: 0,
      correcto: null,
      correctoManzana: null,
      manzanas: [],
      contadorManzanas: 0,
    };
  },
  computed: {
    operandos() {
      const MAX = 10,
        MIN = 0;
      let oper1, oper2, aux, simbolo;

      if (this.operacion === "suma") {
        oper1 = Math.floor(Math.random() * (MAX - MIN + 1) + MIN); //Entre 0 y MAX
        oper2 = Math.floor(Math.random() * (MAX - (oper1 - MIN) + 1) + MIN); //Entre 0 y (MAX-oper1)
        simbolo = "+";
      } else if (this.operacion === "resta") {
        oper1 = Math.floor(Math.random() * (MAX - MIN + 1) + MIN); //Entre 0 y MAX
        oper2 = Math.floor(Math.random() * (oper1 - MIN + 1) + MIN); //Entre 0 y oper1)
        simbolo = "-";
      } else if (this.operacion === "multiplicacion") {
        oper1 = Math.floor(Math.random() * (MAX - MIN + 1) + MIN); //Entre 0 y MAX
        oper2 = Math.floor(Math.random() * (MAX - MIN + 1) + MIN); //Entre 0 y MAX
        simbolo = "x";
      }
      if (this.operacion === "division") {
        /*Otenemos dos números aleatorios y los multiplicamos. Ése será
        el dividendo. Cualquiera de los otros dos será el divisor. Así nos aseguramos
        de tener divisiones exactas. Evitamos que cualquier de los numeros sea 0 */
        do {
          aux = Math.floor(Math.random() * (MAX - MIN + 1) + MIN); //Entre 0 y MAX
        } while (aux == 0);

        do {
          oper2 = Math.floor(Math.random() * (MAX - MIN + 1) + MIN); //Entre 0 y MAX
        } while (oper2 == 0);

        oper1 = aux * oper2; //Dividendo
        simbolo = "%";
      }
      return { oper1, oper2, simbolo };
    },
  },
  mounted() {
    this.emitter.on("operacionSelec", (operacion) => {
      this.operacion = operacion; //Guardamos el valor leído desde otro componente a un dato de éste
    });
  },
  methods: {
    comprobarResultado() {
      this.correcto = false;

      switch (this.operacion) {
        case "suma":
          if (this.operandos.oper1 + this.operandos.oper2 == this.resultado)
            this.correcto = true;
          break;
        case "resta":
          if (this.operandos.oper1 - this.operandos.oper2 == this.resultado)
            this.correcto = true;
          break;
        case "multiplicacion":
          if (this.operandos.oper1 * this.operandos.oper2 == this.resultado)
            this.correcto = true;
          break;
        case "division":
          if (this.operandos.oper1 / this.operandos.oper2 == this.resultado)
            this.correcto = true;
          break;
        default:
          break;
      }
    },
    comprobarManzanas() {
      this.correctoManzana = false;

      if (this.resultado == this.contadorManzanas) {
        this.correctoManzana = true;
      }
    },
    sumarManzanas(event) {
      let imagen = event.target.getAttribute("src");
      let item;

      if (imagen.includes("10manzanas")) {
        this.contadorManzanas += 10;
        item= {
          url: require("@/images/10manzanas.png"),
          name: "10 manzanas"
        };
      } else {
        this.contadorManzanas += 1;
         item= {
          url: require("@/images/manzana.png"),
          name: "1 manzana"
        };
      }

      this.manzanas.push(item);
    },
  },
};
</script>

<style scoped>
.correcto,
.manzana {
  height: 50px;
}
</style>