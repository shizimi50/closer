<template>
  <div class="tw-text-center">
    <svg class="tw-h-24 tw-w-24 tw-text-gray-800 tw-mx-auto tw-mt-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path
        stroke-linecap="round"
        stroke-linejoin="round"
        stroke-width="2"
        d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"
      />
    </svg>

    <div class="tw-my-8">
      <h2 class="tw-text-primary tw-font-bold tw-text-xl tw-mb-2">おすすめの家事診断へようこそ</h2>
      <p class="tw-text-sm">あなたにおすすめの家事を、<br />いくつかの質問を通してご紹介します</p>
    </div>
    <my-button @click="moveToNext" text="次へ" class="tw-w-1/2" />
  </div>
</template>
<script lang="ts">
import { defineComponent } from 'vue';
import MyButton from '../General/MyButton.vue';

export default defineComponent({
  name: 'Intro',
  components: {
    MyButton,
  },
  methods: {
    moveToNext: function () {
      this.$emit('next');
    },
  },
});
</script>
