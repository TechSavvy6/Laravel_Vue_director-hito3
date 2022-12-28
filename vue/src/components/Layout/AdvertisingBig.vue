<template>
  <div class="relative mb-6" v-if="isOpen">
    <img
      src="../../assets/images/icons/close.svg"
      class="absolute top-3 sm:top-2 right-3 sm:right-2 cursor-pointer"
      alt=""
      @click="handleClose"
    />
    <div
      class="w-full h-24 flex items-center justify-center bg-side rounded-lg justify-center tracking-tight p-5"
    >
      <span class="text-activeText text-base">
        Publicidad {{ width }} x {{ height }}
      </span>
    </div>
  </div>
</template>

<script>
export default {
  name: "advertisingbig-component",
  props: {
    width: Number,
    height: Number,
  },
  data: function () {
    return {
      isOpen: true,
    };
  },
  methods: {
    handleClose() {
      this.isOpen = false;
    },
  },
};
</script>
