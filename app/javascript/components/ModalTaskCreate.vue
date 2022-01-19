<template>
  <modal-base class="tw-text-center" :is-visible="isVisible" @close="close()" :is-close-button-visible="true">
    <div class="tw-p-5 tw-text-center tw-relative">
      <p class="tw-text-sm tw-mb-5">新たに追加したい家事を1つ選択してください。</p>
      <my-button
        v-for="task in tasks"
        :key="task.id"
        :category="task.id === selectedTask.id ? 'primary' : 'secondary'"
        :text="task.name"
        class="tw-w-full tw-shadow tw-my-1"
        @click="setTask(task)"
      />
      <my-button text="登録" class="tw-fixed tw-bottom-20 tw-right-5 tw-shadow-lg tw-w-32" @click="postTask()" />
    </div>
  </modal-base>
</template>
<script lang="ts">
import { defineComponent, ref } from 'vue';
import ModalBase from './ModalBase.vue';
import MyButton from './General/MyButton.vue';
import TaskCreateButtons from '../components/TaskCreateButtons.vue';
import { getAuth, onAuthStateChanged } from 'firebase/auth';
import { registerTask } from '../apis';

interface Task {
  id: number;
  name: string;
}

export default defineComponent({
  name: 'ModalTaskCreate',
  components: {
    ModalBase,
    MyButton,
    TaskCreateButtons,
  },
  props: {
    isVisible: {
      type: Boolean,
      required: true,
      default: false,
    },
  },
  setup() {
    let isTaskRegistrationCompletionModalOpen = ref<boolean>(false);
    const tasks = ref<Array<Task>>([
      {
        id: 1,
        name: '洗濯',
      },
      {
        id: 2,
        name: 'ゴミ捨て',
      },
      {
        id: 3,
        name: '風呂掃除',
      },
      {
        id: 4,
        name: 'トイレ掃除',
      },
      {
        id: 5,
        name: '食後の片付け',
      },
      {
        id: 6,
        name: '子の入浴補助',
      },
      {
        id: 7,
        name: '子の食事補助',
      },
      {
        id: 8,
        name: '子の登校補助',
      },
    ]);
    let selectedTask = ref<Task>({
      id: 1,
      name: '洗濯',
    });
    const setTask = (task: Task) => {
      selectedTask.value = task;
    };
    const postTask = () => {
      onAuthStateChanged(getAuth(), async function (user) {
        try {
          const token = await user.getIdToken();
          registerTask(token, selectedTask.value.name);
          isTaskRegistrationCompletionModalOpen.value = true;
          window.location.reload();
        } catch (error) {
          console.error('登録中に不具合が発生しました');
        }
      });
    };
    return { tasks, selectedTask, isTaskRegistrationCompletionModalOpen, setTask, postTask };
  },
  methods: {
    close: function () {
      this.$emit('close');
    },
  },
});
</script>
