<template>
  <Modal :header="header" :modalType="'success'" :paragraphs="[]">
    <button
      class="h-14 sm:w-full rounded px-8 text-base leading-4 mt-10 bg-orange text-white"
      @click="$emit('closeModal')"
    >
      {{ buttonStr }}
    </button>
  </Modal>
</template>

<script>
import Modal from "../components/Modal.vue";

export default {
  name: "success-component",
  props: {
    header: String,
    buttonStr: String,
  },
  components: {
    Modal,
  },
};
</script>
