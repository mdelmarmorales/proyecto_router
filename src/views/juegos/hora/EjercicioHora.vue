<template>
  <div class="row juego mx-3 my-4">
    <form
      class="col-11 mx-auto my-4 justify-content-around"
      @submit.prevent="comprobar"
    >
      <p>
        ¿Qué reloj marca las {{ this.horaSeleccionada.hora.nombre }}
        {{ this.horaSeleccionada.minuto.nombre }}?
      </p>
      <b-form-radio-group>
        <label class="form-check-label mr-5">
          <input
            type="radio"
            class="form-check-input"
            v-model="horaPropuesta"
            name="hora"
            value="0"
          />
          <span
            class="hora ml-2 mr-6 px-5 py-2"
            v-if="this.horaSeleccionada.minuto.numero < 35"
          >
            {{ this.hora[0].hora.numero }}:{{ this.hora[0].minuto.numero }}
          </span>
           <!-- Si los minutos pasan de 35, restamos uno para sumar las horas "menos algo".  -->
          <span class="hora ml-2 mr-6 px-5 py-2" v-else>
            {{ this.hora[0].hora.numero - 1 }}:{{ this.hora[0].minuto.numero }}
          </span>
        </label>

        <label class="form-check-label mr-5">
          <input
            type="radio"
            class="form-check-input"
            v-model="horaPropuesta"
            name="hora"
            value="1"
          />
          <span
            class="hora mx-2 px-5 py-2"
            v-if="this.horaSeleccionada.minuto.numero < 35"
          >
            {{ this.hora[1].hora.numero }}:{{ this.hora[1].minuto.numero }}
          </span>
          <span class="hora mx-2 px-5 py-2" v-else>
            {{ this.hora[1].hora.numero - 1 }}:{{ this.hora[1].minuto.numero }}
          </span>
        </label>

        <label class="form-check-label mr-5">
          <input
            type="radio"
            class="form-check-input"
            v-model="horaPropuesta"
            name="hora"
            value="2"
          />
          <span
            class="hora mx-2 px-5 py-2"
            v-if="this.horaSeleccionada.minuto.numero < 35"
          >
            {{ this.hora[2].hora.numero }}:{{ this.hora[2].minuto.numero }}
          </span>
          <span class="hora mx-2 px-5 py-2" v-else>
            {{ this.hora[2].hora.numero - 1 }}:{{ this.hora[2].minuto.numero }}
          </span>
        </label>
      </b-form-radio-group>

      <button v-if="this.comienzo" class="btn-comprobar mx-2" type="submit">Comprobar</button>
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
</template>

<script>
export default {
  name: "EjercicioHora",
  data() {
    return {
      correcto: null,
      contador:0,
    };
  },
  props: {
    hora: Array,
    indiceHora: Number,
    horaSeleccionada: Object,
    comienzo: Boolean,
    contadorJuegos: Number
  },
  methods: {
    comprobar() {
      this.correcto = false;
      let puntos = JSON.parse(localStorage.getItem("puntuaciones"));
      this.contador=this.contadorJuegos; //Copiamos. Las props son de sólo lectura


      if (parseInt(this.horaPropuesta) == this.indiceHora) {
        this.correcto = true;
        this.contador++;
        // Pasamos al padre el nº de juegos completados hasta el momento
        this.emitter.emit("contadorJuegos", this.contador);
        // Si eya están terminados los 3 ejercicios, llamamos al modal de punto conseguido
        if (this.contador==3) {
          //Si acierta, sumamos un punto, paramos el temporizador y mostramos mensaje
          puntos[5]++;
          localStorage.setItem("puntuaciones", JSON.stringify(puntos));
          this.emitter.emit("pararTiempo", true);
          this.emitter.emit("puntoConseguido", true);
        }
      }
    },
  },
};
</script>

<style scoped>
.juego {
  background-color: #faea7d;
  border: 2px solid #071488;
  border-radius: 15px;
}

.btn-comprobar {
  background-color: #3fcfba;
  border: 2px solid #071488;
  border-radius: 5px;
  width: 100px;
  height: 40px;
}

.hora {
  background-color: #e0f7f2;
  border: 2px solid #071488;
  border-radius: 5px;
}

.correcto {
  height: 30px;
}
</style>