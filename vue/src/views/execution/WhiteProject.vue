<template>
  <div>
    <Breadcrumb
      :paths="['Inicio', 'Análisis de restricciones', 'Proyecto Blanco']"
       :settingFlag="true"
    />
    <div class="flex sm:flex-col justify-between mb-12 sm:mb-10">
      <span class="items-start text-2xl text-activeText sm:mb-4"
        >Restricciones</span
      >
      <div class="flex sm:flex-col h-[52px] sm:h-auto">
        <div class="relative mr-4 sm:mr-0 sm:mb-4">
          <input
            type="text"
            name="personalize"
            id="personalize"
            class="h-[52px] px-4 border border-[#8A9CC9] rounded text-base sm:w-full"
            placeholder="Personalizar"
          />
          <img
            src="../../assets/images/icons/ic_arrow-down.svg"
            alt=""
            class="absolute flex transition top-1/2 right-4 -translate-y-1/2 cursor-pointer"
            :class="{
              'rotate-180': personalizeOpen,
              'rotate-0': !personalizeOpen,
            }"
            @click="handleClick('personalize')"
          />
        </div>
        <div class="relative">
          <input
            type="text"
            name="filter"
            id="filter"
            v-model="filterName"
            class="h-[52px] px-4 border border-[#8A9CC9] rounded text-base sm:w-full"
            placeholder="Filtrar"
          />
          <img
            src="../../assets/images/icons/ic_arrow-down.svg"
            alt=""
            class="absolute flex transition top-1/2 right-4 -translate-y-1/2 cursor-pointer"
            :class="{ 'rotate-180': filterOpen, 'rotate-0': !filterOpen }"
            @click="handleClick('filter')"
          />
          <SelectOption :selType="'tree'" @selected="selFilterOpt" :options="options" v-if="filterOpen" />
        </div>
      </div>
    </div>
    <div class="flex sm:flex-col mb-12 justify-between">
      <div class="flex sm:flex-col sm:mb-2" v-if="!fullScreen">
        <button
          class="w-[150px] sm:w-full h-8 px-4 flex justify-between items-center border-2 border-orange rounded mr-4 sm:mb-2"
          @click="openModal('addFront')"
        >
          <span class="text-xs text-orange">Agregar frente</span>
          <img src="../../assets/images/icons/btn-plus.svg" alt="" />
        </button>
        <button
          class="w-[140px] sm:w-full h-8 px-4 flex justify-between items-center border-2 border-orange rounded mr-4 sm:mb-2"
          @click="openModal('addPhase')"
        >
          <span class="text-xs text-orange">Agregar Fase</span>
          <img src="../../assets/images/icons/btn-plus.svg" alt="" />
        </button>
        <button
          class="w-[110px] sm:w-full h-8 px-4 flex justify-between items-center border-2 rounded"
          :disabled="isDisabled"
          :class="{
            'border-orange': !isDisabled,
            'border-[#DCE4F9]': isDisabled,
          }"
          @click="openModal('deleteFront')"
        >
          <span
            class="text-xs"
            :class="{
              'text-orange': !isDisabled,
              'text-[#8A9CC9]': isDisabled,
            }"
          >
            Eliminar
          </span>
          <img
            src="../../assets/images/icons/tooltip-delete.svg"
            :class="{ 'content-deleteActive': !isDisabled }"
            alt=""
          />
        </button>
      </div>
      <div class="flex sm:mb-2" v-if="fullScreen">
        <ul class="text-[#8A9CC9] items-center flex text-xs">
          <li class="flex">
            {{ frontName }}
          </li>
          <li class="text-[#616E8E] flex">
            <img
              src="../../assets/images/icons/arrow-right.svg"
              alt=""
              class="mx-[5px]"
            />
            {{ phaseName }}
          </li>
        </ul>
      </div>
      <div class="flex sm:flex-wrap" v-if="!isDisabled">
        <div class="flex items-center mr-4 cursor-pointer sm:mb-2">
          <span class="text-xs text-[#002B6B] mr-1">Descargar excel</span>
          <img src="../../assets/images/icons/download.svg" alt="" />
        </div>
        <div class="flex items-center mr-4 cursor-pointer sm:mb-2">
          <span class="text-xs text-[#002B6B] mr-1">Importar excel</span>
          <img src="../../assets/images/icons/upload.svg" alt="" />
        </div>
        <div class="flex items-center cursor-pointer sm:mb-2" @click="openModal('downloadReport')">
          <span class="text-xs text-[#002B6B] mr-1">Descargar reporte</span>
          <img src="../../assets/images/icons/download.svg" alt="" />
        </div>
      </div>
    </div>
    <div class="flex flex-col">
      <div v-if="!fullScreen">
        <div v-for="(row, index) in rows" :key="index">
          <hr v-if="index !== 0" class="mb-6 bg-[#D0D9F1]" />
          <div
            class="flex justify-between items-cener mb-6 sm:w-full cursor-pointer"
            @click="toggleOpen(row.name)"
          >
            <span class="text-xl text-activeText">{{ row.name }}</span>
            <img
              src="../../assets/images/icons/ic_arrow-down.svg"
              alt=""
              class="flex transition"
              :class="{ 'rotate-180': row.isOpen, 'rotate-0': !row.isOpen }"
            />
          </div>
          <div class="flex flex-col mt-2 mb-8 pl-8 sm:pl-4" v-if="row.isOpen">
            <div
              class="flex flex-col mb-4"
              v-for="(item, index) in row.info"
              :key="index"
            >
              <div>
                <span class="text-base leading-7 text-activeText shrink-0">
                  {{ item.name }}
                </span>
                <span
                  class="ml-[100px] sm:ml-8 text-base leading-7 text-activeText"
                >
                  No retrasadas: {{ item.notDelayed }}
                  <span class="sm:hidden">/</span> Retrasadas:
                  {{ item.delayed }}
                </span>
              </div>
              <div class="mt-8">
                <!-- <div v-if="item.tableData.length > 0" class="mt-8"> -->
                <div class="flex items-center mb-6 cursor-pointer" @click="openModal({param: 'toggleColumn', frontId: row.id, phaseId: item.id})">
                  <img
                    src="../../assets/images/icons/visibility.svg"
                    alt=""
                    class="mr-1"
                  />
                  <span class="text-xs text-[#002B6B]"
                    >Ocultar / mostrar columnas</span
                  >
                </div>
                <div class="outer relative border border-[#D0D9F1] rounded-lg before:w-24 before:absolute before:h-full before:shadow-tooltip">
                  <div class="inner overflow-scroll overflow-hidden ml-24">
                    <DataTable
                      :tableType="'scroll'"
                      :cols="headerCols"
                      :rows="item.tableData"
                      :hideCols="item.hideCols"
                      :frontId="row.id"
                      :phaseId="item.id"
                      :frontName="row.name"
                      :phaseName="item.name"
                      class="table-fixed"
                      @fullScreen="toggleFullScreen"
                      @addRowModal="addRowModal"
                    >
                      <template v-slot="tr">
                        <ScrollTableRow :row="tr" :frontId="row.id" :phaseId="item.id" :hideCols="item.hideCols" @openModal="openModal" />
                      </template>
                    </DataTable>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div v-if="fullScreen" class="mt-12">
        <div class="flex items-center mb-6 cursor-pointer" @click="openModal({param: 'toggleColumn', frontId: frontId, phaseId: phaseId})">
          <img
            src="../../assets/images/icons/visibility.svg"
            alt=""
            class="mr-1"
          />
          <span class="text-xs text-[#002B6B]"
            >Ocultar / mostrar columnas</span
          >
        </div>
        <div class="outer relative border border-[#D0D9F1] rounded-lg before:w-24 before:absolute before:h-full before:shadow-tooltip">
          <div class="inner overflow-x-scroll overflow-hidden ml-24">
            <DataTable
              :tableType="'scroll'"
              :cols="headerCols"
              :rows="tableData"
              :hideCols="hideCols"
              :frontId="frontId"
              :phaseId="phaseId"
              :frontName="frontName"
              :phaseName="phaseName"
              :restrictionOption="restrictionOption"
              class="table-fixed"
              @fullScreen="toggleFullScreen"
              @addRow="addRow"
            >
              <template v-slot="row">
                <ScrollTableRow :row="row" :frontId="frontId" :phaseId="phaseId" :hideCols="hideCols" @openModal="openModal" />
              </template>
            </DataTable>
          </div>
        </div>
      </div>
    </div>
    
    <AddFront :rows="rows" v-if="modalName === 'addFront'" @closeModal="closeModal" @addFront="addFront" />
    <AddPhase :rows="rows" v-if="modalName === 'addPhase'" @closeModal="closeModal" @addPhase="addPhase" />
    <DeleteFront :rows="rows" v-if="modalName === 'deleteFront'" @closeModal="closeModal" @deleteFront="deleteFront" />
    <ToggleColumn :hideCols="hideCols" v-if="modalName == 'toggleColumn'" @closeModal="closeModal" @setColumnsStatus="setColumnsStatus" />
    <DownloadReport v-if="modalName == 'downloadReport'" @closeModal="closeModal" />
    <AddRow v-if="modalName === 'addRow'" @closeModal="closeModal" @addRow="addRow" />
    <DeleteRow v-if="modalName === 'deleteRow'" @closeModal="closeModal" @delRow="delRow" />
    <Confirm
      :confirmHeader="'Eliminar usuario'"
      :header="''"
      :paragraphs="[]"
      :buttons="['Sí, eliminar', 'No, mantener']"
      v-if="modalName === 'duplicateRow'"
      @closeModal="closeModal"
      @confirmStatus="duplicate"
    />
    <RestrictionPerson :restriction="restriction" v-if="personalizeOpen === true" @closeModal="closeModal" @addRestriction="addRestriction" />
  </div>
