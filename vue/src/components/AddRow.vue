<template>
  <Modal :header="'Agregar Fila'" :modalType="'addRow'" :paragraphs="paragraphs">
      <span class="text-sm leading-6 mb-2 w-full">¿Cúantas filas deseas agregar?</span>
      <input
        type="text"
        class="h-[52px] w-full px-4 rounded border border-[#8A9CC9] font-normal text-base text-activeText mb-4"
        placeholder="Número de filas"
        v-model="exercise"
       />
      <button
        class="h-14 sm:w-full rounded px-8 text-base leading-4 mt-10 bg-orange text-white"
        @click="$emit('addRow', { exercise: exercise })"
      >
        Agregar
      </button>
  </Modal>
</template>

<script>
import Modal from "./Modal.vue";

export default {
  name: "add-row-component",
  components: {
    Modal,
  },
  data: function () {
    return {
      paragraphs: [],
      exercise: '',
    };
  },
};
</script>
