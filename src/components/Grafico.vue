<template>
  <h1>{{ $route.params.idJuego }}</h1>
  <h4>{{ idJuego }}</h4>
</template>

<script>
export default {
  name: "Grafico",
  data() {
    return {
      //   idJuego: this.$route.params.idJuego,
    };
  },
  mounted() {
    this.carga();
  },
  methods: {
    carga() {
      this.consultarPuntos();
    },
    consultarPuntos() {
      let datosGrafico = {
        idJugador: localStorage.getItem("idJugador"),
        idJuego: this.$route.params.idJuego,
      };

      fetch("http://localhost/API_proyecto/consultarLogros", {
        method: "POST",
        body: JSON.stringify(datosGrafico),
      })
        .then((respuesta) => respuesta.json())
        .then((datosRespuesta) => {
          console.log(datosRespuesta);
        });
    },
  },
};
</script>

<style>
</style>