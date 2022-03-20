import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
import Juegos from '../views/juegos/Juegos.vue'
import Series from '../views/juegos/series/Series.vue'
import Compra from '../views/juegos/compra/Compra.vue'
import Granja from '../views/juegos/granja/Granja.vue'
import Operaciones from '../views/juegos/operaciones/Operaciones.vue'
import Voz from '../views/juegos/voz/Voz.vue'
import Hora from '../views/juegos/hora/Hora.vue'
import Registro from '../views/Registro.vue'
import Logros from '../views/Logros.vue'
import Graficos from '../views/Graficos.vue'

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/juegos',
    name: 'Juegos',
    component: Juegos
  },
  {
    path: '/registro',
    name: 'Registro',
    component: Registro
  },
  {
    path: '/logros',
    name: 'Logros',
    component: Logros
  },
  {
    path: '/juegos/series',
    name: 'Series',
    component: Series,
  },
  {
    path: '/juegos/compra',
    name: 'Compra',
    component: Compra,
    props: true
  },
  {
    path: '/juegos/granja',
    name: 'Granja',
    component: Granja,
  },
  {
    path: '/juegos/operaciones',
    name: 'Operaciones',
    component: Operaciones,
  },
  {
    path: '/juegos/voz',
    name: 'Voz',
    component: Voz,
  },
  {
    path: '/juegos/hora',
    name: 'Hora',
    component: Hora,
  },
  {
    path: '/graficos/:idJuego',
    name: 'Graficos',
    component: Graficos,
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
