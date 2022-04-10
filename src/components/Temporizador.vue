<!-- Temporizador para mostrar el tiempo de juego restante -->
<template>
  <div class="temporizador mr-2">{{ this.timer }} s</div>
</template>

<script>
export default {
  name: "Temporizador",
  data() {
    return {
      timer: 0,
      interval: "",
    };
  },
  mounted() {
    this.timer = this.calculaTiempo();
    this.actualizaTemporizador();
    // Esperamos el evento para eliminar el temporizador
    this.emitter.on("pararTiempo", (pararTiempo) => {
      this.eliminarTemporizador();
    });
  },
  /* Watcher que detecta un cambio en la url, y para el temporizador
  si vamos a otro juego */
  watch: {
    $route(to, from) {
      this.eliminarTemporizador();
    },
  },
  methods: {
    /* Calcula el tiempo de juego en función de la edad del niño */
    calculaTiempo() {
      let maximo;
      let edad = localStorage.getItem("edadNinyo");

      if (edad <= 8) {
        maximo = 120;
      } else {
        if (edad <= 10) {
          maximo = 90;
        } else {
          if (edad <= 12) {
            maximo = 70;
          } else {
            maximo = 50;
          }
        }
      }
      return maximo;
    },
    /* Método que actualiza el temporizador cada segundo */
    actualizaTemporizador() {
      this.interval = setInterval(() => { 
        if (this.timer == 0) {
          this.eliminarTemporizador();
          /* Cuando el tiempo finaliza emitimos un evento */
          this.emitter.emit("finTiempo", true);
        } else {
          this.timer--;
        }
      }, 1000);
    },
    /* Método para eliminar el temporizador */
    eliminarTemporizador() {
      clearInterval(this.interval);
    },
  },
};
</script>

<style scoped>
.temporizador {
  background-color: #e0f7f2;
  border: 3px solid #071488;
  border-radius: 5px;
  font-weight: bold;
  z-index: 1;
}
</style>