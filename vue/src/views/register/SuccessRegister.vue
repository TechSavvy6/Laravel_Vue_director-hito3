<template>
  <div class="flex sm:flex-col">
    <div class="flex shrink-0 relative sm:hidden">
      <img src="../../assets/images/success-register.png" class="h-screen" alt="">
      <img src="../../assets/images/mobile-logo.png" class="absolute left-16 top-16" alt="">
    </div>
    <div class="hidden sm:flex h-14 bg-[#002B6B] px-8 py-3">
      <img src="../../assets/images/mobile-logo.png" alt="">
    </div>
    <div class="flex relative w-full flex-col text-5xl sm:text-[32px] leading-[60px] sm:leading-[44px] px-48 py-[280px] sm:px-8 sm:py-0 sm:pt-28">
      <img src="../../assets/images/icons/modal-close.svg" class="sm:hidden absolute top-8 right-8" alt="">
      <span>¡Registro creado</span>
      <span class="mb-8">con éxito!</span>
      <button class="w-36 h-14 sm:hidden bg-orange rounded text-base leading-4 text-white" @click="go">Ir al inicio</button>
      <button class="w-full h-14 hidden sm:block bg-orange rounded text-base leading-4 text-white" @click="go">Ingresar</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'success-register-view',
  methods: {
    go: function() {
      this.$router.push('/start/welcome');
    }
  }
}
</script>