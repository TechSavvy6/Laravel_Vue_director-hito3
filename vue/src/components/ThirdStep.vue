<template>
  <div class="flex flex-col">
    <span class="text-2xl sm:text-xl mb-8">Configura la frecuencia con la que se enviará el reporte del proyecto</span>
    
    <template v-if="this.$store.state.reportstate === true">
      
      <div class="w-[672px] sm:w-full">
      <div class="flex sm:flex-col justify-between items-center">
        <span class="text-base sm:mr-0 sm:mb-2 sm:w-full">Días de programación</span>
        <Select
          :indexVal="1"
          :typeVal="'text'"
          :placeHolder="'Selecciona'"
          :selType="'pro_days'"
          :class="'w-[352px] sm:w-full'"
          @selTypeFre="selTypeFre"
          v-model="selecciona"
          :options="[{value: 'LV', name: 'Lunes a viernes'}, {value: 'LS', name: 'Lunes a sábado'}]"
        />
      </div>
      <div class="flex mb-4 sm:mb-8">
          <input
            type="checkbox"
            name="quality_date"
            id="quality_date"
            value="quality_date"
            class="w-6 h-6 border border-[#8A9CC9] rounded mr-4 accent-orange"
          />
          <div>
            <label for="quality_date" class="text-sm leading-6 mb-1">Fecha de calidad</label>
            <div class="flex">
              <span class="mr-1 font-medium text-xs leading-5 text-[#8A9CC9]">
                *Opción válida para <span class="font-semibold text-[#002B6B]">PREMIUM</span>
              </span>
              <img src="../assets/images/icons/premium.svg" alt="">
            </div>
          </div>
      </div>
      <div>
        <div v-for="(report, index) in reports" :key="index">
          <div class="flex sm:flex-col justify-between items-center sm:mb-4">
            <span class="text-base sm:mr-0 sm:w-full sm:mb-2">Reporte a programar</span>
            <Select
              :indexVal="index"
              :typeVal="'text'"
              :placeHolder="'Reporte'"
              :selType="'report'"
              :class="'w-[352px] sm:w-full'"
              @selReport="selReport"
              v-model="reporttext[parseInt(report.codfrecuenciaenvioreporte)-1]"
              :options="[{value: 'Reporte de análisis de restricciones', name: 'Reporte de análisis de restricciones'},
               {value: 'Reporte de avance gráfico', name: 'Reporte de avance gráfico'}]"
            />
          </div>
          <div class="flex sm:flex-col justify-between items-center">
            <div class="flex sm:mb-2 sm:w-full">
              <template v-if="report.flagReporteMasivo === 1">
                <input
                  type="checkbox"
                  :name="'massive_all_' + index"
                  :id="'massive_all_' + index"
                  :value="'massive_all_' + index"
                  @input="massiveAll(index)"
                  v-model="truestate"
                  class="w-6 h-6 border border-[#8A9CC9] rounded mr-4 accent-orange"
                />
              </template>
              <template v-else>
                <input
                  type="checkbox"
                  :name="'massive_all_' + index"
                  :id="'massive_all_' + index"
                  :value="'massive_all_' + index"
                  @input="massiveAll(index)"
                  v-model="falsestate"
                  class="w-6 h-6 border border-[#8A9CC9] rounded mr-4 accent-orange"
                />
              </template>
              <label :for="'massive_all_' + index" class="text-sm leading-6">Envío de reporte masivo</label>
            </div>
          </div>
          <div class="mt-6" :class="report.reportSchedule === '1111' ? 'hidden' : ''">
            <div v-for="(user, childIndex) in report.frequencies" :key="childIndex" :class="report.flagReporteMasivo === 1? 'hidden' : ''">
              <div class="flex mb-6" v-if="childIndex === 0">
                <input
                  type="checkbox"
                  :name="'apply_all_' + index"
                  :id="'apply_all_' + index"
                  :value="'apply_all_' + index"
                  @input="applyAll(index)"
                  class="w-6 h-6 border border-[#8A9CC9] rounded mr-4 accent-orange"
                />
                <label :for="'apply_all_' + index" class="text-sm leading-6">Aplicar frecuencia para todos los usuarios de este reporte</label>
              </div>
              <div class="flex sm:flex-col justify-between mb-6 items-center" :class="report.applyAllStatus && childIndex > 0 ? 'hidden' : ''">
                <span class="text-base sm:mb-2 sm:w-full">{{ user.user }}</span>
                <Select
                  :indexVal="childIndex"
                  :typeVal="'text'"
                  :placeHolder="'Frecuencia'"
                  :selType="'frequency'"
                  :class="'w-[352px] sm:w-full'"
                  :parentindex="index"
                  @selFrequency="selFrequency"
                  v-model="frequencytext[parseInt(user.freq)-1]"
                  :options="[{value: 1, name: 'Diario'}, {value: 2, name: 'Interdiario'}, {value: 3, name: 'Quincenal'}]"
                />
              </div>
            </div>
            <div class="flex sm:flex-col justify-between mb-6 items-center" :class="report.massiveStatus === 0 ? 'hidden' : ''">
                <span class="text-base sm:mb-2 sm:w-full"></span>
                <Select
                  :indexVal="childIndex"
                  :typeVal="'text'"
                  :placeHolder="'Frecuencia'"
                  :selType="'frequency'"
                  :class="'w-[352px] sm:w-full'"
                  :parentindex="index"
                  @selFrequency="selFrequency"
                  v-model="frequencytext[parseInt(report.codfrecuenciaenvioreporte)-1]"
                  :options="[{value: 1, name: 'Diario'}, {value: 2, name: 'Interdiario'}, {value: 3, name: 'Quincenal'}]"
                />
              </div>
          </div>
        </div>
      </div>
      <span class="font-medium text-xs leading-5" :class="paraStatus !== true ? 'hidden' : ''">*Para enviar reporte por participante, debes desactivar el envío masivo y tener una cuenta PREMIUM </span>
      <div class="flex cursor-pointer mt-8 mb-8" @click="addReport">
        <img
          src="../assets/images/icons/tooltip-person-add-active.svg"
          class="mr-2"
          alt=""
        />
        <span class="text-base leading-4 text-orange">Agregar nuevo reporte</span>
      </div>
      </div>
    </template>


    <template v-else>
      <div class="w-[672px] sm:w-full">
        <div class="flex sm:flex-col justify-between items-center">
          <span class="text-base sm:mr-0 sm:mb-2 sm:w-full">Días de programación</span>
          <!-- <template v-if="currentprojectreport[0]">
            
          </template> -->
          <Select
            :indexVal="1"
            :typeVal="'text'"
            :placeHolder="'Selecciona'"
            :selType="'pro_days'"
            :class="'w-[352px] sm:w-full'"
            @selTypeFre="selTypeFre"
            :options="[{value: 'LV', name: 'Lunes a viernes'}, {value: 'LS', name: 'Lunes a sábado'}]"
          />
          <!-- v-model="currentprojectreport[0].codTipoFrecuencia" -->
        </div>
        <div class="flex mb-4 sm:mb-8">
            <input
              type="checkbox"
              name="quality_date"
              id="quality_date"
              value="quality_date"
              class="w-6 h-6 border border-[#8A9CC9] rounded mr-4 accent-orange"
            />
            <div>
              <label for="quality_date" class="text-sm leading-6 mb-1">Fecha de calidad</label>
              <div class="flex">
                <span class="mr-1 font-medium text-xs leading-5 text-[#8A9CC9]">
                  *Opción válida para <span class="font-semibold text-[#002B6B]">PREMIUM</span>
                </span>
                <img src="../assets/images/icons/premium.svg" alt="">
              </div>
            </div>
        </div>
        <div>
          <div v-for="(report, index) in reports" :key="index">
            <div class="flex sm:flex-col justify-between items-center sm:mb-4">
              <span class="text-base sm:mr-0 sm:w-full sm:mb-2">Reporte a programar</span>
              <Select
                :indexVal="index"
                :typeVal="'text'"
                :placeHolder="'Reporte'"
                :selType="'report'"
                :class="'w-[352px] sm:w-full'"
                @selReport="selReport"
                :options="[{value: 'Reporte de análisis de restricciones', name: 'Reporte de análisis de restricciones'},
                {value: 'Reporte de avance gráfico', name: 'Reporte de avance gráfico'}]"
              />
            </div>
            <div class="flex sm:flex-col justify-between items-center">
              <div class="flex sm:mb-2 sm:w-full">
                <input
                    type="checkbox"
                    :name="'massive_all_' + index"
                    :id="'massive_all_' + index"
                    :value="'massive_all_' + index"
                    @input="massiveAll(index)"
                    class="w-6 h-6 border border-[#8A9CC9] rounded mr-4 accent-orange"
                  />
                <label :for="'massive_all_' + index" class="text-sm leading-6">Envío de reporte masivo</label>
              </div>
            </div>
            <div class="mt-6" :class="report.reportSchedule === '' ? 'hidden' : ''">
              <div v-for="(user, childIndex) in users" :key="childIndex" :class="report.massiveStatus === 1? 'hidden' : ''">
                <div class="flex mb-6" v-if="childIndex === 0">
                  <input
                    type="checkbox"
                    :name="'apply_all_' + index"
                    :id="'apply_all_' + index"
                    :value="'apply_all_' + index"
                    @input="applyAll(index)"
                    class="w-6 h-6 border border-[#8A9CC9] rounded mr-4 accent-orange"
                  />
                  <label :for="'apply_all_' + index" class="text-sm leading-6">Aplicar frecuencia para todos los usuarios de este reporte</label>
                </div>
                <div class="flex sm:flex-col justify-between mb-6 items-center" :class="report.applyAllStatus && childIndex > 0 ? 'hidden' : ''">
                  <span class="text-base sm:mb-2 sm:w-full">{{ user.userEmail }}</span>
                  <Select
                    :indexVal="childIndex"
                    :typeVal="'text'"
                    :placeHolder="'Frecuencia'"
                    :selType="'frequency'"
                    :class="'w-[352px] sm:w-full'"
                    :parentindex="index"
                    @selFrequency="selFrequency"
                    :options="[{value: 1, name: 'Diario'}, {value: 2, name: 'Interdiario'}, {value: 3, name: 'Quincenal'}]"
                  />
                </div>
              </div>
              <div class="flex sm:flex-col justify-between mb-6 items-center" :class="report.massiveStatus === 0 ? 'hidden' : ''">
                <span class="text-base sm:mb-2 sm:w-full"></span>
                <Select
                  :indexVal="childIndex"
                  :typeVal="'text'"
                  :placeHolder="'Frecuencia'"
                  :selType="'frequency'"
                  :class="'w-[352px] sm:w-full'"
                  :parentindex="index"
                  @selFrequency="selFrequency"
                  :options="[{value: 1, name: 'Diario'}, {value: 2, name: 'Interdiario'}, {value: 3, name: 'Quincenal'}]"
                />
              </div>
            </div>
          </div>
        </div>
        <span class="font-medium text-xs leading-5" :class="paraStatus !== true ? 'hidden' : ''">*Para enviar reporte por participante, debes desactivar el envío masivo y tener una cuenta PREMIUM </span>
        <div class="flex cursor-pointer mt-8 mb-8" @click="addReport">
          <img
            src="../assets/images/icons/tooltip-person-add-active.svg"
            class="mr-2"
            alt=""
          />
          <span class="text-base leading-4 text-orange">Agregar nuevo reporte</span>
        </div>
      </div>
    </template>
  </div>
