<template>
  <Modal
    :header="'Agregar Frente'"
    :modalType="'addFront'"
    :paragraphs="paragraphs"
  >
      <div class="flex w-full flex-col mb-4 relative">
        <div class="relative">
          <input
            type="text"
            v-model="frontName"
            class="h-[52px] w-full px-4 rounded border border-[#8A9CC9] font-normal text-base text-activeText"
            placeholder="Selecciona un frente"
          />
          <img
            src="../assets/images/icons/ic_arrow-down.svg"
            class="absolute top-1/2 -translate-y-1/2 right-6 sm:right-4 transition cursor-pointer"
            alt=""
            :class="{ 'rotate-180': isOpen, 'rotate-0': !isOpen }"
            @click="handleClick"
          />
        </div>
      </div>

      <button
        class="h-14 sm:w-full rounded px-8 text-base leading-4 mt-10 bg-orange text-white"
        :class="frontName === '' ? 'opacity-80' : ''"
        @click="$emit('addFront', {frontId: frontId, frontName: frontName})"
        :disabled="frontName === ''"
      >
        Guardar cambios
      </button>
  </Modal>
</template>

<script>
import Modal from "./Modal.vue";

export default {
  name: "add-front-component",
  components: {
    Modal,
  },
  props: {
    rows: Array,
  },
  data: function () {
    return {
      frontId: '',
      frontName: '',
      isOpen: false,
      paragraphs: [],
    };
  },
  methods: {
    handleClick: function () {
      this.isOpen = !this.isOpen;
    },
  },
};
</script>
