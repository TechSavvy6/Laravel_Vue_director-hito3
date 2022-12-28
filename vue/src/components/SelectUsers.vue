<template>
    <Modal :header="'Select Users'" :modalType="'selectusers'" :status="status">
        <div class="flex mb-4">
            <input
                type="checkbox"
                name="selall"
                id="selall"
                value="selall"
                class="w-6 h-6 border border-[#8A9CC9] rounded mr-4 accent-orange"
                @input="selectAll"
            />
            <label for="selall">
                <span class="font-bold text-sm leading-6">
                All Users
                </span>
            </label>
        </div>
        <div class="flex mb-6 flex-col w-full" v-for="(user, index) in modelValue" :key="index">
            <div class="flex mb-4">
                <input
                    type="checkbox"
                    :name="'user_'+index"
                    :id="'user_'+index"
                    :value="user"
                    class="w-6 h-6 border border-[#8A9CC9] rounded mr-4 accent-orange"
                    v-model="this.$store.state.restriction_rows[rowId].equipments"
                />
                <label :for="'user_'+index">
                    <span class="font-medium text-sm leading-6">
                    {{user}}
                    </span>
                </label>
            </div>
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
            type: Array,
            default: []
        },
        rowId: Number
    },
    data: function () {
        return {
            status: false,
            selUsers: this.$store.state.restriction,
            selAllState: false
        };
    },
    methods: {
        selectAll: function() {
            if(this.selAllState === false) {
                this.$store.state.restriction_rows[this.rowId].equipments = this.modelValue;
                this.selAllState = true;
            }
            else {
                this.$store.state.restriction_rows[this.rowId].equipments = [];
                this.selAllState = false;
            }
        }
    },
    mounted: function() {
        
    }
  };
  </script>
  