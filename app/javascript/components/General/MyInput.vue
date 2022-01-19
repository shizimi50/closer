<template>
  <div class="flc-input">
    <label class="tw-leading-7 tw-text-sm tw-text-gray-600">{{ label }}</label>
    <input
      :id="id"
      :name="id"
      :type="type"
      :value="modelValue"
      :placeholder="placeholder"
      @input="updateValue"
      class="
        tw-w-full tw-bg-white tw-rounded tw-border
        border-gray-300
        tw-focus:border-indigo-500
        focus:ring-2 focus:ring-indigo-200
        tw-text-base tw-outline-none tw-text-gray-700 tw-py-1 tw-px-3 tw-leading-8 tw-transition-colors tw-duration-200 tw-ease-in-out
      "
    />
  </div>
</template>
<script lang="ts">
import { defineComponent } from 'vue';
export default defineComponent({
  name: 'MyInput',
  props: {
    type: {
      type: String,
      required: false,
    },
    id: {
      type: String,
      required: true,
    },
    modelValue: {
      type: String,
      required: true,
    },
    label: {
      type: String,
      required: true,
    },
    placeholder: {
      type: String,
      required: false,
      default: '',
    },
  },
  methods: {
    updateValue: function (event: Event) {
      const target = event.target as HTMLInputElement;
      if (target) {
        this.$emit('update:modelValue', target.value);
      }
    },
  },
});
</script>
