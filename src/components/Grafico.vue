<!-- Componente para mostrar el gráfico con los puntos conseguidos en cada fecha.
Se utilizan rutas dinámicas en función de la id del juego -->
<template>
  <div id="cuadro_blanco" class="col-10 mx-auto mt-5 d-flex align-items-center">
    <div
      class="
        row
        w-100
        d-flex
        flex-column
        justify-content-around
        align-items-center
      "
    >
      <h1 class="my-3">Ésta es tu evolución</h1>
      <!-- Insertamos un canvas donde se dibujará el gráfico -->
      <canvas id="grafico" class="mx-3 mb-3"></canvas>
    </div>
  </div>
</template>

<script>
export default {
  name: "Grafico",
  data() {
    return {
      datosGrafico: [],
      fechas: [],
      puntos: [],
    };
  },
  mounted() {
    this.consultarPuntos();
  },
  methods: {
    /*Método para consultar los puntos conseguidos por el jugador en función de la fecha */
    async consultarPuntos() {
      let datosGrafico = {
        idJugador: localStorage.getItem("idJugador"), //Leemos la id del jugador
        idJuego: this.$route.params.idJuego, //Parámetro leído de la ruta dinámica
      };

      /* Hacemos la consulta a la BD */
     await fetch("http://localhost/API_proyecto/consultarGrafico", {
        method: "POST",
        body: JSON.stringify(datosGrafico),
      })
        .then((respuesta) => respuesta.json())
        .then((datosRespuesta) => {
          this.datosGrafico = datosRespuesta;

          this.prepararDatos();
        });
    },
    prepararDatos() {
      this.datosGrafico.forEach((dato) => {
        this.puntos.push(parseInt(dato.puntuacion));
        this.fechas.push(dato.fecha_form);
      });

      this.dibujarGrafico();
    },
    /* Método para realizar el gráfico usando Chart JS
    https://www.w3schools.com/ai/ai_chartjs.asp  -*/
    dibujarGrafico() {
      /* Obtenemos el contexto del canvas */
      let ctx = document.getElementById("grafico").getContext("2d");

      let myChar = new Chart(ctx, {
        type: "line",
        data: {
          labels: this.fechas,
          datasets: [
            {
              label: "PUNTOS",
              data: this.puntos,
              options: {
                scales: {
                  yAxes: [
                    {
                      ticks: {
                        stepSize: 1,
                        beginAtZero: true
                      },
                    },
                  ],
                },
              },
            },
          ],
        },
      });
    },
  },
};
</script>

<style>
</style>