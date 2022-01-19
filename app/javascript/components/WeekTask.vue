<template>
  <div v-for="group in groups" :key="group.td" class="tw-w-full tw-bg-secondary tw-rounded-lg tw-shadow-lg tw-p-5 tw-mt-5">
    <div class="tw-flex tw-items-center tw-mb-3">
      <div class="tw-w-14 tw-h-14 tw-rounded-full tw-justify-center tw-bg-gray-100 tw-flex tw-items-center">
        {{ getDayOfWeek(group.td) }}
      </div>
      <div class="tw-ml-3 tw-w-2/3 tw-text-left">
        <div class="tw-mb-1">{{ group.td }}</div>
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
      <div v-for="task in group.tasks" :key="task.id" class="tw-shadow-lg tw-p-3 tw-rounded-xl tw-bg-white tw-mb-3">{{ task.chore_name }}</div>
      <!-- <div class="tw-shadow-lg tw-p-3 tw-rounded-xl tw-bg-white tw-mb-3">
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
      </div> -->
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import { getAuth } from 'firebase/auth';
import { getWeekTask } from '../apis';
import dayjs from 'dayjs';

export default defineComponent({
  name: 'WeekTask',
  async setup() {
    const token = await getAuth().currentUser.getIdToken(true);
    const tasks = await getWeekTask(token);
    const taskDays = Array.from(new Set(tasks.map((task) => task.start_time)));

    const getDayOfWeek = function (date: string) {
      const day = dayjs(date);
      const dayOfWeek = day.format('ddd');
      return dayOfWeek;
    };

    const groups = taskDays.map((td) => {
      const list = tasks.filter((task) => task.start_time === td);
      return {
        td,
        tasks: list,
      };
    });
    return { groups, getDayOfWeek };
  },
});
</script>
