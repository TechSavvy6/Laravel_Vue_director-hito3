<template>
  <div>
    Graphic
    <h1>{{ count }}</h1>
    <button @click="plus">asdf</button>
  </div>
</template>

<script>
export default {
  name: "graphic-view",
  methods: {
    plus: function() {
      this.$store.commit({
        type: 'increment',
      });
    }
  },
  computed: {
    count: function () {
      return this.$store.state.count;
    }
  },
};
</script>
