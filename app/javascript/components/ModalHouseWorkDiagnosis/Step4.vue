<template>
  <div class="tw-text-center">
    <h2 class="tw-text-gray-800 tw-font-bold tw-text-xl tw-mb-5">診断完了！</h2>
    <small>あなたにおすすめの家事は以下の通り！<br />取り組みたい家事を選択して<br />登録しましょう</small>

    <my-form-group class="tw-my-5" label="おすすめの家事"
      ><div class="tw-flex tw-flex-wrap">
        <my-checkbox
          class="tw-mr-2 tw-mb-3 tw-w-full"
          v-for="task in recommendedTasks"
          :key="task.chore_name"
          :label="task.chore_name"
          :value="task.chore_name"
          v-model="selectedTasks"
        /></div
    ></my-form-group>
    <my-button-circle @click="moveToNext" text="次へ" class="tw-float-right" />
  </div>
</template>
<script lang="ts">
import { defineComponent } from 'vue';
import MyButtonCircle from '../General/MyButtonCircle.vue';
import MyRadioButton from '../General/MyRadioButton.vue';
import MyFormGroup from '../General/MyFormGroup.vue';
import MyCheckbox from '../General/MyCheckbox.vue';
import MySelect from '../General/MySelect.vue';
import { getAuth } from 'firebase/auth';
import { getRecommendedTasks } from '../../apis';

export default defineComponent({
  name: 'Step1',
  components: {
    MyButtonCircle,
    MyRadioButton,
    MyFormGroup,
    MyCheckbox,
    MySelect,
  },
  data() {
    return {
      selectedTasks: [],
      recommendedTasks: [],
    };
  },
  created() {
    this.getRecommendedTasks();
  },
  methods: {
    moveToNext: function () {
      this.$emit('next', this.selectedTasks);
    },
    getRecommendedTasks: async function () {
      try {
        const token = await getAuth().currentUser.getIdToken(true);
        this.recommendedTasks = await getRecommendedTasks(token);
      } catch (error) {
        console.error(error);
      }
    },
  },
});
</script>
