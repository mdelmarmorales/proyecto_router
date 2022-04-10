<!--  Cabecera de la página -->
<template>
   <router-link style="text-decoration:none" :to="{ name: 'Juegos' }">  
    <div id="cabecera" class="row d-flex align-items-center">
      <div class="col-2">
         <img
          src="../images/abaco.png"
          id="logo"
          class="img-fluid my-auto p-3"
        />
      </div>
      <div class="titulo col-8 mx-auto">
        <h1 class="my-auto">JUEGA CON LOS NÚMEROS</h1>
      </div>     
    </div>
</router-link>
</template>

<script>
export default {
  name: "Header",
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Bangers&display=swap");

#cabecera {
  height: 9em;
  background-color: #3fcfba;
}

#logo {
  background-color: white;
  height: 8em;
  border-radius: 10px;
}

.titulo h1 {
  font-family: "Bangers", cursive;
  font-size: 5em;
  background: -webkit-linear-gradient(white, #fdcc4b);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  color: white;
}

</style>