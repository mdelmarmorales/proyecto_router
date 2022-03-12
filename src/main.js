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
app.config.globalProperties.nombre ="";

app.mount('#app')


