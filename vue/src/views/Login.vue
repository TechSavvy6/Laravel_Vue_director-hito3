<template>
  <!-- <div>
    <img
      class="mx-auto h-12 w-auto"
      src="https://tailwindui.com/img/logos/workflow-mark-indigo-600.svg"
      alt="Workflow"
    />
    <h2 class="mt-6 text-center text-3xl font-extrabold text-gray-900">
      Sign in to your account
    </h2>
    <p class="mt-2 text-center text-sm text-gray-600">
      Or
      {{ " " }}
      <router-link
        :to="{ name: 'Register' }"
        class="font-medium text-indigo-600 hover:text-indigo-500"
      >
        register for free
      </router-link>
    </p>
  </div> -->
  <div class="flex flex-col w-[450px] sm:w-full text-base">
    <span class="text-center sm:text-left text-[28px] leading-5 mb-8 sm:mb-8"> Iniciar Sesión</span>
    <nav class=" text-center text-sm text-gray-600">
      O
      {{ " " }}
      <router-link
        :to="{ name: 'Register' }"
        class="font-medium text-indigo-600 hover:text-indigo-500"
      >
        Registrate
      </router-link>
    </nav>
  <span class="text-center sm:text-left text-[16px] leading-9 mb-10 sm:mb-8"> Indicanos tu correo y contraseña</span>


  <form class="mt-8 space-y-6" @submit="login">
    <Alert v-if="errorMsg">
      {{ errorMsg }}
      <span
        @click="errorMsg = ''"
        class="w-8 h-8 flex items-center justify-center rounded-full transition-colors cursor-pointer hover:bg-[rgba(0,0,0,0.2)]"
      >
        <svg
          xmlns="http://www.w3.org/2000/svg"
          class="h-6 w-6"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="M6 18L18 6M6 6l12 12"
          />
        </svg>
      </span>
    </Alert>
    <input type="hidden" name="remember" value="true" />
    <div class="rounded-md shadow-sm -space-y-px">
      <div>
        <label for="email-address" class="sr-only">Email address</label>
        <input
          id="email-address"
          name="email"
          type="email"
          autocomplete=""
          required=""
          v-model="user.email"
          class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
          placeholder="Correo"
        />
      </div>
      <div>
        <label for="password" class="sr-only">Password</label>
        <input
          id="password"
          name="password"
          type="password"
          autocomplete=""
          required=""
          v-model="user.password"
          class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
          placeholder="Contraseña"
        />
      </div>
    </div>

    <!-- <div class="flex items-center justify-between">
      <div class="flex items-center">
        <input
          id="remember-me"
          name="remember-me"
          type="checkbox"
          v-model="user.remember"
          class="h-4 w-4 text-indigo-600 focus:ring-indigo-500 border-gray-300 rounded"
        />
        <label for="remember-me" class="ml-2 block text-sm text-gray-900">
          Remember me
        </label>
      </div>
    </div> -->

    <div>
      <TButtonLoading :loading="loading" class="w-full relative justify-center h-14 leading-8  sm:w-full sm:mb-4 rounded  bg-orange">
        <span class="absolute left-0 inset-y-0 flex items-center pl-3">
          <LockClosedIcon
            class="h-5 w-5 text-white-500 group-hover:text-indigo-400"
            aria-hidden="true"
          />
        </span>
        Ingresar
      </TButtonLoading>
    </div>
  </form>

  </div>


</template>

<!-- <template>

  <form  @submit="login">
    <Alert v-if="errorMsg">
      {{ errorMsg }}
      <span
        @click="errorMsg = ''"
        class="w-8 h-8 flex items-center justify-center rounded-full transition-colors cursor-pointer hover:bg-[rgba(0,0,0,0.2)]"
      >
        <svg
          xmlns="http://www.w3.org/2000/svg"
          class="h-6 w-6"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="M6 18L18 6M6 6l12 12"
          />
        </svg>
      </span>
    </Alert>
  <div class="flex flex-col w-[450px] sm:w-full text-base">
    <span class="text-center sm:text-left text-[28px] leading-9 mb-10 sm:mb-8"> Iniciar Sesión</span>
    <span class="text-center sm:text-left text-[16px] leading-9 mb-10 sm:mb-8"> Indicanos tu correo y contraseña</span>
    <input  id="email-address"
          name="email"
          type="email"
          autocomplete="email"
          required=""
          placeholder="Email"
          v-model="user.email" class="h-[52px] border border-[#8A9CC9] rounded px-4 mb-4">
    <input id="password"
          name="password"
          type="password"
          autocomplete="current-password"
          placeholder="Contraseña"
          required="" class="h-[52px] border border-[#8A9CC9] rounded px-4 mb-4">
    <div class="flex justify-between sm:flex-col sm:flex-col-reverse">
      <button class="bg-orange rounded h-14 w-[212px] text-white leading-4 sm:w-full sm:mb-4" @click="next">Ingresar</button>
    </div>
  </div>
 </form>
</template>
 -->

<script setup>
import { LockClosedIcon } from "@heroicons/vue/solid";
import store from "../store";
import { useRouter } from "vue-router";
import { ref } from "vue";
import Alert from "../components/Ant_Alert.vue";
import TButtonLoading from "../components/core/TButtonLoading.vue";

const router = useRouter();

const user = {
  email: "",
  password: "",
};
let loading = ref(false);
let errorMsg = ref("");

function login(ev) {
  ev.preventDefault();

  loading.value = true;
  store
    .dispatch("login", user)
    .then(() => {
      loading.value = false;
      //router.getRoutes()
      router.push({
        name: "Home",
      });
    })
    .then(() => {
      store.dispatch('get_project')
    })
    .catch((err) => {
      loading.value = false;
      errorMsg.value = err.response.data.error;
    });
}
</script>
