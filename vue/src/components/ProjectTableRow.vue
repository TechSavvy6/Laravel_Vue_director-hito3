<template>
  <tr>
    <td>{{ row.projectName }}</td>
    <td>{{ row.data ? `Abierto` : `Cerrado` }}</td>
    <td>{{ row.data ? `Abierto` : `Cerrado` }}</td>
    <td>
      <span class="flex flex-col">
        <span v-for="(equipment, index) in row.users" :key="index">{{
          equipment
        }}</span>
      </span>
    </td>
    <td>
      <span class="flex flex-col text-xs text-orange">
        <span class="cursor-pointer" @click="$emit('editProject', row.projectId)">Editar</span>
        <span class="cursor-pointer" @click="$emit('viewProject', row.id); openModal({param: 'viewproject', id: row.id})">Ver</span>
      </span>
    </td>
  </tr>
</template>

<script>
export default {
  name: "project-table-row-component",
  props: {
    row: Object,
  },
  methods: {
    handleClick: function () {
    },
    openModal: function(payload) {
      this.$emit('openModal', {param: payload.param, id: payload.id});
    },
  },
};
</script>
