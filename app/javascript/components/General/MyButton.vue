<template>
  <button class="tw-text-center tw-py-2 tw-px-4 tw-rounded-full" :class="buttonStyle">{{ text }}</button>
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
    category: {
      type: String,
      required: false,
      default: 'primary',
    },
    disabled: {
      type: Boolean,
      required: false,
      default: false,
    },
  },
  computed: {
    buttonStyle(): string {
      switch (this.category) {
        case 'primary':
          return 'tw-bg-primary tw-text-white';
        case 'secondary':
          return 'tw-bg-secondary';
        case 'danger':
          return 'tw-bg-red-500 tw-text-white';
      }
    },
  },
});
</script>
