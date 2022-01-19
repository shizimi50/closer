<template>
  <div class="tw-text-left">
    <label class="tw-text-gray-800 tw-text-xs">{{ label }}</label>
    <div class="tw-mt-2">
      <slot />
    </div>
  </div>
</template>
<script lang="ts">
import { defineComponent } from 'vue';

export default defineComponent({
  name: 'MyFormGroup',
  props: {
    label: {
      type: String,
      required: true,
    },
  },
});
</script>
