<template>
  <button class="tw-w-full tw-text-center tw-py-3 tw-px-4 tw-border tw-border-gray-200 tw-flex tw-items-center tw-justify-center">
    <img :src="googleIconImg" alt="google-icon" class="tw-w-4 tw-h-4 tw-mr-2" />
    Googleアカウントで登録
  </button>
</template>
<script lang="ts">
import { defineComponent } from 'vue';
import googleIconImg from '../assets/images/google_icon.svg';

export default defineComponent({
  name: 'GoogleLoginButton',
  setup() {
    return { googleIconImg };
  },
});
</script>
