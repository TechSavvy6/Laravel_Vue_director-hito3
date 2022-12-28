<template>
  <div class="flex flex-col">
    <div class="flex relative w-full h-16 sm:h-14 bg-[#002B6B]">
      <img src="../../assets/images/mobile-logo.png" class="absolute left-8 top-3" alt="">
    </div>
    <div class="flex flex-col items-center px-72 py-24 sm:px-8 sm:py-16 sm:text-center">
      <span class="text-5xl sm:text-4xl leading-[60px] sm:leading-[48px] mb-2">¡Bienvenidos a Direktor!</span>
      <span class="text-4xl sm:text-[28px] leading-[48px] sm:leading-9 mb-8 sm:mb-4">Estás en nuestra membresía {{ plan }}</span>
      <span class="font-medium text-xl leading-8 mb-16 sm:mb-8">¡Estamos muy contentos de que estés aquí! ¡Diviértete creando y compartiendo tus  proyectos!</span>
      <button class="w-[212px] h-14 bg-orange rounded text-base leading-4 text-white" @click="next">Comenzar</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'welcome-view',
  methods: {
    next: function() {
      this.$router.push('/start/create_project');
    }
  },
  computed: {
    plan: function() {
      const curPlan = this.$store.state.registerData.plan;
      var result = '';
      if (curPlan === 'free') result = 'gratis';
      else if (curPlan === 'basic') result = 'básica';
      else if (curPlan === 'advanced') result = 'avanzado';
      return result;
    }
  }
}
</script>