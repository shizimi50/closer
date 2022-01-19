<template>
  <div class="tw-text-center">
    <svg
      class="tw-h-16 tw-w-16 tw-text-green-700 tw-mx-auto tw-my-5"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      stroke-width="2"
      stroke-linecap="round"
      stroke-linejoin="round"
    >
      <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14" />
      <polyline points="22 4 12 14.01 9 11.01" />
    </svg>
    <div class="tw-my-8">
      <h2 class="tw-text-gray-800 tw-font-bold tw-text-xl tw-mb-2">1週間のToDoリスト<br />更新完了！</h2>
      <p class="tw-text-sm">あなたが選んだ家事を<br />ToDoリストに追加しました。<br />今週のタスクを確認しましょう</p>
    </div>
  </div>
</template>
<script lang="ts">
import { defineComponent } from 'vue';
import MyButton from '../General/MyButton.vue';

export default defineComponent({
  name: 'Outro',
  components: {
    MyButton,
  },
});
</script>
