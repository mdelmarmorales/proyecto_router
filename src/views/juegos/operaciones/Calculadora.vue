<template>
  <div>
    <form @submit.prevent="comprobarResultado">
      <div v-if="this.operacion" id="calculos" class="float-left col-12 my-4">
        <p id="tituloCalculos">Cálculo</p>
        <table class="table">
          <tbody>
            <tr>
              <td></td>
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
          </tbody>
        </table>
        <div>
          <input class="col-3" v-model="resultado" />
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
        </div>
      </div>
    </form>
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
    };
  },
  computed: {
    /* Varible que varía en función de la edad del niño */
    max() {
      let maximo;
      let edad=localStorage.getItem("edadNinyo");

      if (edad <= 6) {
        maximo = 5;
      } else {
        if (edad <= 8) {
          maximo = 30;
        } else {
          if (edad <= 10) {
            maximo = 50;
          } else {
            maximo = 100;
          }
        }
      }
      return maximo;
    },
    /* Método para calcular de forma aleatoria los operandos
    según el tipo de operación */
    operandos() {
      const MIN = 0;
      let oper1, oper2, aux, simbolo;

      if (this.operacion === "suma") {
        oper1 = this.numeroAleatorio(MIN, this.max);
        oper2 = this.numeroAleatorio(MIN, this.max);
        simbolo = "+";
      } else if (this.operacion === "resta") {
        oper1 = this.numeroAleatorio(MIN, this.max);
        oper2 = this.numeroAleatorio(MIN, oper1);
        simbolo = "-";
      } else if (this.operacion === "multiplicacion") {
        oper1 = this.numeroAleatorio(MIN, this.max);
        oper2 = this.numeroAleatorio(MIN, oper1);
        simbolo = "x";
      }
      if (this.operacion === "division") {
        /*Otenemos dos números aleatorios y los multiplicamos. Ése será
        el dividendo. Cualquiera de los otros dos será el divisor. Así nos aseguramos
        de tener divisiones exactas. Evitamos que cualquier de los numeros sea 0 */
        do {
          aux = this.numeroAleatorio(MIN, this.max); 
        } while (aux == 0);

        do {
          oper2 = this.numeroAleatorio(MIN, this.max); 
        } while (oper2 == 0);

        oper1 = aux * oper2; //Dividendo
        simbolo = "%";
      }
      return { oper1, oper2, simbolo };
    },
  },
  mounted() {
    //Esperamos recibir la operación seleccionada
    this.emitter.on("operacionSelec", (operacion) => {
      this.operacion = operacion; 
    });
  },
  methods: {
    /* Elegir un  nº aleatorio */
    numeroAleatorio(min, max) {
      return Math.floor(Math.random() * (max - min + 1) + min);
    },
    /* Método para comprobar el resultado en función de la operación seleccionada */
    comprobarResultado() {
      this.correcto = false;

      switch (this.operacion) {
        case "suma":
          if (this.operandos.oper1 + this.operandos.oper2 == parseInt(this.resultado))
            this.correcto = true;
          // this.emitter.emit("calculos", {
          //   correcto: this.correcto,
          //   resultado: parseInt(this.resultado),
          // });
          break;
        case "resta":
          if (this.operandos.oper1 - this.operandos.oper2 == parseInt(this.resultado))
            this.correcto = true;
          // this.emitter.emit("calculos", {
          //   correcto: this.correcto,
          //   resultado: parseInt(this.resultado),
          // });

          break;
        case "multiplicacion":
          if (this.operandos.oper1 * this.operandos.oper2 == parseInt(this.resultado))
            this.correcto = true;
          // this.emitter.emit("calculos", {
          //   correcto: this.correcto,
          //   resultado: parseInt(this.resultado),
          // });

          break;
        case "division":
          if (this.operandos.oper1 / this.operandos.oper2 == parseInt(this.resultado))
            this.correcto = true;
          // this.emitter.emit("calculos", {
          //   correcto: this.correcto,
          //   resultado: parseInt(this.resultado),
          // });
          break;
        default:
          console.log("Ha ocurrido un error. Operación no válida.")
          break;
      }
      if(this.correcto){
         this.emitter.emit("calculos", {
            correcto: this.correcto,
            resultado: parseInt(this.resultado),
          })
      }
    },
  },
};
</script>

<style scoped>
/* .correcto{
  height: 50px;
} */

#calculos {
  background-color: #fff4ad;
  border-radius: 10px;
}

#tituloCalculos {
  background-color: #fdcc4b;
  color: #071488;
}

/* .btn-comprobar {
  background-color: #3fcfba;
  border: 2px solid #071488;
   border-radius: 5px;
  width: 100px;
  height:40px;
} */
</style>