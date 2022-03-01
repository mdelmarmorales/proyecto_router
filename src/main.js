import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import mitt from 'mitt'
import axios from 'axios'
import vueAxios from 'vue-axios'

axios.defaults.baseURL = 'http://localhost/API_proyecto'

const emitter = mitt();

const app=createApp(App).use(router, axios, vueAxios)


// Variables globales
app.config.globalProperties.emitter = emitter;
app.config.globalProperties.edad = 8;

app.mount('#app')


