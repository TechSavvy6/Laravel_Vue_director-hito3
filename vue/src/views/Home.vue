<template>
  <div>Home aqui tenemos algo que mostrarsa</div>
  <slot></slot>
</template>

<script setup>
import { computed, ref } from "vue";
import { useRoute } from "vue-router";
import { useStore } from "vuex";

const route = useRoute();
const store = useStore();
if (window.localStorage) {
  
  if (!localStorage.getItem('reload')) {
      localStorage['reload'] = true;
      window.location.reload();
  } else {
      localStorage.removeItem('reload');
  }
}
/* store.dispatch('get_project')
.catch((error) => {
  console.log(error)
}); */
</script>