</template>
<script>
import Breadcrumb from "../../components/Layout/Breadcrumb.vue";
import DataTable from "../../components/DataTable.vue";
import ScrollTableRow from "../../components/ScrollTableRow.vue";
import AddFront from "../../components/AddFront.vue";
import RestrictionPerson from "../../components/RestrictionPerson.vue";
import DeleteFront from "../../components/DeleteFront.vue";
import ToggleColumn from "../../components/ToggleColumn.vue";
import AddRow from "../../components/AddRow.vue";
import DeleteRow from "../../components/DeleteRow.vue";
import DownloadReport from "../../components/DownloadReport.vue";
import SelectOption from "../../components/SelectOption.vue";
import AddPhase from "../../components/AddPhase.vue";
import Confirm from "../../components/Confirm.vue";
import store from "../../store";
export default {
  name: "white-project-component",
  components: {
    Breadcrumb,
    DataTable,
    ScrollTableRow,
    AddFront,
    RestrictionPerson,
    DeleteFront,
    ToggleColumn,
    AddRow,
    DeleteRow,
    DownloadReport,
    SelectOption,
    AddPhase,
    Confirm
},
  data: function () {
    return {
      modalName: "",
      personalizeOpen: false,
      filterOpen: false,
      filterId: "",
      filterName: "",
      frontId: '',
      frontName: '',
      phaseId: '',
      exercise: '',
      phaseName: '',
      fullScreen: false,
      options: [
        {
          name: 'Responsable',
          value: 'responsible',
        },
        {
          name: 'Solicitante',
          value: 'applicant',
        },
        {
          name: 'Vencimiento',
          value: 'expiration',
        },
        {
          name: 'Tipo de restricción',
          value: 'restriction_type',
        },
      ],
      headerCols: {
        plus: "",
        exercise: "Descrip. actividad",
        restriction: "Descrip. restricción",
        restrictionType: "Tipo de restricción",
        date_required: "Fecha requerida",
        responsible: "Responsable",
        responsible_area: "Área responsable",
        condition: "Estado",
        applicant: "Solicitante ",
      },
    };
  },
  methods: {
    handleClick: function (id) {
      id === "personalize" && (this.personalizeOpen = !this.personalizeOpen);
      id === "filter" && (this.filterOpen = !this.filterOpen);
    },
    toggleOpen: function (param) {
      this.rows.map((row) => {
        if (row.name === param) {
          row.isOpen = !row.isOpen;
        }
      });
    },
    toggleFullScreen: function (payload) {
      this.frontId = payload.frontId;
      this.phaseId = payload.phaseId;
      this.frontName = payload.frontName;
      this.phaseName = payload.phaseName;
      this.fullScreen = !this.fullScreen;
    },
    openModal: function (param) {
      if (typeof param !== "string") {
        this.frontId = (typeof param.frontId !== "undefined") ? param.frontId : '';
        this.phaseId = (typeof param.phaseId !== "undefined") ? param.phaseId : '';
        this.exercise = (typeof param.exercise !== "undefined") ? param.exercise : '';
        param = param.param;
      }
      this.modalName = param;
    },
    closeModal: function () {
      this.modalName = "";
      this.personalizeOpen = false;
    },
    setColumnsStatus: function(payload) {
      this.$store.commit({
        type: 'setHideCols',
        frontId: this.frontId,
        phaseId: this.phaseId,
        hideCols: payload.hideCols
      });
      this.closeModal();
    },
    selFilterOpt: function (payload) {
      this.filterId = payload.value;
      this.filterName = payload.name;
      this.$store.commit({
        type: 'setFilterColumn',
        filterId: this.filterId,
      });
      this.filterOpen = false;
    },
    addFront: function (payload) {
      this.$store.commit({
        type: 'addFront',
        ...payload,
      });
      store.dispatch('add_front', payload)
      this.closeModal();
    },
    addPhase: function (payload) {
      this.$store.commit({
        type: 'addFront',
        ...payload,
      });
      store.dispatch('add_phase', payload)
      this.closeModal();
    },
    deleteFront: function (payload) {
      store.dispatch('delete_font', payload)
      this.closeModal();
    },
    addRow: function (payload) {
      
      this.$store.commit({
        type: 'addScrollTableRow',
        frontId: this.frontId,
        phaseId: this.phaseId,
        ...payload,
      });

      const data = {
        frontId: this.frontId, 
        phaseId: this.phaseId,
        actividadName: payload.exercise,
      }
      store.dispatch('add_Actividad', data)
      this.closeModal();
    },
    delRow: function (payload) {
      this.$store.commit({
        type: 'delScrollTableRow',
        frontId: this.frontId,
        phaseId: this.phaseId,
        exercise: this.exercise,
        ...payload,
      });
      this.closeModal();
    },
    duplicate: function (payload) {
      if (!payload.param) {
        this.$store.commit({
          type: 'duplicateScrollTableRow',
          frontId: this.frontId,
          phaseId: this.phaseId,
          exercise: this.exercise,
          ...payload,
        });
      }
      this.closeModal();
    },
    addRowModal: function(payload) { 
      this.openModal({param: 'addRow', frontId: payload.frontId, phaseId: payload.phaseId})
    },
    addRestriction: function( options) { 
      if(options) {
        store.dispatch('Set_Restriction', options); 
      } 
      this.$store.getters.addRestriction_P(options);  
      this.closeModal(); 
    }
  },
  computed: {
    restriction: function() {
      return this.$store.state.Restrictionlist_P;
    },
    isDisabled: function () {
      return this.rows.length > 0 ? false : true;
    },
    rows: function() { 
      return this.$store.state.whiteproject_rows;
    },
    restrictionOption: function () {
      return this.$store.state.Restrictionlist;
    },
    tableData: function() {
      return this.$store.getters.tableData({id: this.frontId, phaseId: this.phaseId});
    },
    hideCols: function() {
      return this.$store.getters.hideCols({id: this.frontId, phaseId: this.phaseId});
    }
  },
  mounted: function() {
    store.dispatch('get_front');
    store.dispatch('get_Restriction_P');
  }
};
</script>