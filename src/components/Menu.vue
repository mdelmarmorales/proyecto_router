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
          <router-link :to="{ name: 'Home' }">Inicio</router-link>
        </div>
        <div class="dropdown-item">
          <router-link :to="{ name: 'Juegos' }">Juegos</router-link>
        </div>
        <div class="dropdown-item">
          <router-link :to="{ name: 'Logros' }">Logros</router-link>
        </div>
        <div class="dropdown-item">
          <p id="salir" @click="salir">Salir</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Menu",
  data() {
    return {
     
    };
  },
  computed:{
    esInicio (){
      return this.$route.name;
    }
  },
  // Emite un evento para que aparezca el modal de salida.
  methods: {
     salir(){
      this.emitter.emit("salir", true);
    }
  },
};
</script>

<style scoped>
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

.dropdown a.router-link, p{
  color: #0599e8;
}

p {
  font-weight: bold;
}

/* .dropdown a.router-link-exact-active, p:hover {
  color: #071488;
}  */
</style>