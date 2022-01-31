<template>
  <div class="tw-flex tw-items-center" @click="updateValue()">
    <svg
      v-if="selected.indexOf(value) < 0"
      class="tw-h-6 tw-w-6 tw-text-gray-500 tw-mr-2"
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
      <rect x="4" y="4" width="16" height="16" rx="2" />
    </svg>
    <svg
      v-if="selected.indexOf(value) >= 0"
      class="tw-h-6 tw-w-6 tw-text-red-500 tw-mr-2"
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
      <rect x="4" y="4" width="16" height="16" rx="2" />
      <path d="M9 12l2 2l4 -4" />
    </svg>
    {{ label }}
  </div>
</template>
<script lang="ts">
import { defineComponent } from 'vue';

export default defineComponent({
  name: 'MyCheckbox',
  props: {
    label: {
      type: String,
      required: true,
    },
    modelValue: {
      type: Array,
      required: true,
    },
    value: {
      type: String,
      required: true,
    },
  },
  data() {
    return {
      selected: this.modelValue,
    };
  },
  methods: {
    updateValue: function () {
      if (this.value) {
        if (this.selected.indexOf(this.value) >= 0) {
          this.selected.splice(this.selected.indexOf(this.value), 1);
        } else {
          this.selected.push(this.value);
        }
        this.$emit('update:modelValue', this.selected);
      }
    },
  },
});
</script>
