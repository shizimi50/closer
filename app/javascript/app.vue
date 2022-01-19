<template>
  <div id="app">
    <p>{{ message }}</p>
  </div>
</template>

<script lang="ts">
export default {
  data: function () {
    return {
      message: "Hello Vue! テスト・テスト",
    };
  },
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
