<template>
  <my-button v-for="task in tasks" :key="task.id" :category="'secondary'" :text="task.chore_name" class="tw-w-full tw-shadow tw-my-1" @click="setTask(task)" />
</template>

<script lang="ts">
import { defineComponent, ref } from 'vue';
import MyButton from './General/MyButton.vue';
import { getRegisteredTasks } from '../apis/index';
import { getAuth } from 'firebase/auth';

interface Task {
  id: number;
  name: string;
}
export default defineComponent({
  name: 'TaskCreateButton',
  components: { MyButton },
  async setup() {
    const token = await getAuth().currentUser.getIdToken(true);
    const tasks = await getRegisteredTasks(token);
    let selectedTask = ref<Task>();
    return { tasks, selectedTask };
  },
  methods: {
    setTask: function (task: Task) {
      this.$emit('set-task', task);
    },
  },
});
</script>
