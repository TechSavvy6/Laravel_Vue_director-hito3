<template>
  <tr>
    <td class="absolute left-0 mt-2">
      <button class="bg-[#DCE4F9] w-6 h-6 rounded-md justify-center flex items-center" @click="handleClick('modal')"
        v-click-outside="hide">
        <img src="../assets/images/icons/points.svg" :class="{ 'content-pointsActive': row.isTooltip }" alt="" />
      </button>
      <TableTooltip v-if="isOpen" @tooltip="openModal" />
    </td>
    <td>
      <div class="flex border border-[#8A9CC9] rounded h-8 justify-center w-24">
        <img width="16" src="../assets/images/icons/down-arrow-icon.svg" alt="">
        <span class="px-1 text-sm leading-7"></span>
        <img width="16" src="../assets/images/icons/up-arrow-icon.svg" alt="">
      </div>
    </td>
    <td>{{ row['exercise'] }}</td>
    <td>{{ row['restriction'] }}</td>
    <td>
      <div class="flex relative  cursor-pointer cursor-pointer">
        <input v-model="material" type="text" class="w-full border border-[#8A9CC9] px-2 h-10 rounded " placeholder="Materiales" />
        <img @click="handleClick('option')" src="../assets/images/icons/ic_arrow-down.svg"
          class="absolute top-1/2 -translate-y-1/2 right-2" alt=""
          :class="{ 'rotate-180': isoptions, 'rotate-0': !isoptions }">
        <SelectOption @selected="selOpt" :options="getOption()" v-if="isoptions" />
      </div>
    </td>
    <td :class="{ 'hidden': hideCols.indexOf('date_required') > -1 }">{{ row['date_required'] }}</td>
    <td :class="{ 'hidden': hideCols.indexOf('responsible') > -1 }">{{ row['responsible'] }}</td>
    <td :class="{ 'hidden': hideCols.indexOf('responsible_area') > -1 }">{{ row['responsible_area'] }}</td>
    <td :class="{ 'hidden': hideCols.indexOf('condition') > -1 }">
      <span class="px-1 py-0.5 bg-[#EB9B00] rounded text-[10px] leading-3">En proceso</span>
    </td>
    <td :class="{ 'hidden': hideCols.indexOf('applicant') > -1 }">{{ row['applicant'] }}</td>
  </tr>
</template>

<script>
import ClickOutside from "vue-click-outside";
import TableTooltip from "./TableTooltip.vue";
import SelectOption from "./SelectOption.vue";


export default {
  name: "custome-table-row",
  components: {
    TableTooltip,
    SelectOption
  },
  props: {
    frontId: Number,
    phaseId: Number,
    row: Object,
    hideCols: Array,
    restrictionOption: Array
  },
  data: function () {
    return {
      isOpen: false,
      isoptions: false,
      material:'',
      options: []
    };
  },
  methods: {
    handleClick: function (index) {
      if (index === 'option') {
        this.isoptions = !this.isoptions;
      } else
        this.isOpen = !this.isOpen;
    },
    hide: function () {
      this.isOpen = false;
    },
    selOpt: function (payload) {
      this.isoptions = false;
      this.material = payload.value;
    },
    getOption: function () {
      const options = []; 
      this.$store.state.Restrictionlist.map((row) => {
        const temp = {};
        temp["value"] = row.value;
        temp["name"] = row.value;
        options.push(temp);
      });
      this.options = options;
      return options
    },
    openModal: function (payload) {
      this.$emit('openModal', { param: payload.param, frontId: this.frontId, phaseId: this.phaseId, exercise: this.row.exercise });
    }
  },
  directives: {
    ClickOutside,
  },
  mounted: function () {
    this.getOption();
  }
};
</script>