</template>

<script>
import Select from "./Select.vue";
import {mapState} from "vuex"
export default {
  name: 'third-step-component',
  components: {
    Select,
  },
  computed: {
    ...mapState({
      currentprojectreport: state => state.currentprojectreport
    }),
    selecciona: function() {
      if(this.currentprojectreport[0] && this.currentprojectreport[0].codTipoFrecuencia === 'LV') {
        return 'Lunes a viernes'
      } else if (this.currentprojectreport[0] &&  this.currentprojectreport[0].codTipoFrecuencia === 'LS') {
        return 'Lunes a sábado'
      } else {
        return ''
      }
    },
  },
  data: function() {
    return {
      paraStatus: true,
      users: this.$store.state.projectUsers,
      reports: this.$store.state.currentprojectreport,
      TypeFrequency: '',
      truestate:true,
      falsestate:false,
      reporttext: [
        'Reporte de análisis de restricciones',
        'Reporte de avance gráfico'
      ],
      frequencytext: [
        'Diairo', 'Interdiairo', 'Quincenal'
      ]
    };
  },
  mounted() {
    console.log(this.reports)
  },
  methods: {
    addReport: function() {
      this.users = this.$store.state.projectUsers
      console.log(this.$store.state.projectUsers)
      var temp = {
        reportSchedule: '',
        massiveStatus: 0,
        frequencies: [],
        applyAllStatus: false,
        frequency: null,
        usercreation: ''
      };
      this.reports.push(temp);
    },
    selTypeFre: function(payload) {
      this.TypeFrequency = payload.value;
      this.paraStatus = false;
    },
    selReport: function(payload) {
      this.reports[payload.indexVal].reportSchedule = payload.value;
      this.paraStatus = false;
    },
    selFrequency: function(payload) {
      if(this.reports[payload.parentindex].massiveStatus === 1) {
        this.users.forEach(user => {
          this.reports[payload.parentindex].usercreation += user.userEmail + ", "
        });
        this.reports[payload.parentindex].frequency = payload.value;
      }
      else if(this.users[0].userEmail) {
        var frequencytemp = {
          user: this.users[payload.indexVal].userEmail,
          freq: payload.value
        }
        this.reports[payload.parentindex].frequency = payload.value;
        this.reports[payload.parentindex].frequencies.push(frequencytemp);
        this.reports[payload.parentindex].usercreation += frequencytemp.user + ", "
      }
      this.paraStatus = false;
    },
    applyAll: function(indexVal) {
      this.reports[indexVal].applyAllStatus = !this.reports[indexVal].applyAllStatus;
    },
    massiveAll: function(indexVal) {
      this.reports[indexVal].massiveStatus = 1-this.reports[indexVal].massiveStatus;
    }
  }
}
</script>