import { createRouter, createWebHistory } from "vue-router";
import Home from "../views/Home.vue";
import Login from "../views/Login.vue";
import Register from "../views/Register.vue";
import Project from "../views/start/Project.vue";
import Welcome from "../views/start/Welcome.vue";
import NotFound from "../views/NotFound.vue";
import AuthLayout from "../components/Ant_AuthLayout.vue";
import PageLayout from "../components/Ant_PageComponent.vue";
import Restrictions from "../views/execution/Restrictions.vue";
import WhiteProject from "../views/execution/WhiteProject.vue";
import Graphic from "../views/execution/Graphic.vue";
import Person from "../views/person/Person.vue";
import Person_edit from "../views/person/Person_edit.vue";
import store from "../store";
var routes = []
if(sessionStorage.getItem('Id')) {
  routes = [

    {
      path: "/",
      redirect: "/home",
      name: "Auth",
      component: AuthLayout,
      meta: {isGuest: false},
      children: [
        {
          path: "/home",
          name: "Home",
          component: Home,
          meta: { layout: 'home' },
        },
        {
          path: "/login",
          name: "Login",
          component: Login,
          meta: { layout: 'login' },
        },
        {
          path: "/register",
          name: "Register",
          component: Register,
          meta: { layout: 'register' },
        },
        {
          path: "/start/welcome",
          name: "Welcome",
          component: Welcome,
          meta: { layout: 'home' },
        },
        {
          path: "/start/create_project",
          name: "Create_Project",
          component: Project,
          meta: { layout: 'home' },
        },
        {
          path: "/execution/restrictions_analysis",
          name: "restrictions_analysis",
          component: Restrictions,
          meta: { layout: 'home' },
        },
        {
          path: "/execution/restrictions_analysis/white_project",
          name: "white_project",
          component: WhiteProject,
          meta: { layout: 'home' },
        },
        {
          path: "/execution/graphic_advance",
          name: "graphic_advance",
          component: Graphic,
          meta: { layout: 'home' },
        },
        {
          path: "/person/person",
          name: "person",
          component: Person,
          meta: { layout: 'home' },
        },
        {
          path: "/person/person_edit",
          name: "person_edit",
          component: Person_edit,
          meta: { layout: 'home' },
        },


      ],
    },
    {
      path: '/404',
      name: 'NotFound',
      component: NotFound
    }
  ];
}
else {
  routes = [

    {
      path: "/",
      redirect: "/login",
      name: "Auth",
      component: AuthLayout,
      meta: {isGuest: false},
      children: [
        {
          path: "/login",
          name: "Login",
          component: Login,
          meta: { layout: 'login' },
        },
        {
          path: "/register",
          name: "Register",
          component: Register,
          meta: { layout: 'register' },
        },
        {
          path: "/home",
          name: "Home",
          component: Home,
          meta: { layout: 'home' },
        },

      ],
    },
    {
      path: '/404',
      name: 'NotFound',
      component: NotFound
    }
  ];
}

const router = createRouter({
  history: createWebHistory(),
  routes,
});

// router.beforeEach((to, from, next) => {
//   if (to.meta.requiresAuth && !store.state.user.token) {
//     next({ name: "Login" });
//   } else if (store.state.user.token && to.meta.isGuest) {
//     next({ name: "Dashboard" });
//   } else {
//     next();
//   }
// });

export default router;
