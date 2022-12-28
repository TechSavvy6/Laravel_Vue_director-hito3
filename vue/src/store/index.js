import { forEach } from "lodash";
import { createStore } from "vuex";
import axiosClient from "../axios";

const store = createStore({
  state: {
    hint: 1,
    menu: false,
    count: 1,
    reportstate: false,
    project_rows: [],
    registerData: {
      firstName: '',
      lastName: '',
      phoneNumber: '',
      companyName: '',
      position: '',
      businessMail: '',
      plan: 'free',
      payType: '',
      cardInfo: {
        cardHolder: '',
        cardNumber: '',
        expireDate: '',
        cvc: '',
      }
    },
    restriction_rows: [
      {
        id: 1,
        data: true,
        projectName: "Proyecto Blanco",
        restriction: {
          delayed: 20,
          notDelayed: 55,
        },
        equipments: ["Lizeth Marzano"],
        users: [
          "lizeth.marzano-1@gmail.com",
          "sandra-gomez-1@gmail.com",
          "carla-gomez-1@gmail.com",
        ],
      },
      {
        id: 2,
        data: false,
        projectName: "Proyecto Negro",
        restriction: {
          delayed: 60,
          notDelayed: 40,
        },
        equipments: ["Lizeth Marzano", "Sandra Gomez"],
        users: [
          "lizeth.marzano-2@gmail.com",
          "sandra-gomez-2@gmail.com",
          "carla-gomez-2@gmail.com",
        ],
      },
    ],

//  get restriction_rows id ->
    user: {
      data: {},
      token: sessionStorage.getItem("TOKEN"),
    },
    projects: [],
    codProyecto: '',
    projectUsers: [],
    currentprojectreport: [],
    currentprojectusers: [],
    selectedusers: [],
    whiteproject_rows:[],
    createStatus: false,
    cargos:[],
    infoPerson:{
      img:'https://images.unsplash.com/photo-1597589022928-bb4002c099ec',
      data_save:{
        id:"",
        celular:"",
        name: "",
        email: "",
        lastname:"",
        nombreempresa:"",
        codcargo:0
      },
      data:[
        {
        "celular":"11111",
        "codCargo":null,
        "created_at":"2022-11-24T20:50:32.000000Z",
        "email":"diego@gmail.com",
        "email_verified_at":null,
        "id":9,
        "lastname":"warthon",
        "name":"diego",
        "nombreempresa":"sodimac",
        "updated_at":"2022-11-24T20:50:32.000000Z"
      },

      {
        "celular":"11111",
        "codCargo":null,
        "created_at":"2022-11-24T20:50:32.000000Z",
        "email":"diego@gmail.com",
        "email_verified_at":null,
        "id":9,
        "lastname":"warthon",
        "name":"diego",
        "nombreempresa":"sodimac",
        "updated_at":"2022-11-24T20:50:32.000000Z"
      },


      ]
    },
    Restrictionlist:[],
    Restrictionlist_P:[]
  },
  getters: {
    users: (state) => (id) => {
      const row = state.restriction_rows.find((row) => row.id === id);
      if (typeof row === "undefined") return [];
      return row.users;
    },
    addRestriction:(state) => (items) => {
      state.Restrictionlist = items; 
    },
    addRestriction_P:(state) => (items) => {
      if(items === 0) {
        state.Restrictionlist_P = state.Restrictionlist_P;
      }
      state.Restrictionlist_P = items; 
    },
    data: (state) => (id) => {
      const row = state.restriction_rows.find((row) => row.id === id);
      if (typeof row === "undefined") return false;
      return row.data;
    },
    tableData: (state) => (payload) => {
      const row = state.whiteproject_rows.find((row) => row.id === payload.id);
      if (typeof row === "undefined") return [];
      const item = row.info.find((item) => item.id === payload.phaseId);
      if (typeof item === "undefined") return [];
      return item.tableData;
    },
    getWhiteprojectRows: (state) => {
      return state.whiteproject_rows;
    },
    hideCols: (state) => (payload) => {
      const row = state.whiteproject_rows.find((row) => row.id === payload.id);
      if (typeof row === "undefined") return [];
      const item = row.info.find((item) => item.id === payload.phaseId);
      if (typeof item === "undefined") return [];
      return item.hideCols;
    },
  },
  actions: { 
    get_cargos({commit}) {
      return axiosClient.get('/get_cargos')
      .then(res => {
        commit('setCargos', res.data)
        // console.log(res);
        // return res.data
        // commit('setUser', res.data)
      })
    },
    get_infoPerson({commit}) {
      const id = {
        id: sessionStorage.getItem('Id')
      }
      this.state.restriction_rows = []
      return axiosClient.post('/info_person', id)
      .then(res => {
        commit('setInfoPerson', res.data)
      })
    },

    register({commit}, user) {
      return axiosClient.post('/register', user)
        .then(({data}) => {
          commit('setUser', data.user);
          commit('setToken', data.token)
          console.log(data)
          return data;
        })
    },
    login({commit}, user) {
      return axiosClient.post('/login', user)
        .then(({data}) => {
          commit('setUser', data.user);
          commit('setToken', data.token)
          return data;
        })
    },
    create_project({commit}, projectData) {
      projectData.id = sessionStorage.getItem('Id');
      return axiosClient.post('/create_project', projectData)
      .then(({data}) => {
        this.state.codProyecto = data
        console.log(this.state.codProyecto)
        return data
      })
    },
    edit_project({commit}, newprojectData) {
      return axiosClient.post('/edit_project', newprojectData)
      .then(res => {
        console.log(res.data)
        return res.data
      })
    },
    logout({commit}) {
      return axiosClient.post('/logout')
        .then(response => {
          commit('logout')
          return response;
        })
    },
    getUser({commit}) {
      return axiosClient.get('/user')
      .then(res => {
        console.log(res);
        commit('setUser', res.data)
      })
    },
    get_project({commit}) {
      const id = {
        id: sessionStorage.getItem('Id')
      }
      this.state.restriction_rows = []
      return axiosClient.post('/get_project', id)
      .then(res => {
        commit('setProject', res.data)
        this.state.projects.forEach (pro => {
          commit('copyProjectFromDB', pro)
        })
      })
    },
    get_projectreport({commit}, projectId) {
      const projectreq = {
        projectId: projectId
      }
      return axiosClient.post('/get_projectreport', projectreq)
      .then(res => {
        commit('setCurrentReport', res.data)
      })
    },
    get_projectuser({commit}, projectId) {
      const projectreq = {
        projectId: projectId
      }
      return axiosClient.post('/get_projectuser', projectreq)
      .then(res => {
        //console.log(res.data)
        commit('setCurrentUsers', res.data)
      })
    },
    update_member({commit}, restriction) {
      const updateRes = {
        projectId: restriction.projectId,
        users: restriction.equipments,
        date: restriction.date,
      }
      return axiosClient.post('/update_member', updateRes)
      .then(res => {
        console.log(res.data)
      })
    },
    add_front({commit}, frontdata) {
      const nowdate = new Date();
      const month = nowdate.getMonth()/1+1;
      const savedate = nowdate.getFullYear()+'-'+month+'-'+nowdate.getDate()+
      ' '+ nowdate.getHours()+':'+nowdate.getMinutes()+':'+nowdate.getSeconds();
      const savedata = {
        name: frontdata.frontName,
        id: sessionStorage.getItem('constraintid'),
        date: savedate
      }
      return axiosClient.post('/add_front', savedata)
      .then(res => {
        console.log(res.data);
      })
    },
    add_phase({commit}, phasedata) {
      const nowdate = new Date();
      const month = nowdate.getMonth()/1+1;
      const savedate = nowdate.getFullYear()+'-'+month+'-'+nowdate.getDate()+
      ' '+ nowdate.getHours()+':'+nowdate.getMinutes()+':'+nowdate.getSeconds();
      const savedata = {
        name: phasedata.phaseName,
        frontid: phasedata.frontId,
        projectid: sessionStorage.getItem('constraintid'),
        date: savedate
      }
      return axiosClient.post('/add_phase', savedata)
      .then(res => {
        console.log(res.data)
      })
    },
    add_Actividad({commit}, data) {
      const nowdate = new Date();
      const month = nowdate.getMonth()/1+1;
      const savedate = nowdate.getFullYear()+'-'+month+'-'+nowdate.getDate()+
      ' '+ nowdate.getHours()+':'+nowdate.getMinutes()+':'+nowdate.getSeconds();
      const savedata = {
        name: data.actividadName,
        frontid: data.frontId,
        phaseid: data.phaseId,
        projectid: sessionStorage.getItem('constraintid'),
        date: savedate
      } 
      return axiosClient.post('/add_Actividad', savedata)
      .then(res => {
        console.log(res.data)
      })
    },
    Set_Restriction({commit}, data) { 
      const num = data.length;
      const setData = {
        index: num,
        data: data
      }
      return axiosClient.post('/add_restriction', setData)
      .then(res => {
        commit('Set_Restriction', res.data)
      })
    },
    get_front({commit}){ 
      const anaresdata = { id: sessionStorage.getItem('constraintid') }
      // const anaresdata = 107;
      return axiosClient.post('get_front', anaresdata)
        .then(res => {
          console.log(res.data);
        commit('setAnaResData', res.data)
      })
    },
    delete_font({commit}, data){
      const anaresdata = { id: sessionStorage.getItem('constraintid') }
      const deleteData = {
        frontId : data.frontId,
        phaseId : data.phaseId,
        phaseLen : data.phaseLen,
        id: anaresdata
      }
      return axiosClient.post('delete_front', deleteData)
        .then(res => { 
          console.log(res.data);
        commit('deleteFront', data)
      })
    },
    get_Restriction_P({commit}){  
      return axiosClient.get('get_restriction_p')
      .then(res => {
        commit('Set_Restriction', res.data)
        
      })
    }
  },
  mutations: {

    increment(state) {
      state.count++;
    },
    increaseHint(state) {
      state.hint++;
      state.menu = true;
      state.hint >= 4 && (state.menu = false);
    },
    toggleMenu(state) {
      state.menu = !state.menu;
    },
    toggleData(state, payload) {
      state.restriction_rows.find((row) => row.id === payload.id).data =
        !state.restriction_rows.find((row) => row.id === payload.id).data;
    },
    addUser(state, payload) {
      state.restriction_rows
        .find((row) => row.id === payload.id)
        .users.push(payload.email);
      return "ok";
    },
    editUser(state, payload) {
      state.restriction_rows.find((row) => row.id === payload.id).users =
        payload.users;
    },
    deleteUser(state, payload) {
      const users = state.restriction_rows.find(
        (row) => row.id === payload.id
      ).users;
      var ind;
      for (var i = 0; i < users.length; i++) {
        if (users[i] === payload.email) {
          ind = i;
        }
      }
      users.splice(ind, 1);
    },
    setFilterColumn(state, payload) {
      var tempAry = ['date_required', 'responsible', 'responsible_area', 'condition', 'applicant'];
      var ind = tempAry.indexOf(payload.filterId);
      if (ind > -1) {
        tempAry.splice(ind, 1);
        const rows = state.whiteproject_rows;
        for (var i = 0; i < rows.length; i ++) {
          for (var j = 0; j < rows[i].info.length; j ++) {
            // console.log(rows[i].info[j])
            rows[i].info[j]['hideCols'] = tempAry;
          }
        }
      }
    },
    setHideCols(state, payload) {
      state.whiteproject_rows
        .find((row) => row.id === payload.frontId)
        .info.find((item) => item.id === payload.phaseId).hideCols =
        payload.hideCols;
    },
    addFront(state, payload) {
      //const id = Math.round(Math.random() * 10000);
      if (payload.frontId === '') {
        const temp = {
          id: state.whiteproject_rows.length+1,
          name: payload.frontName,
          isOpen: false,
          info: [],
        };
        state.whiteproject_rows.push(temp);
      } else {
        
        const row = state.whiteproject_rows.find((row) => row.id === payload.frontId);
        const temp = {
          id: row.info.length+1,
          name: payload.phaseName,
          notDelayed: 0,
          delayed: 0,
          tableData: [
            {
              exercise: "Lorem ipsum dolor sit amet, consectetu...",
              restriction: "Lorem ipsum dolor sit amet, consectetu...",
              date_required: "23/07/2020",
              responsible: "Lizeth Marzano",
              responsible_area: "Arquitectura",
              applicant: "Lizeth Marzano",
            },
          ],
          hideCols: [],
        };
        row.info.push(temp);
      }
    },
    deleteFront(state, payload) {
      if (payload.phaseLen === 0 || payload.phaseId === 'all') {
        const rowIndex = state.whiteproject_rows.findIndex((row) => row.id === payload.frontId);
        state.whiteproject_rows.splice(rowIndex, 1);
      } else {
        const row = state.whiteproject_rows.find((row) => row.id === payload.frontId);
        const itemIndex = row.info.findIndex((item) => item.id === payload.phaseId);
        row.info.splice(itemIndex, 1);
      }
    },
    addScrollTableRow(state, payload) {
      const nowdate = new Date();
      const month = nowdate.getMonth()/1+1;
      const row = state.whiteproject_rows.find((row) => row.id === payload.frontId).info.find((item) => item.id === payload.phaseId);
      const savedate = nowdate.getFullYear()+'-'+month+'-'+nowdate.getDate()+
      ' '+ nowdate.getHours()+':'+nowdate.getMinutes()+':'+nowdate.getSeconds();
      const temp = {
        exercise: payload.exercise,
        restriction: "restriction",
        date_required: savedate,
        responsible: "veremos",
        responsible_area: "Arquitectura",
        applicant: "Lizeth Marzano",
      };
      row.tableData.push(temp);
    },
    delScrollTableRow(state, payload) {
      const rows = state.whiteproject_rows.find((row) => row.id === payload.frontId).info.find((item) => item.id === payload.phaseId).tableData;
      var ind = '';
      for (var i = 0; i < rows.length; i ++) {
        if (rows[i]['exercise'] === payload.exercise) {
          ind = i;
        }
      }
      if (ind !== '')
        rows.splice(ind, 1);
    },
    duplicateScrollTableRow(state, payload) {
      const rows = state.whiteproject_rows.find((row) => row.id === payload.frontId).info.find((item) => item.id === payload.phaseId).tableData;
      var ind = '';
      for (var i = 0; i < rows.length; i ++) {
        if (rows[i]['exercise'] === payload.exercise) {
          ind = i;
        }
      }
      if (ind !== '')
        rows.push(rows[ind]);
    },
    updateRegisterData(state, payload) {
      state.registerData[payload.attr] = payload.value;
    },
    updateRegisterDataCardInfo(state, payload) {
      state.registerData.cardInfo[payload.attr] = payload.value;
    },
    logout: (state) => {
      state.user.token = null;
      state.user.data = {};
      sessionStorage.removeItem("TOKEN");
    },
    setUser: (state, user) => {
      state.user.data = user;
      sessionStorage.setItem('Id', user.id);
    },
    setToken: (state, token) => {
      state.user.token = token;
      sessionStorage.setItem('TOKEN', token);
    },
    setProject: (state, project) => {
      state.projects = project;
    },
    setCargos: (state, cargos) => {
      state.cargos = cargos;
    },
    setInfoPerson: (state, infoperson) => {
       state.infoPerson.data = infoperson;
       state.infoPerson.data_save.name = infoperson[0].name
      // state.infoPerson.push(infoperson);
    },
    copyRestriction(state) {
      console.log(state.restriction_rows)
      state.project_rows = state.restriction_rows;
    },
    notify: (state, {message, type}) => {
      state.notification.show = true;
      state.notification.type = type;
      state.notification.message = message;
      setTimeout(() => {
        state.notification.show = false;
      }, 3000)
    },
    /* copyProjectData(state, projectData) {
      const tempProject = {
        id: state.restriction_rows.length+1,
        data: true,
        projectName: projectData.projectName,
        restriction: {
          delayed: 60,
          notDelayed: 40,
        },
        equipments: [],
        users: projectData.userInvData,
      }
      projectData.userInvData.forEach(user => {
        tempProject.equipments.push(user.userEmail)
      });
      state.restriction_rows.push(tempProject)
    }, */
    copyProjectFromDB(state, projectData) {
      const tempProject = {
        id: state.restriction_rows.length+1,
        projectId: projectData.codProyecto,
        data: projectData.desTipoProyecto === 'Abierto' ? true:false,
        projectName: projectData.desNombreProyecto,
        restriction: {
          delayed: 60,
          notDelayed: 40,
        },
        equipments: [],
        users: [],
        date: projectData.dayFechaCreacion
      }
      const struser = projectData.desUsuarioCreacion;
      //tempProject.equipments = struser.substr(0, struser.length-1).split(', ');
      tempProject.users = struser.substr(0, struser.length-1).split(', ');
      state.restriction_rows.push(tempProject)
    },
    setCurrentReport(state, ReportData) {
      state.currentprojectreport = ReportData
      console.log(state.currentprojectreport)
    },
    setCurrentUsers(state, ReportData) {
      state.currentprojectusers = ReportData
    },
    setAnaResData(state, ResData) {
      state.whiteproject_rows = ResData
    },
    Set_Restriction(state, ResData) { 
      state.Restrictionlist_P = ResData; 
      ResData.map( (i) => {
        state.Restrictionlist.push({value: i.desTipoRestricciones})
      })
    },
  },
  modules: {},
});

export default store;
