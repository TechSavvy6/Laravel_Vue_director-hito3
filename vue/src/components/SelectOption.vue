<template>
  <div class="flex shadow-tooltip rounded bg-white z-10 absolute w-full">
    <ul class="w-full">
      <li
        v-for="(option, index) in options"
        :key="index"
        :value="option.value"
        class="mb-2 cursor-pointer h-14 p-4 font-normal text-base relative"
        @click="$emit('selected', { value: option.value, name: option.name })"
      >
        {{ option.name }}
        <img
          src="../assets/images/icons/ic_arrow-down.svg"
          class="absolute top-1/2 -translate-y-1/2 right-4"
          alt=""
          v-if="selType === 'tree'"
        />
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: "select-component",
  props: {
    options: Array,
    selType: String,
  },
};
</script>
