import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import mitt from 'mitt'
import axios from 'axios'
import VueAxios from 'vue-axios'

const emitter = mitt();

const app=createApp(App).use(router, VueAxios, axios)

app.config.globalProperties.emitter = emitter;

app.mount('#app')


// createApp(App).use(router).mount('#app')
