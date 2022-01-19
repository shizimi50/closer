<template>
  <div class="tab-bar tw-fixed tw-bottom-0 tw-w-full tw-grid tw-grid-cols-2 tw-gap-4 tw-border-t tw-border-gray-200 tw-z-40 tw-bg-white">
    <div class="tw-p-5" @click="$router.push('/task')">
      <svg
        class="tw-h-8 tw-w-8 tw-text-gray-500 tw-mx-auto"
        viewBox="0 0 24 24"
        fill="none"
        stroke="currentColor"
        stroke-width="2"
        stroke-linecap="round"
        stroke-linejoin="round"
      >
        <line x1="8" y1="6" x2="21" y2="6" />
        <line x1="8" y1="12" x2="21" y2="12" />
        <line x1="8" y1="18" x2="21" y2="18" />
        <line x1="3" y1="6" x2="3.01" y2="6" />
        <line x1="3" y1="12" x2="3.01" y2="12" />
        <line x1="3" y1="18" x2="3.01" y2="18" />
      </svg>
    </div>
    <div class="tw-p-5" @click="$router.push('/mypage')">
      <svg class="tw-h-8 tw-w-8 tw-text-gray-500 tw-mx-auto" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
      </svg>
    </div>
  </div>
</template>
<script lang="ts">
import { defineComponent, reactive } from 'vue';

const MyTabBar = defineComponent({
  name: 'MyTabBar',
  setup() {
    const state = reactive({
      currentTab: 'task',
    });
    const onTabbarChange = () => {};
    return { state, onTabbarChange };
  },
});
export default MyTabBar;
</script>

<style>
.tab-bar {
  max-width: 400px;
  margin: 0 auto;
}
</style>
