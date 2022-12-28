<template>
  <div class="relative">
    <div class="flex relative mb-4">
      <input
        :type="typeVal"
        :placeholder="placeHolder"
        :value="selName"
        @input="this.$emit('input', $event.target.value)"
        class="h-[52px] w-full border border-[#8A9CC9] rounded px-4"
      />
      
      <img
        src="../assets/images/icons/ic_arrow-down.svg"
        @click="handleClick()"
        :class="status === true ? 'rotate-180' : ''"
        alt=""
        class="absolute top-1/2 -translate-y-1/2 right-4 transition cursor-pointer"
      />
    </div>
    <SelectOption :selType="selType" @selected="selOpt" :options="options" v-if="status && options.length > 0" />
  </div>
</template>

<script>
import SelectOption from './SelectOption.vue';
export default {
  name: 'select-component',
  components: {
    SelectOption,
  },
  props: {
    modelValue: String,
    indexVal: Number,
    parentindex: Number,
    typeVal: String,
    placeHolder: String,
    selType: String,
    options: Array,
  },
  data: function() {
    return {
      status: false,
      selId: '',
      selName: '',
    };
  },
  mounted() {
    this.selName = this.modelValue
  },
  watch: {
    value: function (newVal) {
      console.log(newVal)
      this.selName = newVal
    }
  },
  methods: {
    handleClick: function() {
      this.status = !this.status;
    },
    selOpt: function (payload) {
      this.selId = payload.value;
      this.selName = payload.name;
      this.status = false;
      this.$emit('selReport', {indexVal: this.indexVal, value: payload.value});
      this.$emit('selTypeFre', {indexVal: this.indexVal, value: payload.value});
      this.$emit('selFrequency', {indexVal: this.indexVal, parentindex: this.parentindex, value: payload.value});
      this.$emit('selRole', {indexVal: this.indexVal, value: payload.value});
      this.$emit('selArea', {indexVal: this.indexVal, value: payload.value});
    },
  }
}
</script>