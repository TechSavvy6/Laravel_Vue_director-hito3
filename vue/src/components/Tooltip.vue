<template>
  <div
    class="flex flex-col w-[132px] h-[124px] rounded bg-white absolute shadow-tooltip z-10 -translate-x-full ml-6"
  >
    <div
      class="w-full h-10 flex items-center text-[#616E8E] group cursor-pointer"
      @click="handleClick('add')"
    >
      <img
        src="../assets/images/icons/tooltip-person-add.svg"
        alt=""
        class="ml-6 mr-3 group-hover:content-addActive"
      />
      <span class="text-[10px] leading-3 group-hover:text-orange"
        >Agregar</span
      >
    </div>
    <div
      class="w-full h-10 flex items-center text-[#616E8E] group cursor-pointer"
      @click="handleClick('edit')"
    >
      <img
        src="../assets/images/icons/tooltip-edit.svg"
        alt=""
        class="ml-6 mr-3 group-hover:content-editActive"
      />
      <span class="text-[10px] leading-3 group-hover:text-orange"
        >Editar</span
      >
    </div>
    <div
      class="w-full h-10 flex items-center text-[#616E8E] group cursor-pointer"
      @click="handleClick('delete')"
    >
      <img
        src="../assets/images/icons/tooltip-delete.svg"
        alt=""
        class="ml-6 mr-3 group-hover:content-deleteActive"
      />
      <span class="text-[10px] leading-3 group-hover:text-orange"
        >Eliminar</span
      >
    </div>
  </div>
</template>

<script>

export default {
  name: "tooltip-component",
  props: {
    id: Number,
  },
  methods: {
    handleClick: function (param) {
      this.$emit('tooltip', {param: param, id: this.id});
    },
  },
};
</script>
