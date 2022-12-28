module.exports = {
  content: ["./index.html", "./src/**/*.{vue,js,ts,jsx,tsx}"],
  theme: {
    extend: {
      height: {
        14: "3.5rem",
      },
      width: {
        'content': 'calc(100% - 256px)'
      },
      colors: {
        main: "#002B6B",
        orange: "#EB5D00",
        side: "#E5EBFB",
        activeText: "#212530",
        inactiveText: "#616E8E",
      },
      boxShadow: {
        'tooltip': '0px 4px 16px rgba(23, 71, 194, 0.18)',
        'hint': '0px 8px 24px rgba(96, 120, 184, 0.12)',
      },
      content: {
        'pointsActive': 'url(assets/images/icons/points-active.svg)',
        'addActive': 'url(assets/images/icons/tooltip-person-add-active.svg)',
        'editActive': 'url(assets/images/icons/tooltip-edit-active.svg)',
        'deleteActive': 'url(src/assets/images/icons/tooltip-delete-active.svg)',
        'delete': 'url(assets/images/icons/tooltip-delete.svg)',
        'phoneLogo': 'url(assets/images/phone-logo.png)',
        'phoneBell': 'url(assets/images/icons/phone-bell.svg)',
        'phoneSearch': 'url(assets/images/icons/phone-search.svg)',
        'phoneMenu': 'url(assets/images/icons/phone-menu.svg)',
      },
      screens: {
        'sm': {'max': '750px'},
      }
    },
  },
  plugins: [require("@tailwindcss/forms")],
};
