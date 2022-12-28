<template>
  <Modal :header="'Agregar usuario'" :modalType="'add'" :paragraphs="paragraphs" :status="status">
      <input
        type="text"
        class="h-[52px] w-full px-4 rounded border border-[#8A9CC9] font-normal text-base text-activeText mb-4"
        placeholder="Correo electrónico"
        v-model="email"
      />
      <input
        type="text"
        class="h-[52px] w-full px-4 rounded border border-[#8A9CC9] font-normal text-base text-activeText"
        placeholder="Correo electrónico"
        v-model="userName"
      />
      <span class="flex mt-4 w-full" :class="{'hidden': !status}">
        <img
          src="../assets/images/icons/tooltip-person-add-active.svg"
          class="mr-2"
          alt=""
        />
        <span class="text-base leading-4 text-orange">Agregar miembro</span>
      </span>
      <button
        class="h-14 sm:w-full rounded px-8 text-base leading-4 mt-10"
        :class="{ 'bg-orange text-white': status, 'bg-[#E5EBFB] text-[#8A9CC9]': !status }"
        :disabled="!status"
        @click="$emit('addUser', {'email': email})"
      >
        Guardar
      </button>
  </Modal>
</template>

<script>
var Timer = '';
import Modal from "./Modal.vue";

export default {
  name: "add-person-component",
  components: {
    Modal,
  },
  data: function () {
    return {
      email: "",
      userName: "",
      status: false,
      paragraphs: [
        "Ten en cuenta que solo le estarás brindando acceso a este tablero a los participantes que elijas.",
        "Escribe el correo electrónico del nuevo usuario y al finaliza dale click en “guardar”:",
      ],
    };
  },
  watch: {
    email: function () {
      this.isAllValid();
    },
    userName: function () {
      this.isAllValid();
    },
  },
  methods: {
    isAllValid: function () {
      var that = this;
      clearTimeout(Timer);
      Timer = setTimeout(function() {
        if (that.email !== "" && that.userName !== "") {
          if (that.status === false) {
            // that.paragraphs.shift();
            that.status = true;
          }
        } else {
          that.status = false;
        }
      }, 100);
    }
  },
};
</script>
