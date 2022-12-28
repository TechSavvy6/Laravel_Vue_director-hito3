<template>
  <Modal
    :header="'Descargar reporte'"
    :modalType="'downloadReport'"
    :paragraphs="paragraphs"
  >
    <template>
      <div class="flex w-full flex-col mb-4">
        <span class="text-sm leading-6 mb-4"
          >Selecciona la información que deseas descargar para tu reporte</span
        >
        <div class="flex mb-4">
          <input
            type="checkbox"
            name="date_required"
            id="date_required"
            value="date_required"
            v-model="checkedCols"
            class="w-6 h-6 border border-[#8A9CC9] rounded mr-4 orange"
          />
          <label for="date_required">
            <span class="font-medium text-sm leading-6">
              Fecha requerida
            </span>
          </label>
        </div>
        <div class="flex mb-4">
          <input
            type="checkbox"
            name="responsible"
            id="responsible"
            value="responsible"
            v-model="checkedCols"
            class="w-6 h-6 border border-[#8A9CC9] rounded mr-4 accent-orange"
          />
          <label for="responsible">
            <span class="font-medium text-sm leading-6">
              Responsable
            </span>
          </label>
        </div>
        <div class="flex mb-4">
          <input
            type="checkbox"
            name="responsible_area"
            id="responsible_area"
            value="responsible_area"
            v-model="checkedCols"
            class="w-6 h-6 border border-[#8A9CC9] rounded mr-4 accent-orange"
          />
          <label for="responsible_area">
            <span class="font-medium text-sm leading-6">
              Área responsable
            </span>
          </label>
        </div>
        <div class="flex mb-4">
          <input
            type="checkbox"
            name="condition"
            id="condition"
            value="condition"
            v-model="checkedCols"
            class="w-6 h-6 border border-[#8A9CC9] rounded mr-4 accent-orange"
          />
          <label for="condition">
            <span class="font-medium text-sm leading-6">
              Estado
            </span>
          </label>
        </div>
      </div>

      <button
        class="h-14 sm:w-full rounded px-8 text-base leading-4 mt-10 bg-orange text-white"
        @click="$emit('closeModal')"
      >
        Guardar cambios
      </button>
    </template>
  </Modal>
</template>

<script>
import Modal from "./Modal.vue";

export default {
  name: "download-report-component",
  components: {
    Modal,
  },
  data: function () {
    return {
      checkedCols: [],
      paragraphs: [],
    };
  },
};
</script>
