import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import mitt from 'mitt'
import axios from 'axios'
import vueAxios from 'vue-axios'
import VueSimpleAlert from "vue-simple-alert"

axios.defaults.baseURL = 'http://localhost/API_proyecto'

const emitter = mitt();

const app=createApp(App).use(router, axios, vueAxios, VueSimpleAlert)


// Variables globales
app.config.globalProperties.emitter = emitter;
app.config.globalProperties.edad =0;
app.config.globalProperties.id =0;
app.config.globalProperties.fecha = new Date().toLocaleDateString();

/*Array de puntuaciones. Posiciones:
0- operaciones,
1- compra
2- contar
3- series
4- voz
5- horas */
app.config.globalProperties.puntuaciones = new Array(6).fill(0);    


app.mount('#app')


