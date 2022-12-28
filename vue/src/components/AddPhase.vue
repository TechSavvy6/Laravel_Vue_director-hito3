<template>
  <Modal
    :header="'Agregar Fase'"
    :modalType="'addPhase'"
    :paragraphs="paragraphs"
  >
      <div class="flex w-full flex-col mb-4 relative">
        <div class="relative">
          <input
            type="text"
            v-model="frontName"
            @input="frontId = ''"
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
          <SelectOption
            :selType="'front'"
            @selected="selOpt"
            :options="getOption()"
            v-if="isOpen"
          />
        </div>
        <div class="relative mt-4" v-if="selStatus">
          <input
            type="text"
            v-model="phaseName"
            class="h-[52px] w-full px-4 rounded border border-[#8A9CC9] font-normal text-base text-activeText"
            placeholder="Selecciona un frente"
          />
          <img
            src="../assets/images/icons/ic_arrow-down.svg"
            class="absolute top-1/2 -translate-y-1/2 right-6 sm:right-4 transition cursor-pointer"
            alt=""
          />
        </div>
      </div>

      <button
        class="h-14 sm:w-full rounded px-8 text-base leading-4 mt-10 bg-orange text-white"
        @click="
          $emit('addPhase', {
            frontId: frontId,
            frontName: frontName,
            status: selStatus,
            phaseName: phaseName,
          })
        "
        :class="phaseName === '' ? 'opacity-80' : ''"
        :disabled="phaseName === ''"
      >
        Guardar cambios
      </button>
  </Modal>
</template>

<script>
import Modal from "./Modal.vue";
import SelectOption from "./SelectOption.vue";

export default {
  name: "add-phase-component",
  components: {
    Modal,
    SelectOption,
  },
  props: {
    rows: Array,
  },
  data: function () {
    return {
      frontId: "",
      frontName: "",
      phaseName: "",
      isOpen: false,
      selStatus: false,
      paragraphs: ["Selecciona en que frente lo deseas agregar"],
    };
  },
  methods: {
    handleClick: function () {
      this.isOpen = !this.isOpen;
    },
    selOpt: function (payload) {
      this.selStatus = true;
      this.frontId = payload.value;
      this.frontName = payload.name;
      this.isOpen = false;
    },
    getOption: function () {
      const options = [];
      this.rows.map((row) => {
        const temp = {};
        temp["value"] = row.id;
        temp["name"] = row.name;
        options.push(temp);
      });
      return options;
    },
  },
};
</script>
