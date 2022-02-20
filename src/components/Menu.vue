<template>
<div class="row">
      <div class="dropdown dropleft d-flex col-12">
      <button
        type="button"
        class="btn dropdown-toggle py-0 ml-auto"
        data-toggle="dropdown"
      >
        Menú
      </button>
      <div class="dropdown-menu mt-0">
        <div class="dropdown-item">
          <router-link :to="{ name: 'Home' }" class="item">Inicio</router-link>
        </div>
        <div class="dropdown-item">
          <router-link :to="{ name: 'Juegos' }">Juegos</router-link>
        </div>
        <div class="dropdown-item">
          <router-link :to="{ name: 'Registro' }">Registro</router-link>
        </div>
      </div>
    </div>
    </div>
</template>

<script>
</script>

<style>
.dropdown {
  padding: 3px;
  background: #fdcc4b;
  border: solid 2px #071488;
  width: 100%;
}

.btn {
  background: #fdcc4b;
  color: #071488;
  font-weight: bold;
}

.item {
  color: #071488;
  font-weight: bold;
}

.dropdown a.router-link-exact-active {
  color: #42b983;
}
</style>