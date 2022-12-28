<template>
    <Modal :header="'View Project'" :modalType="'viewproject'" :paragraphs="paragraphs" :status="status">
        <div class="flex mb-4 flex-col w-full">
            <span class="text-sm leading-6 mb-2">Project Name:</span>
            <input
                type="text"
                class="h-[52px] w-full px-4 rounded border border-[#8A9CC9] font-normal text-base text-activeText mb-4"
                placeholder="Correo electrónico"
                readonly=""
                :value="modelValue.projectName"
            />
        </div>
        <div class="flex mb-4 flex-col w-full">
            <span class="text-sm leading-6 mb-2">Business:</span>
            <input
                type="text"
                class="h-[52px] w-full px-4 rounded border border-[#8A9CC9] font-normal text-base text-activeText mb-4"
                placeholder="Correo electrónico"
                readonly=""
                :value="modelValue.business"
            />
        </div>
        <div class="flex mb-4 flex-col w-full">
            <span class="text-sm leading-6 mb-2">Term:</span>
            <input
                type="text"
                class="h-[52px] w-full px-4 rounded border border-[#8A9CC9] font-normal text-base text-activeText mb-4"
                placeholder="Correo electrónico"
                readonly=""
                :value="modelValue.term"
            />
        </div>
        <div class="flex mb-4 flex-col w-full">
            <span class="text-sm leading-6 mb-2">Covered Area:</span>
            <input
                type="text"
                class="h-[52px] w-full px-4 rounded border border-[#8A9CC9] font-normal text-base text-activeText mb-4"
                placeholder="Correo electrónico"
                readonly=""
                :value="modelValue.coveredArea"
            />
        </div>
        <div class="flex mb-4 flex-col w-full">
            <span class="text-sm leading-6 mb-2">Project Type:</span>
            <input
                type="text"
                class="h-[52px] w-full px-4 rounded border border-[#8A9CC9] font-normal text-base text-activeText mb-4"
                placeholder="Correo electrónico"
                readonly=""
                :value="modelValue.projectType"
            />
        </div>
        <div class="flex mb-4 flex-col w-full">
            <span class="text-sm leading-6 mb-2">District:</span>
            <input
                type="text"
                class="h-[52px] w-full px-4 rounded border border-[#8A9CC9] font-normal text-base text-activeText mb-4"
                placeholder="Correo electrónico"
                readonly=""
                :value="modelValue.district"
            />
        </div>
        <div class="flex mb-4 flex-col w-full">
            <span class="text-sm leading-6 mb-2">Start Date:</span>
            <input
                type="text"
                class="h-[52px] w-full px-4 rounded border border-[#8A9CC9] font-normal text-base text-activeText mb-4"
                placeholder="Correo electrónico"
                readonly=""
                :value="modelValue.startDate"
            />
        </div>
        <div class="flex mb-4 flex-col w-full">
            <span class="text-sm leading-6 mb-2">Reference Amount:</span>
            <input
                type="text"
                class="h-[52px] w-full px-4 rounded border border-[#8A9CC9] font-normal text-base text-activeText mb-4"
                placeholder="Correo electrónico"
                readonly=""
                :value="modelValue.referenceAmount"
            />
        </div>
        <div class="flex mb-4 flex-col w-full">
            <span class="text-sm leading-6 mb-2">Area:</span>
            <input
                type="text"
                class="h-[52px] w-full px-4 rounded border border-[#8A9CC9] font-normal text-base text-activeText mb-4"
                placeholder="Correo electrónico"
                readonly=""
                :value="modelValue.area"
            />
        </div>
        <div class="flex mb-4 flex-col w-full">
            <span class="text-sm leading-6 mb-2">Built Area:</span>
            <input
                type="text"
                class="h-[52px] w-full px-4 rounded border border-[#8A9CC9] font-normal text-base text-activeText mb-4"
                placeholder="Correo electrónico"
                readonly=""
                :value="modelValue.builtArea"
            />
        </div>
        <div class="flex mb-4 flex-col w-full">
            <span class="text-sm leading-6 mb-2">Country:</span>
            <input
                type="text"
                class="h-[52px] w-full px-4 rounded border border-[#8A9CC9] font-normal text-base text-activeText mb-4"
                placeholder="Correo electrónico"
                readonly=""
                :value="modelValue.country"
            />
        </div>
    </Modal>
  </template>
  
  <script>
  import Modal from "./Modal.vue";
  
  export default {
    name: "add-person-component",
    components: {
      Modal,
    },
    props: {
        modelValue: {
            type: Object,
            default: () => ({}),
        }
    },
    data: function () {
      return {
        email: "",
        userName: "",
        status: false,
        paragraphs: [
          "This is showing Project Information",
        ],
      };
    },
    methods: {
      
    },
  };
  </script>
  