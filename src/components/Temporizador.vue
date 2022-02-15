<template>
  <div>{{ this.timer }}</div>
</template>

<script>
export default {
  name: "Temporizador",
  data() {
    return {
      timer: 15,
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
        } else {
          this.timer--;
        }
      }, 1000);
    },
  },
};
</script>

<style>
</style>