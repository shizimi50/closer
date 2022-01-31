<template>
  <div class="tw-flex tw-items-center">
    <svg
      v-if="!checked"
      class="tw-h-5 tw-w-5 tw-text-gray-300 tw-mr-1"
      width="24"
      height="24"
      viewBox="0 0 24 24"
      stroke-width="2"
      stroke="currentColor"
      fill="none"
      stroke-linecap="round"
      stroke-linejoin="round"
    >
      <path stroke="none" d="M0 0h24v24H0z" />
      <circle cx="12" cy="12" r="9" />
    </svg>
    <svg
      v-if="checked"
      class="tw-h-5 tw-w-5 tw-text-red-500 tw-mr-1"
      width="24"
      height="24"
      viewBox="0 0 24 24"
      stroke-width="2"
      stroke="currentColor"
      fill="none"
      stroke-linecap="round"
      stroke-linejoin="round"
    >
      <path stroke="none" d="M0 0h24v24H0z" />
      <circle cx="12" cy="12" r="3" fill="currentColor" />
      <circle cx="12" cy="12" r="9" />
    </svg>
    {{ label }}
  </div>
</template>
<script lang="ts">
import { defineComponent } from 'vue';

export default defineComponent({
  name: 'MyRadioButton',
  props: {
    label: {
      type: String,
      required: true,
    },
    checked: {
      type: Boolean,
      required: false,
      default: false,
    },
  },
});
</script>
