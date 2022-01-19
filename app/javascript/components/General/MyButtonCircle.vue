<template>
  <button class="tw-rounded-full tw-w-14 tw-h-14 tw-flex tw-items-center tw-justify-center tw-text-base" :class="buttonStyle">{{ text }}</button>
</template>
<script lang="ts">
import { defineComponent } from 'vue';

export default defineComponent({
  name: 'MyButtonCircle',
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
      }
    },
  },
});
</script>
