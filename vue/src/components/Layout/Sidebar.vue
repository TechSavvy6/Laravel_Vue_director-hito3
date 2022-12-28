<template>
  <div class="relative">
    <div
      class="flex shrink-0 flex-col justify-between top-0 left-0 pt-[104px] h-screen bg-side sm:hidden transition-all duration-300"
      :class="openSidebar === true ? 'w-64' : 'w-0 overflow-hidden'"
    >
      <div>
        <h1 class="text-xl mb-6 px-8">Tus aplicaciones</h1>
        <ul>
          <li
            v-for="route in routes"
            :key="route.id"
            class="cursor-pointer py-4 relative px-8"
            :class="{
              'z-30 bg-side':
                (hint === 2 && route.id === 'start') ||
                (hint === 3 && route.id === 'execution'),
            }"
          >
            <a
              class="flex items-center justify-between"
              @click="handleClick(route.id)"
            >
              <span class="flex items-center">
                <img
                  v-if="route.img"
                  :src="'../../assets/images/icons/' + route.img + '.svg'"
                  alt=""
                />
                <span class="px-2">{{ route.label }}</span>
              </span>
              <img
                src="../../assets/images/icons/arrow-up.svg"
                class="justify-items-center flex transition"
                :class="{
                  'rotate-180': route.isOpen,
                  'rotate-0': !route.isOpen,
                }"
                v-if="route.childs"
                alt=""
              />
            </a>
            <ul
              class="border-l border-l-[#8A9CC9] ml-7 mt-4"
              v-if="route.childs && route.isOpen"
            >
              <li
                v-for="child in route.childs"
                :key="child.id"
                class="font-medium text-xs leading-5 cursor-pointer pl-4 mb-3 last:mb-0 -ml-0.5"
                :class="{
                  'text-activeText before:border-l-[2px] before:border-l-[#EB5D00] before:absolute before:-ml-[15.5px] before:h-4 before:rounded':
                    child.path === currentPath,
                  'text-inactiveText': child.path !== currentPath,
                }"
                @click="handleRedirect(child.path)"
              >
                {{ child.label }}
              </li>
            </ul>
          </li>
        </ul>
      </div>
      <div
        class="relative flex items-center justify-end px-8 bottom-0 h-[56px] border-t border-t-[#D0D9F1]"
        @click="$emit('toggleSidebar')"
      >
        <img
          src="../../assets/images/icons/arrow-left.svg"
          alt=""
          class="justify-items-center"
        />
        <span class="text-sm ml-2 text-[#002B6B]">Ocultar</span>
      </div>
    </div>
    <div
      class="absolute -right-10 h-14 w-12 bottom-0 flex bg-side rounded-r sm:hidden"
      :class="openSidebar === false ? '' : 'hidden'"
      @click="$emit('toggleSidebar')"
    >
      <img
        src="../../assets/images/icons/arrow-left.svg"
        alt=""
        class="rotate-180"
      />
    </div>
  </div>
</template>

<script>
export default {
  name: "sidebar-component",
  props: {
    openSidebar: Boolean,
  },
  data: function () {
    return {
      routes: [
        {
          id: "start",
          label: "Inicio",
          path: "/start",
          img: "home",
          isOpen: false,
          childs: [
            {
              id: "create_project",
              label: "Tus proyectos",
              path: "/start/create_project",
            },
          ],
        },
        {
          id: "execution",
          label: "Ejecución",
          path: "/execution",
          img: "execution",
          isOpen: false,
          childs: [
            {
              id: "restrictions_analysis",
              label: "Analisis de restricciones",
              path: "/execution/restrictions_analysis",
            },
            {
              id: "graphic_advance",
              label: "Avance gráfico",
              path: "/execution/graphic_advance",
            },
          ],
        },
        {
          id: "planning",
          label: "Planificación",
          path: "/planning",
        },
        {
          id: "control",
          label: "Control",
          path: "/control",
        },
        {
          id: "closing",
          label: "Cierre",
          path: "/closing",
        },
      ],
    };
  },
  methods: {
    handleRedirect(path) {
      this.$router.push(path);
    },
    handleClick(id) {
      this.routes.map((item) => {
        if (item.id === id) {
          item.isOpen = !item.isOpen;
        }
      });
    },
    openSide: function () {
      const curHint = this.$store.state.hint;
      curHint < 4 && (this.routes[0].isOpen = true);
      curHint === 3 && (this.routes[1].isOpen = true);
    },
  },
  computed: {
    currentPath() {
      return this.$route.path;
    },
    hint: function () {
      return this.$store.state.hint;
    },
  },
  mounted: function () {
    this.openSide();
  },
  updated: function () {
    this.openSide();
  },
};
</script>
