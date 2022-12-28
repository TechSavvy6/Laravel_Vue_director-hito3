<template>
  <div class="flex w-full h-10 bg-side rounded-lg justify-center items-center relative">
    <span class="text-activeText tracking-tight font-base">
      Publicidad
    </span>
    <img
      src="../../assets/images/icons/ic_arrow-down.svg"
      alt=""
      @click="handleClick()"
      class="absolute flex transition top-1/2 right-3 -translate-y-1/2 cursor-pointer"
      :class="{ 'rotate-180': isOpen, 'rotate-0': !isOpen }"
    />
  </div>
</template>

<script>
export default {
  name: "advertising-component",
  data: function () {
    return {
      isOpen: false,
    };
  },
  methods: {
    handleClick() {
      this.isOpen = !this.isOpen;
    },
  },
};
</script>
