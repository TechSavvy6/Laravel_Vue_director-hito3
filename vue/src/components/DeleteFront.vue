<template>
  <Modal
    :header="'Eliminar'"
    :modalType="'deleteFront'"
    :paragraphs="paragraphs"
  >
      <div class="flex w-full flex-col mb-4">
        <div class="flex flex-col">
          <span class="text-sm leading-6 mb-2"
            >Selecciona lo que deseas eliminar</span
          >
          <div class="relative">
            <input
              type="text"
              v-model="frontName"
              class="h-[52px] w-full px-4 rounded border border-[#8A9CC9] font-normal text-base text-activeText"
              placeholder="Frente"
            />
            <img
              src="../assets/images/icons/ic_arrow-down.svg"
              class="absolute top-1/2 -translate-y-1/2 right-6 sm:right-4 transition cursor-pointer"
              alt=""
              :class="{ 'rotate-180': isOpen, 'rotate-0': !isOpen }"
              @click="handleClick('front')"
            />
            <SelectOption :selType="'front'" @selected="selFrontOpt" :options="getFrontOption()" v-if="isOpen" />
          </div>
        </div>
        <div v-if="selStatus && phaseLen > 0" class="mt-8 flex flex-col">
          <span class="text-sm leading-6 mb-2"
            >¿Cuál frente deseas eliminar?</span
          >
          <div class="relative">
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
              @click="handleClick('phase')"
            />
            <SelectOption
              :selType="'phase'"
              @selected="selPhaseOpt"
              :options="getPhaseOption()"
              v-if="phaseOpen"
            />
          </div>
          <span class="mt-8 text-xs leading-5">
            *Al eliminar un frente, se eliminarán las fases correspondientes
          </span>
        </div>
      </div>

      <button
        class="h-14 sm:w-full rounded px-8 text-base leading-4 mt-10 bg-orange text-white"
        @click="$emit('deleteFront', {frontId: frontId, phaseLen: phaseLen, phaseId: phaseId})"
      >
        Guardar cambios
      </button>
  </Modal>
</template>

<script>
import Modal from "./Modal.vue";
import SelectOption from "./SelectOption.vue";

export default {
  name: "delete-front-component",
  components: {
    Modal,
    SelectOption,
  },
  props: {
    rows: Array,
  },
  data: function () {
    return {
      frontId: '',
      frontName: '',
      phaseId: '',
      phaseName: '',
      isOpen: false,
      phaseOpen: false,
      selStatus: false,
      phaseLen: 0,
      paragraphs: [],
    };
  },
  methods: {
    handleClick: function (id) {
      if (id === 'front')
        this.isOpen = !this.isOpen;
      else if (id === 'phase')
        this.phaseOpen = !this.phaseOpen;
    },
    selFrontOpt: function (payload) {
      this.selStatus = true;
      this.frontId = payload.value;
      this.frontName = payload.name;
      this.rows.map(row => {
        if (row.id === this.frontId) {
          this.phaseLen = row.info.length;
        }
      });
      this.isOpen = false;
    },
    selPhaseOpt: function (payload) {
      this.phaseId = payload.value; 
      this.phaseName = payload.name; 
      this.phaseOpen = false;
    },
    getFrontOption: function() {
      const options = [];
      this.rows.map(row => {
        const temp = {};
        temp['value'] = row.id;
        temp['name'] = row.name;
        options.push(temp);
      });
      return options;
    },
    getPhaseOption: function() {
      const options = [
        {
          value: 'all',
          name: 'All',
        }
      ];
      this.rows.map(row => {
        if (row.id === this.frontId) {
          row.info.map(elem => {
            const temp = {};
            temp['value'] = elem.id;
            temp['name'] = elem.name;
            options.push(temp);
          });
        }
      });
      return options;
    },
  },
};
</script>
