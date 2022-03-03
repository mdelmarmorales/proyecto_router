<template>
  <div class="temporizador mr-2">{{ this.timer }} s</div>
</template>

<script>
export default {
  name: "Temporizador",
  data() {
    return {
      timer: 55,
      interval: "",
    };
  },
  beforeMount() {
    this.actualizaContador();
  },
  methods: {
    actualizaContador() {
      this.interval = setInterval(() => {
        if (this.timer == 0) {
          clearInterval(this.interval);
          this.emitter.emit("finTiempo", true);
        } else {
          this.timer--;
        }
      }, 1000);
    },
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