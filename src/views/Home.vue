<template>
   <div id="fondo" class="m-0 row justify-content-center">
        <!-- <Header /> -->
     <div
      id="cuadro_blanco"
      class="col-auto d-flex flex-column justify-content-around"
    > 
    </div>
  </div>
</template>

<script>

export default {
  name: 'Home',
  components: {

  }
}
</script>

<style>
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


</style>
