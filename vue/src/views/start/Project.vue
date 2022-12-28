<template>
  <div id = 'create_project'>
    <div
      class="h-full flex justify-center sm:items-start"
      v-if="projectLength === 0 && status === 0"
    >
      <div
        class="flex flex-col items-center w-[480px] sm:w-full mt-0 sm:mt-0 h-[312px] sm:h-[292px] p-16 sm:p-10 justify-center shadow-tooltip rounded-2xl bg-white cursor-pointer"
        :class="{ 'z-30': hint === 1 }"
        @click="nextStatus"
      >
        <img
          src="../../assets/images/icons/computer.svg"
          class="mb-8 sm:mb-6"
          alt=""
        />
        <span class="text-[28px] leading-9 text-center"
          >Crea tu primer proyecto</span
        >
      </div>
      <Hint
        :header="'Aquí crea tu primer proyecto'"
        :paragraph="'Dale click y podrás crear tu proyecto en menos de 5 minutos.'"
        :next="'Siguiente'"
        :icon="true"
        :bubbleCss="'before:bottom-full before:border-[9px] before:left-1/2 before:-translate-x-1/2 before:border-transparent	before:border-b-white before:-mb-[1px]'"
        :positionCss="'top-[520px] sm:top-[416px] left-1/2 sm:-translate-x-1/2'"
        v-if="hint === 1 && projectLength === 0"
      />
      <Hint
        :header="'Encuentra todos tus proyectos'"
        :paragraph="'Cuando los crees, aquí podrás encontrarlos junto a todo su detalle'"
        :next="'Siguiente'"
        :icon="true"
        :bubbleCss="'before:right-full before:border-[9px] before:top-[37%] before:-translate-y-1/2 before:border-transparent	before:border-r-white'"
        :positionCss="'top-[128.5px] sm:top-[416px] left-[280px]'"
        v-if="hint === 2 && projectLength === 0"
      />
      <Hint
        :header="'Proyectos en ejecución'"
        :paragraph="'Revisa el análisis de restricciones y control de obras de tus proyectos.'"
        :next="'Finalizar'"
        :icon="false"
        :bubbleCss="'before:right-full before:border-[9px] before:top-[25%] before:-translate-y-1/2 before:border-transparent	before:border-r-white'"
        :positionCss="'top-[240.5px] sm:top-[416px] left-[280px]'"
        v-if="hint === 3 && projectLength === 0"
      />
      <Confirm
        :confirmHeader="''"
        :header="'Invitación a proyecto'"
        :paragraphs="[
          'El usuario lizeth.marzano@gmail.com, te ha invitado a ser parte del proyecto BLANCO',
        ]"
        :buttons="['Rechazar Proyecto', 'Aceptar Proyecto']"
        v-if="hint === 4 && projectLength === 0"
        @closeModal="closeModal"
        @confirmStatus="confirmStatus"
      />
    </div>
    <Success
      :header="successHeader"
      :buttonStr="'Ver proyecto'"
      v-if="modalName === 'success'"
      @closeModal="closeModal"
    />
    <div class="flex flex-col" v-if="status > 0 && status < 5">
      <ProjectBar :step="status" />
      <Breadcrumb :paths="['Inicio', 'Crear Proyecto']" :settingFlag="false" :class="status === 4 ? 'hidden' : 'm-1'" />
      <FirstStep :class="status === 1 ? '' : 'hidden'" ref="step1" />
      <SecondStep :class="status === 2 ? '' : 'hidden'" ref="step2" />
      <ThirdStep :class="status === 3 ? '' : 'hidden'" ref="step3" />
      <FooterStep :buttons="['Cancelar', createstatus?'Crear proyecto':'Editar proyecto']" :flag="footerFlag" :text="'*Campos obligatorios'" @cancel="cancel" @next="nextStatus" :class="status === 4 ? 'hidden' : ''"  />
    
      <div class="flex flex-col" :class="status === 4 ? '' : 'hidden'">
        <Breadcrumb :paths="['Inicio', 'Tus Proyectos']" :settingFlag="false" />
        <Indicator
          :header="'Tus proyectos'"
          :paragraph="'Acá podrás visualizar tus proyectos creados y los datos más importantes. Podrás editarlo.'"
          :buttonText="'Crear proyecto'"
          @createNewProject="createNewProject"
        />
        <div class="mb-8 border sm:border-0 border-[#D0D9F1] rounded-lg">
          <DataTable
            :tableType="'common'"
            :cols="headerCols"
            :rows="projectRows"
            class="sm:hidden"
          >
            <template v-slot="row">
              <ProjectTableRow :row="row" @openModal="openModal" @editProject="editProject" @viewProject="viewProject" />
            </template>
          </DataTable>
          <div class="sm:flex flex-col justify-center hidden">
            <!-- <SquareBox>
              <div class="flex mb-4 mt-2">
                <span class="text-base">{{ this.curprojectData.projectName }}</span>
              </div>
              <div class="flex mb-2">
                <span class="text-xs leading-5 mr-1"
                  >Fecha de inicio:
                  <span class="font-medium">12/12/21</span></span
                >
              </div>
              <div class="flex flex-col mb-2 text-xs leading-5">
                <span>Equipo:</span>
                <span
                  class="font-medium"
                  v-for="(equipment, index) in row.equipments"
                  :key="index"
                >
                  {{ equipment }}
                </span>
              </div>
              <div class="flex mb-2">
                <span class="text-xs leading-5 mr-1"
                  >Plazo: <span class="font-medium">{{this.curprojectData.term}} años</span></span
                >
              </div>
              <div class="flex mb-4">
                <span class="text-xs leading-5 mr-1"
                  >Área techada: <span class="font-medium">{{this.curprojectData.area}}</span></span
                >
              </div>
              <div class="flex mb-2 justify-end text-orange text-sm leading-4">
                <span class="mr-4 cursor-pointer">Editar</span>
                <span class="mr-4">|</span>
                <span class="cursor-pointer">Ver</span>
              </div>
            </SquareBox> -->
          </div>
        </div>
        <AdvertisingBig :width="928" :height="100" />
        <Advertising />
        <ViewProject
          v-if="modalName === 'viewproject'"
          @closeModal="closeModal"
          v-model="viewprojectData"
        />
      </div>
    </div>
  </div>
