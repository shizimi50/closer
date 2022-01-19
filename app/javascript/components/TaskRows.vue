<template>
  <my-row v-for="task in tasks" :key="task.id" :text="task.chore_name" />
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import MyRow from './General/MyRow.vue';
import { getRegisteredTasks, login } from '../apis/index';
import { getAuth } from 'firebase/auth';

interface Task {
  id: number;
  name: string;
}
export default defineComponent({
  name: 'TaskRows',
  components: { MyRow },
  async setup() {
    const token = await getAuth().currentUser.getIdToken(true);
    const tasks = await getRegisteredTasks(token);
    return { tasks };
  },
});
</script>
