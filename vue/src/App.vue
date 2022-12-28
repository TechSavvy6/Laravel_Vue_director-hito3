<!-- <script setup>
// This starter template is using Vue 3 <script setup> SFCs
// Check out https://v3.vuejs.org/api/sfc-script-setup.html#sfc-script-setup
</script> -->

<!-- <template>
  <router-view :key="$route.path"></router-view>
</template> -->

<!-- <style>
</style>  -->

<template>
  <div id="app" class="tracking-tight font-semibold text-activeText">
    <div v-if="layout === 'home'">
      <Header />
      <MobileMenu v-if="menu" />
      <div class="flex" :class="{ 'sm:hidden': menu }">
        <Sidebar :openSidebar="openSidebar" @toggleSidebar="toggleSidebar" />
        <div
          class="h-screen pt-16 sm:w-full sm:pt-14 sm:bg-[#F6F8FE]"
          :class="openSidebar ? 'w-content' : 'w-full'"
        >
          <div class="h-full px-16 sm:px-8 py-8 overflow-y-auto">
            <router-view />
          </div>
        </div>
      </div>
    </div>
    <div v-else-if="layout === 'register'">
      <RegisterBar />
      <div
        class="flex pt-36 sm:pt-40 sm:pt-10 sm:pb-12 sm:px-8 sm:bg-[#F6F8FE] justify-center"
      >
        <router-view />
      </div>
    </div>
    <div v-else-if="layout === 'login'">
      <!-- <Header /> -->
      <!-- <Sidebar :openSidebar="openSidebar" @toggleSidebar="toggleSidebar" /> -->
      <!-- <RegisterBar /> -->
      <div
        class="flex pt-36 sm:pt-40 sm:pt-10 sm:pb-12 sm:px-8 sm:bg-[#F6F8FE] justify-center"
      >
        <router-view />
      </div>
    </div>
    <div v-else-if="layout === 'success-register'">
      <router-view />
    </div>
  </div>
</template>

<script>
import RegisterBar from "./components/RegisterBar.vue";
import Header from "./components/Layout/Header.vue";
import Sidebar from "./components/Layout/Sidebar.vue";
import MobileMenu from "./components/Layout/MobileMenu.vue";
export default {
  components: {
    RegisterBar,
    Header,
    Sidebar,
    MobileMenu,
  },
  data: function () {
    return {
      openSidebar: true,
    };
  },
  methods: {
    toggleSidebar: function () {
      this.openSidebar = !this.openSidebar;
    },
    handleResize: function() {
      window.innerWidth <= 1000 && (this.openSidebar = false);
      window.innerWidth > 1000 && (this.openSidebar = true);
    }
  },
  computed: {
    layout: function () {
      return this.$route.meta.layout;
    },
    menu: function () {
      return this.$store.state.menu;
    },
  },
  mounted: function() {
    window.addEventListener('resize', this.handleResize);
    this.handleResize();
  },
};
</script>
