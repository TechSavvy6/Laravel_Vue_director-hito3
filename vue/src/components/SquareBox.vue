<template>
  <div
    class="flex w-full rounded-2xl p-6 bg-white shadow-tooltip mb-4 last:mb-0"
  >
    <div class="flex flex-col w-full">
      <slot></slot>
    </div>
  </div>
</template>

<script>
export default {
  name: "square-box-component",
  data: function() {
    return {
      modalName: '',
    };
  },
  props: {
    row: Object,
  }
};
</script>
