<template>
  <button
    class="tw-w-full tw-text-center tw-py-3 tw-px-4 tw-border tw-border-gray-200 tw-flex tw-items-center tw-justify-center tw-text-white"
    style="background-color: #3e508b"
  >
    <img :src="facebookIconImg" alt="google-icon" class="tw-w-4 tw-h-4 tw-mr-2" />
    Facebookアカウントで登録
  </button>
</template>
<script lang="ts">
import { defineComponent } from 'vue';
import facebookIconImg from '../assets/images/facebook_icon.svg';

export default defineComponent({
  name: 'GoogleLoginButton',
  setup() {
    return { facebookIconImg };
  },
});
</script>
