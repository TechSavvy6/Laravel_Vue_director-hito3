<template>
  <div class="fixed top-16 sm:top-14 left-64 sm:left-0 right-0 flex-col z-10">
    <div class="flex h-16 sm:h-14 bg-side relative items-center justify-center">
      <div class="flex text-sm">
        <div class="flex mr-20 sm:mr-[25.5px]">
          <img :src="import(step === 1 ? '../assets/images/icons/first-black.svg' : '../assets/images/icons/first.svg')" class="mr-2" alt="">
          <span :class="{'text-[#002B6B]': step === 1, 'text-[#8A9CC9]': step !== 1}">Proyecto</span>
        </div>
        <div class="flex mr-20 sm:mr-[25.5px]">
          <img :src="import(step === 2 ? '../assets/images/icons/second-black.svg' : '../assets/images/icons/second.svg')" class="mr-2" alt="">
          <span :class="{'text-[#002B6B]': step === 2, 'text-[#8A9CC9]': step !== 2}">Equipo</span>
        </div>
        <div class="flex">
          <img :src="import(step === 3 ? '../assets/images/icons/third-black.svg': '../assets/images/icons/third.svg')" class="mr-2" alt="">
          <span :class="{'text-[#002B6B]': step === 3, 'text-[#8A9CC9]': step !== 3}">Reporte</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'project-bar-component',
  props: {
    step: Number,
  }
}
</script>