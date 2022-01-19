<template>
  <select
    v-model="selected"
    name=""
    id=""
    @change="updateValue()"
    class="
      tw-w-full tw-rounded-full tw-shadow-lg tw-bg-secondary
      tw-focus:border-indigo-500
      tw-text-base tw-outline-none tw-text-gray-700 tw-py-3 tw-px-5 tw-leading-8 tw-transition-colors tw-duration-200 tw-ease-in-out
    "
  >
    <option v-for="option in options" :key="option.value" :value="option.label">{{ option.label }}</option>
  </select>
</template>
<script lang="ts">
import { defineComponent, PropType } from 'vue';
import SelectOption from '../../models/componentProps/SelectOption';

export default defineComponent({
  name: 'MySelect',
  props: {
    modelValue: {
      type: String,
      required: true,
    },
    options: {
      type: Array as PropType<SelectOption[]>,
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
      this.$emit('update:modelValue', this.selected);
    },
  },
});
</script>
