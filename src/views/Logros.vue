<template>
  <div id="home" class="row">
    <div
      id="cuadro_blanco"
      class="col-10 mx-auto mt-5 d-flex align-items-center"
    >
     <h2>¡¡¡Muy bien!!!</h2>
     <!-- <table class="table table-striped">
           <tbody>
        <tr>
          <td>
            <img
              :src="item.imagen"
              :alt="item.nombre"
              class="alimentosImagen"
            />
          </td>
          <td class="precioUnit mb-1">{{ item.precio }}</td>
        </tr>
      </tbody>
    </table> -->


      </div>
    </div>

</template>

<script>

export default {
  name: "Logros",
  data() {
    return {
      
    };
  },
  methods: {
    
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
