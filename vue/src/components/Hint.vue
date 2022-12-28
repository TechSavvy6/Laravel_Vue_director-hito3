<template>
  <div class="w-screen h-screen flex modal-background fixed top-0 left-0 z-20">
    <div
      class="flex absolute flex-col w-72 h-[143.5px] p-6 bg-white shadow-hint rounded-lg before:absolute"
      :class="positionCss + ' ' +bubbleCss"
    >
      <span class="text-left text-sm leading-6 mb-2">{{ header }}</span>
      <span class="font-medium text-xs leading-5 mb-2">{{ paragraph }}</span>
      <span class="flex self-end cursor-pointer" @click="increateHint">
        <span class="text-sm leading-4 text-orange mr-1">{{ next }}</span>
        <img
          src="../assets/images/icons/hint-arrow-rigth.svg"
          v-if="icon"
          alt=""
        />
      </span>
    </div>
  </div>
</template>

<script>
export default {
  name: "hint-component",
  props: {
    header: String,
    paragraph: String,
    next: String,
    icon: Boolean,
    bubbleCss: String,
    positionCss: String,
  },
  methods: {
    increateHint: function() {
      this.$store.commit('increaseHint');
    }
  }
};
</script>
<style scoped>
.modal-background {
  background: rgba(0, 12, 30, 0.7);
}
</style>
