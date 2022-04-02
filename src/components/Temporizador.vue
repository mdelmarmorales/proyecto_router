<template>
  <div class="temporizador mr-2">{{ this.timer }} s</div>
</template>

<script>
export default {
  name: "Temporizador",
  data() {
    return {
      timer: 50,
      interval: "",
    };
  },
  beforeMount() {
    // this.actualizaTemporizador();
  },
   mounted() {
     this.actualizaTemporizador();
    this.emitter.on("pararTiempo", (pararTiempo) => {
      this.eliminarTemporizador();
    });
  },
  /* Watcher que detecta un cambio en la url, y para el temporizador
  si vamos a otro juego */
  watch: {
    $route (to, from) {
      this.eliminarTemporizador();
    }
  },
  methods: {
    actualizaTemporizador() {
      this.interval = setInterval(() => {
        if (this.timer == 0) {
          this.eliminarTemporizador();
          this.emitter.emit("finTiempo", true);
        } else {
          this.timer--;
        }
      }, 1000);
    },
    eliminarTemporizador(){
      clearInterval(this.interval);
    }
  },
};
</script>

<style scoped>
.temporizador{
  background-color: #e0f7f2;
  border: 3px solid #071488;
  border-radius: 5px;
  font-weight: bold;
}
</style>