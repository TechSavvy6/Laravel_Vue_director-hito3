<template>
  <div class="flex justify-between sm:flex-col mb-12 sm:mb-8">
    <div class="flex flex-col tracking-tight">
      <span class="text-2xl text-activeText mb-2">{{ header }}</span>
      <span class="text-sm leading-6 text-activeText font-medium sm:mb-4">
        {{ paragraph }}
      </span>
    </div>
    <div class="flex items-end">
      <button
        class="h-14 sm:w-full bg-orange text-white text-base leading-4 px-8 rounded"
        @click="$emit('createNewProject')"
      >
        {{ buttonText }}
      </button>
    </div>
  </div>
</template>

<script>
export default {
  name: "indicator-component",
  props: {
    header: String,
    paragraph: String,
    buttonText: String,
    
  },
};
</script>
