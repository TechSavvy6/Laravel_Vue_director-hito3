<template>
  <Modal :header="'Eliminar usuario'" :modalType="'delete'" :paragraphs="paragraphs">
    <div class="flex mb-6 flex-col w-full" v-for="(user, index) in users" :key="index">
      <span class="text-sm leading-6 mb-2">Usuario {{ index + 1 }}:</span>
      <div class="flex sm:flex-col justify-between items-center sm:items-start">
        <span class="font-medium text-base leading-7 sm:mb-2">{{ user }}</span>
        <div class="flex items-center cursor-pointer" @click="$emit('deleteUser', {param:user})">
          <img src="../assets/images/icons/tooltip-delete-active.svg" class="mr-1" alt="">
          <span class="text-xs text-orange">Eliminar</span>
        </div>
      </div>
    </div>
  </Modal>
</template>

<script>
import Modal from "./Modal.vue";

export default {
  name: "delete-person-component",
  props: {
    users: Array,
  },
  data: function () {
    return {
      status: false,
      paragraphs: [],
    };
  },
  components: {
    Modal,
  },
};
</script>