</template>

<script>
import Hint from "../../components/Hint.vue";
import Confirm from "../../components/Confirm.vue";
import Success from "../../components/Success.vue";
import Breadcrumb from "../../components/Layout/Breadcrumb.vue";
import Indicator from "../../components/Layout/Indicator.vue";
import AdvertisingBig from "../../components/Layout/AdvertisingBig.vue";
import Advertising from "../../components/Layout/Advertising.vue";
import DataTable from "../../components/DataTable.vue";
import SquareBox from "../../components/SquareBox.vue";
import ProjectTableRow from "../../components/ProjectTableRow.vue";
import ProjectBar from "../../components/ProjectBar.vue";
import FirstStep from "../../components/FirstStep.vue";
import FooterStep from "../../components/FooterStep.vue";
import SecondStep from "../../components/SecondStep.vue";
import ThirdStep from "../../components/ThirdStep.vue";
import ViewProject from '../../components/ViewProject.vue'
import store from "../../store";

export default {
  name: "project-view",
  components: {
    Hint,
    Confirm,
    Success,
    Breadcrumb,
    Indicator,
    AdvertisingBig,
    Advertising,
    DataTable,
    SquareBox,
    ProjectTableRow,
    ProjectBar,
    FirstStep,
    FooterStep,
    SecondStep,
    ThirdStep,
    ViewProject
  },
  data: function () {
    return {
      viewprojectData: {},
      modalName: "",
      footerFlag: true,
      status: 0,
      headerCols: {
        project_name: "Nombre del proyecto",
        data: "Datos",
        type: "Tipo ",
        equipment: "Equipo",
        action: "Acciones",
      },
      createstatus: true,
      projectId: null,
    };
  },
  methods: {
    openModal: function (param) {
      if (typeof param !== "string") {
        this.rowId = param.id;
        param = param.param;
      }
      this.modalName = param;
    },
    closeModal: function () {
      if (this.modalName === "") this.$store.commit("increaseHint");
      else this.modalName = "";
    },
    confirmStatus: function (payload) {
      if (!payload.param) {
        this.$store.commit("copyRestriction");
        this.successHeader = "¡Proyecto agregado con éxito!";
        this.openModal("success");
        
        store.dispatch('get_project')
        this.$store.commit("copyRestriction");
        this.status = 4
        this.$store.state.createStatus = true;
      } else {
        this.closeModal();
      }
    },
    nextStatus: function() {
      // console.log(this.status)
      if(this.createstatus == true) {
        this.status ++;
        this.status > 1 && (this.footerFlag = false);
        this.$store.state.reportstate = false;
        switch (this.status) {
          case 2:
            if(this.$refs.step1.projectName==='' || this.$refs.step1.business==='' || this.$refs.step1.projectType==='' || this.$refs.step1.district==='',
              this.$refs.step1.country==='' || this.$refs.step1.address==='') {
              alert('please insert correct data and fill all fields.')
              this.status = 1
            }
            break;
          case 3:
            this.$store.state.projectUsers = this.$refs.step2.users;
            
            break;
          case 4:
            console.log(this.$refs.step3.reports)
            const nowdate = new Date();
            const month = nowdate.getMonth()/1+1;
            const savedate = nowdate.getFullYear()+'-'+month+'-'+nowdate.getDate()+
            ' '+ nowdate.getHours()+':'+nowdate.getMinutes()+':'+nowdate.getSeconds();
            const projectData = {
              projectName: this.$refs.step1.projectName,
              business: this.$refs.step1.business,
              term: this.$refs.step1.term,
              coveredArea: this.$refs.step1.coveredArea,
              projectType: this.$refs.step1.projectType,
              district: this.$refs.step1.district,
              startDate: this.$refs.step1.startDate,
              referenceAmount: this.$refs.step1.referenceAmount,
              area: this.$refs.step1.area,
              builtArea: this.$refs.step1.builtArea,
              country: this.$refs.step1.country,
              address: this.$refs.step1.address,
              date: savedate,
              id: null,
              userInvData: this.$refs.step2.users,
              reports: this.$refs.step3.reports,
              typeFrequency:this.$refs.step3.TypeFrequency,
              usersum: ''
            };
            projectData.userInvData.forEach(user => {
              projectData.usersum+=user.userEmail+', '
            });
            store.dispatch('create_project', projectData)
            .catch((error) => {
              console.log(error)
            });
            
            store.dispatch('get_project')
            this.$store.commit("copyRestriction");
            break;
        }
      }
      else
      {
        this.status++;
        this.$store.state.reportstate = true
        switch (this.status) {
          case 1:
            break;
          case 3:
            this.$store.state.projectUsers = this.$refs.step2.users;
            console.log(this.$refs.step3.reports)
          break;
          case 4:
            const nowdate = new Date();
            const month = nowdate.getMonth()/1+1;
            const savedate = nowdate.getFullYear()+'-'+month+'-'+nowdate.getDate()+
            ' '+ nowdate.getHours()+':'+nowdate.getMinutes()+':'+nowdate.getSeconds();
            const newprojectData = {
              projectId: this.projectId,
              projectName: this.$refs.step1.projectName,
              business: this.$refs.step1.business,
              term: this.$refs.step1.term,
              coveredArea: this.$refs.step1.coveredArea,
              projectType: this.$refs.step1.projectType,
              district: this.$refs.step1.district,
              startDate: this.$refs.step1.startDate,
              referenceAmount: this.$refs.step1.referenceAmount,
              area: this.$refs.step1.area,
              builtArea: this.$refs.step1.builtArea,
              country: this.$refs.step1.country,
              address: this.$refs.step1.address,
              date: savedate,
              userInvData: this.$refs.step2.users,
              reports: this.$refs.step3.reports,
              typeFrequency:this.$refs.step3.TypeFrequency,
              usersum: ''
            }
            newprojectData.userInvData.forEach(user => {
              newprojectData.usersum+=user.userEmail+', '
            });
            store.dispatch('edit_project', newprojectData)
          
            store.dispatch('get_project')
            this.$store.commit("copyRestriction");
            break;
        }
        
      }
    },
    editProject: function(payload) {
      this.status = 1
      this.createstatus = false;
      this.projectId = payload;
      const projects = this.$store.state.projects;
      const reports = [];
      
      this.$refs.step3.reports =[]
      this.$store.state.projectUsers = []
      projects.forEach((pro) =>{
        if(pro.codProyecto == payload)
        {
            this.$refs.step1.projectName=pro.desNombreProyecto;
            this.$refs.step1.business=pro.desEmpresa;
            this.$refs.step1.term=pro.numPlazo;
            this.$refs.step1.coveredArea=pro.numAreaTechado;
            this.$refs.step1.projectType=pro.desTipoProyecto;
            this.$refs.step1.district=pro.codUbigeo;
            this.$refs.step1.startDate=pro.dayFechaInicio;
            this.$refs.step1.referenceAmount=pro.numMontoReferencial;
            this.$refs.step1.area=pro.numAreaTechada;
            this.$refs.step1.builtArea=pro.numAreaConstruida;
            this.$refs.step1.country=pro.desPais;
            this.$refs.step1.address=pro.desDireccion;
            const invusers=pro.desUsuarioCreacion.substr(0, pro.desUsuarioCreacion.length-1).split(', ');
            //
            //this.$store.state.projectUsers = invusers;
            /* const newusers = [];
            invusers.forEach((user) => {
              const temp = {
                userEmail: user,
                userRole: '',
                userArea: ''
              }
              newusers.push(temp)
            })
            this.$refs.step2.users = newusers
            this.$store.state.projectUsers = newusers */
        }
      })
      store.dispatch('get_projectuser', payload)
      .then(() => {
        const prousers = this.$store.state.currentprojectusers
        const users = []
        prousers.forEach((user) => {
          const temp = {
            userEmail: user.desCorreo,
            userRole: user.codRolIntegrante === 1?'Editor':'Visualizador',
            userArea: user.desArea
          }
          users.push(temp)
        })
        this.$refs.step2.users = users
      })
      store.dispatch('get_projectreport', payload)
      .then(() => {
        var tempstatus = false
        const tempval = {
          applyAllStatus: false,
          frequencies: [],
          frequency: null,
          massiveStatus: 0,
          reportSchedule: 'this will follow codfrecuenciaenvioreporte',
          usercreation: '',
          codfrecuenciaenvioreporte: '1'
        }
        this.$store.state.currentprojectreport.forEach((curreport) => {
          if(curreport.flagReporteMasivo === 1)
            this.$refs.step3.reports.push(curreport)
          else {
            const userF = {
              user: curreport.desCorreoEnvios,
              freq: curreport.codfrecuenciaenvioreporte
            }
            tempval.frequencies.push(userF)
            tempstatus = true
            //tempval.codfrecuenciaenvioreporte = curreport.codfrecuenciaenvioreporte
          }
        })
        if(tempstatus === true)
          this.$refs.step3.reports.push(tempval)
        console.log(this.$refs.step3.reports)
      })
      
    },
    viewProject: function(payload) {
      
      const project = this.$store.state.projects[payload-1];
      const projectInfo = {
        projectName: project.desNombreProyecto,
        business: project.desEmpresa,
        term: project.numPlazo,
        coveredArea: project.numAreaTechado,
        projectType: project.desTipoProyecto,
        district: project.codUbigeo,
        startDate: project.dayFechaInicio,
        referenceAmount: project.numMontoReferencial,
        area: project.numAreaTechada,
        builtArea: project.numAreaConstruida,
        country: project.desDireccion,
      }
      this.viewprojectData = projectInfo

    },
    cancel: function() {
      this.status = 4;
    },
    createNewProject: function() {
      this.createstatus = true;
      this.status = 1
    }
  },
  computed: {
    hint: function () {
      return this.$store.state.hint;
    },
    projectLength: function () {
      return this.$store.state.project_rows.length;
    },
    projectRows: function () {
      return this.$store.state.project_rows;
    },
  },
  mounted: function() {
    store.dispatch('get_project')
    this.$store.commit("copyRestriction");
    this.status=4
    if(this.$store.state.createStatus === true)
    {
      store.dispatch('get_project')
      this.$store.commit("copyRestriction");
      this.status=4
    }
  }
};
</script>
