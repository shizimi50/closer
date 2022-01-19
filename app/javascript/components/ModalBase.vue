<template>
  <div v-if="isVisible" class="modal-base tw-flex tw-items-center tw-w-full tw-h-screen tw-fixed tw-top-0 tw-z-50">
    <div class="tw-w-full tw-bg-black tw-h-full tw-opacity-50 tw-fixed tw-top-0 tw-left-0 tw-z-10"></div>
    <div class="tw-w-11/12 tw-py-10 tw-px-5 tw-mx-auto tw-bg-white tw-z-50 tw-rounded-2xl tw-relative" :class="{ highlight: isHighlighted }">
      <slot />
      <svg
        v-if="isCloseButtonVisible"
        @click="close()"
        class="tw-h-6 tw-w-6 tw-text-gray-500 tw-absolute tw-top-4 tw-right-4"
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
        <line x1="18" y1="6" x2="6" y2="18" />
        <line x1="6" y1="6" x2="18" y2="18" />
      </svg>
    </div>
  </div>
</template>
<script lang="ts">
import { defineComponent } from 'vue';

export default defineComponent({
  name: 'ModalBase',
  props: {
    isVisible: {
      type: Boolean,
      required: true,
      default: false,
    },
    isHighlighted: {
      type: Boolean,
      required: false,
      default: false,
    },
    isCloseButtonVisible: {
      type: Boolean,
      required: false,
      default: false,
    },
  },
  methods: {
    close: function () {
      this.$emit('close');
    },
  },
});
</script>

<style scoped>
.modal-base {
  max-width: 380px;
  margin: 0 auto;
}
.highlight {
  background-image: url(/src/assets/images/modal-bg.svg);
  background-size: 90%;
  background-repeat: no-repeat;
  background-position-y: -100px;
  background-position-x: -100px;
}
</style>
