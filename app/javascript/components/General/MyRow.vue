<template>
  <div class="tw-text-center tw-border-b tw-border-gray-100 tw-p-3">{{ text }}</div>
</template>
<script lang="ts">
import { defineComponent } from 'vue';

export default defineComponent({
  name: 'MyButton',
  props: {
    text: {
      type: String,
      required: true,
    },
  },
});
</script>
