<template>
  <div>
    <hr class="mt-10 h-[1px] border-[#D0D9F1] mb-10 sm:hidden">
    <div class="flex sm:flex-col items-center">
      <span class="font-medium text-sm leading-6 shrink-0 sm:mb-8 sm:w-full" v-if="flag">{{ text }}</span>
      <div class="flex w-full justify-end sm:flex-col-reverse">
        <button class="h-14 px-8 border-2 border-orange rounded text-orange text-base leading-4 mr-4 sm:mr-0" @click="$emit('cancel')">{{ buttons[0] }}</button>
        <button class="h-14 px-8 rounded bg-orange text-white text-base leading-4 sm:mb-4" @click="$emit('next')">{{ buttons[1] }}</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'footer-step-component',
  props: {
    buttons: Array,
    flag: Boolean,
    text: String,
  }
}
</script>