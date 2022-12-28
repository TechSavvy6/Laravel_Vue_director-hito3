<template>
  <div class="flex flex-col w-[450px] sm:w-full text-base">
    <span class="text-center sm:text-left text-[28px] leading-9 mb-10 sm:mb-8">¡Registrate gratis!</span>

    <form class="mt-full space-y-6" @submit="register">

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

      <input type="hidden" name="remember" value="true" />

        <TInput
          name="name"
          v-model="user.name"
          :errors="errors"
          placeholder="Ingresa tu nombre"

          class="h-[52px] border border-[#8A9CC9] rounded px-4 mb-4"></TInput>

          <TInput
          name="lastname"
          v-model="user.lastname"
          :errors="errors"
          placeholder="Ingresa tu apellido"

          class="h-[52px] border border-[#8A9CC9] rounded px-4 mb-4"></TInput>

          <TInput
          type="text"
          @keypress="onlyNumber"
          name="celular"
          v-model="user.celular"
          :errors="errors"
          placeholder="Numero de Celular"

          class="h-[52px] border border-[#8A9CC9] rounded px-4 mb-4"></TInput>


          <TInput
          name="nombreempresa"
          v-model="user.nombreempresa"
          :errors="errors"
          placeholder="Nombre de la empresa"

          class="h-[52px] border border-[#8A9CC9] rounded px-4 mb-4"></TInput>

        <TInput
          type="email"
          name="email"
          v-model="user.email"
          :errors="errors"
          placeholder="Correo empresarial"
          class="h-[52px] border border-[#8A9CC9] rounded px-4 mb-4"></TInput>


          <select
          v-model="user.cargo"
          :errors="errors"
          class="flex flex-col w-[450px] sm:w-full text-base  border border-[#8A9CC9]"

          >
          <option disabled value="">Seleccionar un cargo</option>
          <option
          v-for="item in cargos" v-bind:key="item.codCargo" v-bind:value = "item.codCargo">
            {{ item.nameCargo }}
          </option>

          </select>

        <TInput
          type="password"
          name="password"
          v-model="user.password"
          :errors="errors"
          placeholder="Contraseña"
          class="h-[52px] border border-[#8A9CC9] rounded px-4 mb-4"></TInput>

        <TInput
          type="password"
          name="password_confirmation"
          v-model="user.password_confirmation"
          :errors="errors"
          placeholder="Confirmación contraseña"
          class="h-[52px] border border-[#8A9CC9] rounded px-4 mb-4"></TInput>



      <div class="flex flex-col w-[450px] sm:w-full text-base">
        <TButtonLoading
          :loading="loading"
          class="bg-orange rounded h-14 w-full text-white text-center leading-9 sm:w-full sm:mb-4"
        >
          Registrarse
        </TButtonLoading>
      </div>
    </form>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { LockClosedIcon } from "@heroicons/vue/solid";
import store from "../store";
import { useRouter } from "vue-router";
import TButtonLoading from "../components/core/TButtonLoading.vue";
import TInput from "../components/core/TInput.vue";
import Alert from "../components/Ant_Alert.vue";
import { computed } from "vue";

const router = useRouter();
const user = {
  name: "",
  lastname:"",
  celular: "",
  nombreempresa:"",
  email: "",
  password: "",
  cargo:""
};
const loading = ref(false);
const errors = ref({});
const cargos  = computed(() => store.state.cargos);


store.dispatch("get_cargos");


// function selectedStudentId() {
//     user.cargo = this.cargos?.codCargo;
//   }

function onlyNumber ($event) {
   //console.log($event.keyCode); //keyCodes value
   let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
   if ((keyCode < 48 || keyCode > 57) && keyCode !== 46) { // 46 is dot
      $event.preventDefault();
   }
}

function register(ev) {
  ev.preventDefault();
  loading.value = true;
  store
    .dispatch("register", user)
    .then(() => {
      loading.value = false;
      router.push({
        name: "Login",
      });
    })
    .catch((error) => {
      loading.value = false;
      if (error.response.status === 422) {
        errors.value = error.response.data.errors;
      }
    });
}
</script>
