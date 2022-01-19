<template>
  <div class="tw-text-center">
    <svg class="tw-h-16 tw-w-16 tw-text-gray-400 tw-mx-auto" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path
        stroke-linecap="round"
        stroke-linejoin="round"
        stroke-width="2"
        d="M5.121 17.804A13.937 13.937 0 0112 16c2.5 0 4.847.655 6.879 1.804M15 10a3 3 0 11-6 0 3 3 0 016 0zm6 2a9 9 0 11-18 0 9 9 0 0118 0z"
      />
    </svg>
    <b>{{ user.data.user.name }}</b>
  </div>
  <div class="tw-grid tw-grid-cols-2 tw-gap-4 tw-mt-8 tw-px-5">
    <div>
      <small class="tw-text-gray-500">おすすめ担当時間</small>
      <p class="tw-text-xl tw-mt-2">{{ taskTime.working_hours }}/日</p>
    </div>
    <div>
      <small class="tw-text-gray-500">おすすめ担当時間</small>
      <p class="tw-text-xl tw-mt-2">{{ taskTime.chore_days }}</p>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import { getAuth } from 'firebase/auth';
import { login, getRecommendedTaskTime } from '../apis';

export default defineComponent({
  name: 'MyPageUserInfo',
  async setup() {
    const token = await getAuth().currentUser.getIdToken(true);
    const user = await login(token);
    const taskTime = await getRecommendedTaskTime(token);
    return { user, taskTime };
  },
});
</script>
