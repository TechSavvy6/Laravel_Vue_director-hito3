<template>
  <div class="flex flex-col text-base sm:w-full">
    <span class="text-[28px] leading-9 text-center sm:text-left mb-6 sm:mb-4"
      >Seleciona el plan ideal para ti</span
    >
    <div class="flex text-[#616E8E] mb-12 sm:mb-8 justify-center">
      <div class="flex sm:justify-between">
        <div class="flex mr-8">
          <span class="mr-4 sm:mr-2">Mensual</span>
          <img
            :src="
              require(toggleStatus === false
                ? '../../assets/images/icons/toggle.svg'
                : '../../assets/images/icons/toggle-on.svg')
            "
            class="cursor-pointer"
            alt=""
            @click="toggle"
          />
        </div>
        <span class="">Anual (ahorra 20%)</span>
      </div>
    </div>
    <div class="flex sm:flex-col">
      <div
        class="flex flex-col w-56 sm:w-full p-8 rounded-lg shadow-tooltip mr-8 sm:mb-4"
      >
        <span class="text-sm leading-6 mb-1 mt-2">GRATIS</span>
        <div class="flex mb-6">
          <img src="../../assets/images/icons/free.svg" class="mr-2" alt="" />
          <span class="flex items-end text-[#616E8E]">Mensual</span>
        </div>
        <hr class="bg-[#D0D9F1] h-[1px] mb-8" />
        <div class="flex flex-col mb-4">
          <div class="flex mb-1">
            <img
              src="../../assets/images/icons/tick.svg"
              class="-mt-[18%] sm:mt-0 mr-2"
              alt=""
            />
            <div class="flex flex-col sm:flex-row text-sm leading-6">
              <span>3 Proyectos</span>
              <span>gratuitos</span>
            </div>
          </div>
          <div class="flex">
            <img src="../../assets/images/icons/tick.svg" class="mr-2" alt="" />
            <span class="text-sm leading-6">30 días de prueba</span>
          </div>
        </div>
        <button
          class="w-full h-12 border-2 border-orange rounded text-sm leading-4 text-orange"
          @click="handleClick('free')"
        >
          Comenzar ahora
        </button>
      </div>
      <div
        class="flex flex-col w-56 sm:w-full p-8 rounded-lg shadow-tooltip mr-8 sm:mb-4"
      >
        <span class="text-sm leading-6 mb-1 mt-2">BÁSICO</span>
        <div class="flex mb-6">
          <img src="../../assets/images/icons/basic.svg" class="mr-2" alt="" />
          <span class="flex items-end text-[#616E8E]">Mensual</span>
        </div>
        <hr class="bg-[#D0D9F1] h-[1px] mb-8" />
        <div class="flex flex-col mb-4">
          <div class="flex mb-1">
            <img
              src="../../assets/images/icons/tick.svg"
              class="-mt-[18%] sm:mt-0 mr-2"
              alt=""
            />
            <div class="flex flex-col sm:flex-row text-sm leading-6">
              <span>3 Proyectos</span>
              <span>gratuitos</span>
            </div>
          </div>
          <div class="flex">
            <img src="../../assets/images/icons/tick.svg" class="mr-2" alt="" />
            <span class="text-sm leading-6">30 días de prueba</span>
          </div>
        </div>
        <button
          class="w-full h-12 border-2 border-orange rounded text-sm leading-4 text-orange"
          @click="handleClick('basic')"
        >
          Comenzar ahora
        </button>
      </div>
      <div class="flex flex-col w-56 sm:w-full p-8 rounded-lg shadow-tooltip">
        <span class="text-sm leading-6 mb-1 mt-2">AVANZADO</span>
        <div class="flex mb-6">
          <img
            src="../../assets/images/icons/advanced.svg"
            class="mr-2"
            alt=""
          />
          <span class="flex items-end text-[#616E8E]">Mensual</span>
        </div>
        <hr class="bg-[#D0D9F1] h-[1px] mb-8" />
        <div class="flex flex-col mb-4">
          <div class="flex mb-1">
            <img
              src="../../assets/images/icons/tick.svg"
              class="-mt-[18%] sm:mt-0 mr-2"
              alt=""
            />
            <div class="flex flex-col sm:flex-row text-sm leading-6">
              <span>3 Proyectos</span>
              <span>gratuitos</span>
            </div>
          </div>
          <div class="flex">
            <img src="../../assets/images/icons/tick.svg" class="mr-2" alt="" />
            <span class="text-sm leading-6">30 días de prueba</span>
          </div>
        </div>
        <button
          class="w-full h-12 border-2 border-orange rounded text-sm leading-4 text-orange"
          @click="handleClick('advanced')"
        >
          Comenzar ahora
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "second-register-view",
  data: function () {
    return {
      toggleStatus: false,
    };
  },
  methods: {
    handleClick: function (param) {
      this.$store.commit({
        type: "updateRegisterData",
        attr: "plan",
        value: param,
      });
      this.$router.push("/register/third");
    },
    toggle: function () {
      this.toggleStatus = !this.toggleStatus;
    },
  },
};
</script>
