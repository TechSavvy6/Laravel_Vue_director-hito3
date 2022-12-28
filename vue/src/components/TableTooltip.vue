<template>
  <div
    class="flex flex-col w-40 h-[84px] rounded bg-white absolute shadow-tooltip z-10"
  >
    <div
      class="w-full h-10 flex items-center text-[#616E8E] group cursor-pointer"
      @click="handleClick('addRow')"
    >
      <img
        src="../assets/images/icons/tooltip-person-add.svg"
        alt=""
        class="ml-6 mr-3 group-hover:content-addActive"
      />
      <span class="text-[10px] leading-3 group-hover:text-orange">Agregar fila</span>
    </div>
    <div
      class="w-full h-10 flex items-center text-[#616E8E] group cursor-pointer"
      @click="handleClick('deleteRow')"
    >
      <img
        src="../assets/images/icons/tooltip-delete.svg"
        alt=""
        class="ml-6 mr-3 group-hover:content-deleteActive"
      />
      <span class="text-[10px] leading-3 group-hover:text-orange"
        >Eliminar fila</span
      >
    </div>
    <div
      class="w-full h-10 flex items-center text-[#616E8E] group cursor-pointer"
      @click="handleClick('duplicateRow')"
    >
      <img
        src="../assets/images/icons/document_outline.svg"
        alt=""
        class="ml-6 mr-3 group-hover:content-deleteActive"
      />
      <span class="text-[10px] leading-3 group-hover:text-orange"
        >Duplicar actividad</span
      >
    </div>
  </div>
</template>

<script>
export default {
  name: "table-tooltip-component",
  props: {
    id: Number,
  },
  methods: {
    handleClick: function (param) {
      this.$emit("tooltip", { param: param });
    },
  },
};
</script>
