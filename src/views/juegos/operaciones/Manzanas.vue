<template>
    <div id="imagenes">
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
          v-if="this.correcto === true"
        />
        <img
          class="correcto"
          src="@/images/incorrecto.png"
          alt="correcto"
          v-if="this.correcto === false"
        />
        <p v-if="this.correcto === false">
          ¡Ups! Tenías que meter {{ this.resultado }} manzanas, pero hay
          {{ this.contador }}
        </p>  
      </form>  
  </div>
</template>

<script>
export default {
  name: "Calculadora",
  data() {
    return {
      correcto: null,
      manzanas: [],
      contador: 0,
    };
  }, 
  props: {
    resultado: Boolean,
  },
  mounted() {
    this.emitter.on("operacionSelec", (operacion) => {
      this.operacion = operacion; //Guardamos el valor leído desde otro componente a un dato de éste
    });
  },
  methods: {
     comprobarManzanas() {
      this.correcto = false;

      if (this.resultado == this.contador) {
        this.correcto = true;
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
.correcto,
.manzana {
  height: 50px;
}
</style>