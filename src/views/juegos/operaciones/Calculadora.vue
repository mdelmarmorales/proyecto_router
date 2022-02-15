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
      <Manzanas :resultado="this.resultado"/>
    </div>
  </div>
</template>

<script>
import Manzanas from "./Manzanas.vue";
export default {
  name: "Calculadora",
  components: { Manzanas },
  data() {
    return {
      resultado: "",
      operacion: "",
      oper1: 0,
      oper2: 0,
      correcto: null,
    };
  },
  computed: {
    operandos() {
      const MAX = 10,
        MIN = 0;
      let oper1, oper2, aux, simbolo;

      if (this.operacion === "suma") {
        oper1 = this.numeroAleatorio(MIN, MAX);
        oper2 = this.numeroAleatorio(MIN, MAX - oper1);
        simbolo = "+";
      } else if (this.operacion === "resta") {
        oper1 = this.numeroAleatorio(MIN, MAX);
        oper2 = this.numeroAleatorio(MIN, oper1);
        simbolo = "-";
      } else if (this.operacion === "multiplicacion") {
        oper1 = this.numeroAleatorio(MIN, MAX);
        oper2 = this.numeroAleatorio(MIN, oper1);
        simbolo = "x";
      }
      if (this.operacion === "division") {
        /*Otenemos dos números aleatorios y los multiplicamos. Ése será
        el dividendo. Cualquiera de los otros dos será el divisor. Así nos aseguramos
        de tener divisiones exactas. Evitamos que cualquier de los numeros sea 0 */
        do {
          aux = this.numeroAleatorio(MIN, MAX); //Entre 0 y MAX
        } while (aux == 0);

        do {
          oper2 = this.numeroAleatorio(MIN, MAX); //Entre 0 y MAX
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
    numeroAleatorio(min, max) {
      return Math.floor(Math.random() * (max - min + 1) + min);
    },
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
        item = {
          url: require("@/images/10manzanas.png"),
          name: "10 manzanas",
        };
      } else {
        this.contadorManzanas += 1;
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
.correcto,
.manzana {
  height: 50px;
}
</style>