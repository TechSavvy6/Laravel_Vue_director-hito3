import { createApp } from 'vue'
import store from './store'
import router from './router'
import './index.css'
import 'v-calendar/dist/style.css';
import App from './App.vue'
import VCalendar from "v-calendar";

createApp(App)
  .use(store)
  .use(VCalendar,{})
  .use(router)
  .mount('#app')
