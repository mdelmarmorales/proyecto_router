<template>
  <div id="home" class="row">
    <div
      id="cuadro_blanco"
      class="col-10 mx-auto mt-5 d-flex align-items-center"
    >
    <div v-for="people in this.people" :key="people.id">
      {{people.name}}
    </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Home",
   data() {
    return {
      people: [],
    };
  },
  created() {
    this.consultarPeoples();
  },
  methods: {
    consultarPeoples() {
      fetch('http://localhost/API_people/peoples', 
      {mode: 'cors'})
        .then((respuesta) => respuesta.json())
        .then((datosRespuesta) => {
          console.log(datosRespuesta);
          this.people=datosRespuesta;
        })
        .catch(console.log);
    },
  },
};
</script>

<style scoped>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#fondo {
  background-image: url("../images/fondo.png");
  background-size: cover;
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-position: center;
}

#formulario {
  background-color: #e0f7f2;
  border: 2px solid #071488;
  border-radius: 15px;
}
.boton {
  background-color: #3fcfba;
  border: 2px solid #071488;
  border-radius: 5px;
}

h1 {
  color: #071488;
  font-weight: bold;
}
</style>
