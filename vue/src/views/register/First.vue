<template>
  <div class="flex flex-col w-[450px] sm:w-full text-base">
    <span class="text-center sm:text-left text-[28px] leading-9 mb-10 sm:mb-8">¡Registrate gratis!</span>


    <form class="flex flex-col w-full sm:w-full" @submit="register">

    <Alert
        v-if="Object.keys(errors).length"
        class="flex-col items-stretch text-sm"
      >
        <div v-for="(field, i) of Object.keys(errors)" :key="i">
          <div v-for="(error, ind) of errors[field] || []" :key="ind">
            * {{ error }}
          </div>
        </div>
      </Alert>

    <input
    name = "name"
    type="text"
    v-model="user.name"
    :errors="errors"
    placeholder="Ingresa tu nombre"
    class="h-[52px] border border-[#8A9CC9] rounded px-4 mb-4">

    <!-- <input type="text" v-model="lastName" placeholder="Ingresa tu apellido" class="h-[52px] border border-[#8A9CC9] rounded px-4 mb-4">
    <input type="text" v-model="phoneNumber" placeholder="Número  de celular" class="h-[52px] border border-[#8A9CC9] rounded px-4 mb-4">
    <input type="text" v-model="companyName" placeholder="Nombre de la empresa" class="h-[52px] border border-[#8A9CC9] rounded px-4 mb-4">
    <input type="text" v-model="position" placeholder="Cargo" class="h-[52px] border border-[#8A9CC9] rounded px-4 mb-4">
     -->
    <input
    type="email"
    name="email"
    v-model="user.email"
    :errors="errors"
    placeholder="Correo empresarial"
    class="h-[52px] border border-[#8A9CC9] rounded px-4 mb-10 sm:mb-8">

    <input
    type="password"
          name="password"
          v-model="user.password"
          :errors="errors"
          placeholder="Password"
    class="h-[52px] border border-[#8A9CC9] rounded px-4 mb-4">


    <input
    type="password"
          name="password_confirmation"
          v-model="user.password_confirmation"
          :errors="errors"
          placeholder="Confirm Password"
    class="h-[52px] border border-[#8A9CC9] rounded px-4 mb-4">

      <div class="flex flex-col w-[450px] sm:w-full text-base">
      <TButtonLoading :loading="loading" class="bg-orange rounded h-14 w-full text-white text-center leading-9 sm:w-full sm:mb-4">

        Registrarse
      </TButtonLoading>
    </div>

    <!-- <div class="flex justify-between sm:flex-col sm:flex-col-reverse">
      <button class="border-2 border-[#EB5D00] rounded h-14 w-[212px] text-orange leading-4 sm:w-full">Atrás</button>
      <button class="bg-orange rounded h-14 w-[212px] text-white leading-4 sm:w-full sm:mb-4" @click="next">Siguiente</button>
    </div> -->
  </form>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { LockClosedIcon } from "@heroicons/vue/solid";
import store from "../../store";
import { useRouter } from "vue-router";
import TButtonLoading from "../../components/core/TButtonLoading.vue";
import TInput from "../../components/core/TInput.vue";
import Alert from "../../components/Ant_Alert.vue";

const router = useRouter();
const user = {
  name: "",
  email: "",
  password: "",
};

const loading = ref(false);
const errors = ref({});

function register(ev) {
  ev.preventDefault();
  loading.value = true;
  store
    .dispatch("register", user)
    .then(() => {
      loading.value = false;
      router.push({
        name: "login",
      });
    })
    .catch((error) => {
      console.log(error)
      loading.value = false;
      if (error.response.status === 422) {
        errors.value = error.response.data.errors;
      }
    });
}
</script>
