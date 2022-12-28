<template>
  <tr>
    <td>
      <button
        class="border-2 border-orange rounded h-8 text-orange text-xs px-4"
        @click="ConstraintAnalysis(row.projectId)"
      >
        Ingresar
      </button>
    </td>
    <td>
      <span class="flex items-center">
        <span class="mr-2">{{ row.data ? `Abierto` : `Cerrado` }}</span>
        <img src="../assets/images/icons/edit.svg" alt="" class="cursor-pointer" @click="openModal({param: 'editStatus', id: row.id})" />
      </span>
    </td>
    <td>{{ row.projectName }}</td>
    <td>
      <p class="flex flex-col">
        <span>No retrasadas: {{ row.restriction.notDelayed }}</span>
        <span>Retrasadas: {{ row.restriction.delayed }}</span>
      </p>
    </td>
    <td>
      <span class="flex flex-col">
        <span v-for="(equipment, index) in row.equipments" :key="index">{{ equipment }}</span>
      </span>
    </td>
    <td>
      <button
        class="bg-[#DCE4F9] w-6 h-6 rounded-md justify-center flex items-center"
        @click="$emit('selectUserFunc', row.id); openModal({param: 'selectusers'})"
        v-click-outside="hide"
      >
        <img
          src="../assets/images/icons/points.svg"
          :class="{ 'content-pointsActive': row.isTooltip }"
          alt=""
        />
      </button>
    </td>
  </tr>
</template>

<script>
import { emit } from "process";
import ClickOutside from "vue-click-outside";
import Tooltip from "./Tooltip.vue";
import { useRouter } from "vue-router";

export default {
  name: "custome-table-row",
  components: {
    Tooltip,
},
  props: {
    row: Object,
    users: Array,
  },
  data: function () {
    return {
      isOpen: false,
      modalName: '',
    };
  },
  methods: {
    handleClick: function () {
      this.isOpen = !this.isOpen;
    },
    hide: function () {
      this.isOpen = false;
    },
    openModal: function(payload) {
      this.$emit('openModal', {param: payload.param, id: payload.id});
    },
    ConstraintAnalysis: function(id) {
      
      this.$emit('openConstraintPage', {id: id})
    }
  },
  directives: {
    ClickOutside,
  },
  
};
</script>
