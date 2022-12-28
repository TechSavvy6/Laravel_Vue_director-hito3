<template>
  <Modal :header="'Editar usuario'" :modalType="'edit'" :paragraphs="paragraphs">
    <div class="flex mb-4 flex-col w-full" v-for="(user, index) in users" :key="index">
      <span class="text-sm leading-6 mb-2">Usuario {{ index + 1 }}:</span>
      <input
        type="text"
        placeholder="Correo electrónico"
        class="h-[52px] px-4 border border-[#8A9CC9] rounded font-normal text-base"
        @input="setActive"
        :value="user"
      />
    </div>
    <button
      class="h-14 sm:w-full rounded px-8 text-base leading-4 mt-10"
      :class="{ 'bg-orange text-white': status, 'bg-[#E5EBFB] text-[#8A9CC9]': !status }"
      :disabled="!status"
      @click="$emit('editUser', {'users': getUsers()})"
    >
      Guardar cambios
    </button>
  </Modal>
</template>

<script>
import Modal from "./Modal.vue";

export default {
  name: "edit-person-component",
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
  methods: {
    setActive: function () {
      this.status = true;
    },
    getUsers: function() {
      var len = document.querySelectorAll('input').length;
      var temp = [];
      for (var i = 0; i < len; i ++) {
        temp.push(document.querySelectorAll('input')[i].value);
      }
      return temp;
    },
  }
};
</script>
