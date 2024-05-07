import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView,
      meta:{
        title: "Home nézet"
      }
    },
    {
      path: '/about',
      name: 'about',
      component: () => import('../views/AboutView.vue'),
      meta:{
        title: "Rólunk"
      }
    },
    {
      path: '/game',
      name: 'game',
      component: ()=> import('@/views/GameView.vue'),
      meta:{
        title: "Játék"
      }
    },    
    {
      path: '/login',
      name: 'login',
      component: ()=> import('@/views/LoginView.vue'),
      meta:{
        title: "Bejelentkezés"
      }
    },
    {
      path: '/register',
      name: 'register',
      component: ()=> import('@/views/RegisterView.vue'),
      meta:{
        title: "Regisztráció"
      }
    },
    {
      path: '/contact',
      name: 'contact',
      component: ()=> import('@/views/ContactView.vue'),
      meta:{
        title: "Kapcsolat"
      }
    },
    {
      path: '/database',
      name: 'database',
      component: () => import('../views/DatabaseListView.vue'),
      meta:{
        title: "A MySQL adatbázis "
      }
    },
    {
      path: '/cards',
      name: 'cards',
      component: ()=> import('@/views/AllCardView.vue'),
      meta:{
        title: "Érdekességek a világból"
      }
    },
  ]
})


router.beforeEach((to,from, next) => { document.title=`${to.meta.title} `;
  next();
})
export default router
