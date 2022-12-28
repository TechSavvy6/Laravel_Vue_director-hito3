<template>
  <div class="flex flex-col">
    <span class="text-2xl mb-8"
      >Asigna los miembros de tu primer proyecto
    </span>
    <div class="flex justify-between sm:flex-col mb-8">
      <div class="flex flex-col w-[32%] sm:w-full sm:mb-8">
        <span class="text-sm leading-6 mb-4"
          >Ingresa el correo del miembro</span
        >
        <input
          type="text"
          v-for="(user, index) in users"
          :key="index"
          placeholder="Correo electrónico"
          v-model="user.userEmail"
          class="h-[52px] w-full mb-4 border border-[#8A9CC9] rounded px-4"
        />
      </div>
      
      <div class="flex flex-col w-[32%] sm:w-full sm:mb-8">
        <span class="text-sm leading-6 mb-4">Selecciona el rol</span>
        <Select
          v-for="(user, index) in users"
          :key="index"
          :indexVal="index"
          :typeVal="'text'"
          :placeHolder="'Selecciona*'"
          :selType="'role'"
          @selRole="selRole"
          v-model="user.userRole"
          :options="[{value: 'editor', name: 'Editor'}, {value: 'visualizer', name: 'Visualizador'},]"
        />
      </div>
      <div class="flex flex-col w-[32%] sm:w-full">
        <span class="text-sm leading-6 mb-4"
          >Selecciona área al que pertenece</span
        >
        <input
          type="text"
          v-for="(user, index) in users"
          :key="index"
          placeholder="Correo electrónico"
          v-model="user.userArea"
          class="h-[52px] w-full mb-4 border border-[#8A9CC9] rounded px-4"
        />
      </div>
    </div>
    <div class="flex cursor-pointer mb-8" @click="addUser">
      <img
        src="../assets/images/icons/tooltip-person-add-active.svg"
        class="mr-2"
        alt=""
      />
      <span class="text-base leading-4 text-orange">Agregar miembro</span>
    </div>
  </div>
</template>

<script>
import Select from "./Select.vue";
export default {
  name: "second-step-component",
  components: {
    Select,
  },
  data: function () {
    return {
      users: [],
    };
  },
  methods: {
    handleClick: function (param) {
      if (param === "coveredArea")
        this.coveredAreaStatus = !this.coveredAreaStatus;
      else if (param === "projectType")
        this.projectTypeStatus = !this.projectTypeStatus;
      else if (param === "district") this.districtStatus = !this.districtStatus;
    },
    addUser: function () {
      var temp = {
        userEmail: "",
        userRole: "",
        userArea: "",
      };
      this.users.push(temp);
      console.log(this.users)
    },
    selRole: function(payload) {
      this.users[payload.indexVal].userRole = payload.value;
      this.paraStatus = false;
    },
    selArea: function(payload) {
      this.users[payload.indexVal].userArea = payload.value;
      this.paraStatus = false;
    },
  },
};
</script>
