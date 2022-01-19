<template>
  <div class="tw-w-full tw-bg-secondary tw-rounded-lg tw-shadow-lg tw-p-5 tw-mt-5">
    {{ task }}
    <div class="tw-flex tw-items-center tw-mb-3">
      <div class="tw-w-14 tw-h-14 tw-rounded-full tw-justify-center tw-bg-gray-100 tw-flex tw-items-center">
        {{ weekday }}
      </div>
      <div class="tw-ml-3 tw-w-2/3 tw-text-left">
        <div class="tw-mb-1">{{ today }}</div>
        <!-- <van-progress :percentage="50" stroke-width="5" color="#222" track-color="#ddd" :show-pivot="false" /> -->
      </div>
    </div>
    <div>
      <!-- <van-swipe-cell class="tw-shadow-lg tw-rounded-xl tw-mb-3">
        <van-cell class="tw-text-left" :border="false" title="トイレ掃除" />
        <template #right>
          <van-button square type="danger" text="削除" />
        </template>
      </van-swipe-cell>
      <van-swipe-cell class="tw-shadow-lg tw-rounded-xl tw-mb-3">
        <van-cell class="tw-text-left tw-bg-gray-200" :border="false"><span class="tw-line-through">トイレ掃除</span></van-cell>
        <template #right>
          <van-button square type="danger" text="削除" />
        </template>
      </van-swipe-cell> -->
      <div class="tw-p-3 tw-mb-3" v-if="tasks.length === 0">今日の家事はありません</div>
      <div v-for="task in tasks" :key="task" class="tw-shadow-lg tw-p-3 tw-rounded-xl tw-bg-white tw-mb-3">
        {{ task.chore_name }}
      </div>
      <div @click="emitCreateTask()" class="tw-shadow-lg tw-p-3 tw-rounded-xl tw-bg-white tw-mb-3">
        <svg
          class="tw-h-5 tw-w-5 tw-text-gray-800 tw-mx-auto"
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
          <line x1="12" y1="5" x2="12" y2="19" />
          <line x1="5" y1="12" x2="19" y2="12" />
        </svg>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import { getAuth } from 'firebase/auth';
import { getTodayTask } from '../apis';
import dayjs from 'dayjs';

export default defineComponent({
  name: 'TodayTask',
  async setup(_, context) {
    const day = dayjs(new Date());
    const weekday = day.format('ddd');
    const today = day.format('YYYY-MM-DD');
    const token = await getAuth().currentUser.getIdToken(true);
    const tasks = await getTodayTask(token);

    const emitCreateTask = function () {
      context.emit('create-task');
    };

    return { tasks, weekday, today, emitCreateTask };
  },
});
</script>
