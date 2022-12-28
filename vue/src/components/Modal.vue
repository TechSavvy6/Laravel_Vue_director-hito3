<template>
  <div
    class="w-screen h-screen bg-modal flex items-center justify-center modal-background fixed top-0 left-0 z-40"
  >
    <div
      class="flex flex-col justify-center items-center w-[554px] sm:w-[296px] rounded-2xl bg-white absolute p-16 sm:px-6 sm:py-12 overflow-auto 
      max-h-[750px] justify-between"
    >
      <img
        src="../assets/images/icons/modal-close.svg"
        alt=""
        class="absolute top-4 right-4 cursor-pointer"
        @click="$parent.$emit('closeModal')"
      />
      <span v-if="modalType === 'confirm' && confirmHeader !== ''" class="text-xl text-center mb-4">{{
        confirmHeader
      }}</span>
      <span
        class="text-activeText mb-4 sm:mt-4 text-center modal-header"
        :class="{
          'text-[32px] leading-[44px] sm:text-[28px] sm:leading-9':
            modalType === 'success',
          'text-2xl': modalType !== 'success',
        }"
      >
        {{ header }}
      </span>
      <span
        class="font-medium text-base leading-7 text-activeText text-center"
        :class="{
          'mb-4':
            index !== paragraphs.length - 1 ||
            (modalType === 'add' && status && index === paragraphs.length - 2),
          hidden:
            modalType === 'add' && status && index === paragraphs.length - 1,
        }"
        v-for="(paragraph, index) in paragraphs"
        :key="index"
      >
        {{ paragraph }}
      </span>
      <slot></slot>
    </div>
  </div>
</template>

<script>
export default {
  name: "modal-component",
  props: {
    confirmHeader: String,
    header: String,
    modalType: String,
    paragraphs: Array,
    status: Boolean,
  },
};
</script>
<style scoped>
.modal-background {
  background: rgba(0, 12, 30, 0.7);
}
.modal-header {
  word-break: break-word;
}
</style>
