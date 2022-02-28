<template>
  <div
    class="footer row d-flex justify-content-end align-items-center mt-5 py-3"
  >
    <p class="col-3 my-auto">Visita nuestras redes sociales -</p>
    <div class="enlace row">
      <a class="col-3 d-flex align-items-center" href="#">
        <p class="my-auto">Twitter:</p>
        <img src="../images/logo_twitter.png" alt="logo twitter"
      /></a>
    </div>

    <div class="enlace row mx-3 my-auto">
      <a class="col-3 d-flex align-items-center" href="#">
        <p class="my-auto">Instagram:</p>
        <img src="../images/logo_instagram.png" alt="logo instagram"
      /></a>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style scoped>
.footer {
  background-color: #3fcfba;
}

p {
  color: white;
  font-weight: bold;
  text-shadow: black 0.1em 0.1em 0.2em;
}

img {
  height: 40px;
}
</style>