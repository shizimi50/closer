<template>
  <div class="tw-text-center" v-if="recommendation">
    <h2 class="tw-text-gray-800 tw-font-bold tw-text-xl tw-mb-5">診断完了！</h2>
    <small>あなたにおすすめの家事の担当時間、<br />担当日は以下の通りです</small>
    <div class="tw-grid tw-grid-cols-2 tw-gap-4 tw-my-5">
      <my-form-group label="家事担当時間"
        ><span class="tw-text-xl tw-text-gray-800">{{ recommendation?.working_hours }}/日</span></my-form-group
      >
      <my-form-group label="家事担当時間"
        ><span class="tw-text-xl tw-text-gray-800">{{ recommendation?.chore_days }}</span></my-form-group
      >
    </div>

    <my-form-group class="tw-my-5" label="以上の結果をもとに、実際に家事を担当したい曜日を選択してください">
      <div class="tw-flex tw-flex-wrap">
        <my-checkbox
          class="tw-mr-2 tw-mb-3"
          v-for="day in ['月', '火', '水', '木', '金', '土', '日', '不定']"
          :key="day"
          :label="day"
          :value="day"
          v-model="selectedDays"
        />
      </div>
    </my-form-group>
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
import { getRecommendedTaskTime, login, postRecommendedTaskTime } from '../../apis';

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
      selectedDays: [],
      recommendation: null,
    };
  },
  created() {
    this.getRecommendedTaskTime();
  },
  methods: {
    moveToNext: function () {
      this.$emit('next', this.selectedDays);
    },
    getRecommendedTaskTime: async function () {
      try {
        const token = await getAuth().currentUser.getIdToken(true);
        await postRecommendedTaskTime(token);
        this.recommendation = await getRecommendedTaskTime(token);
      } catch (error) {
        console.error(error);
      }
    },
  },
});
</script>
