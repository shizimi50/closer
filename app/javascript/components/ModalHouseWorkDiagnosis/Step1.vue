<template>
  <div class="tw-text-center">
    <h2 class="tw-font-bold tw-text-xl tw-mb-2 tw-text-primary">あなたについて教えてください</h2>

    <my-form-group label="性別">
      <div class="tw-flex tw-items-center">
        <my-radio-button
          class="tw-mr-3"
          label="男性"
          :checked="answer.sex === '男性'"
          @click="
            () => {
              answer.sex = '男性';
            }
          "
        />
        <my-radio-button
          class="tw-mr-3"
          label="女性"
          :checked="answer.sex === '女性'"
          @click="
            () => {
              answer.sex = '女性';
            }
          "
        />
        <my-radio-button
          class="tw-mr-3"
          label="それ以外"
          :checked="answer.sex === 'それ以外'"
          @click="
            () => {
              answer.sex = 'それ以外';
            }
          "
        />
      </div>
    </my-form-group>
    <my-form-group label="生年月日" class="tw-mt-5">
      <my-select v-model="answer.birth" :options="yearMonthList" />
    </my-form-group>
    <my-form-group label="週の労働時間" class="tw-mt-5">
      <div class="tw-flex tw-items-center"><my-input type="number" v-model="answer.working_hours" class="tw-w-4/5 tw-mr-2" />時間</div>
    </my-form-group>
    <my-form-group label="休日" class="tw-my-5">
      <div class="tw-flex tw-flex-wrap">
        <my-checkbox
          class="tw-mr-2 tw-mb-3"
          v-for="day in ['月', '火', '水', '木', '金', '土', '日', '不定']"
          :key="day"
          :label="day"
          :value="day"
          v-model="answer.holiday"
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
import MyInput from '../General/MyInput.vue';
import MyCheckbox from '../General/MyCheckbox.vue';
import MySelect from '../General/MySelect.vue';
import SelectOption from '../../models/componentProps/SelectOption';

export default defineComponent({
  name: 'Step1',
  props: ['answer'],
  components: {
    MyButtonCircle,
    MyRadioButton,
    MyFormGroup,
    MyInput,
    MyCheckbox,
    MySelect,
  },
  data() {
    return {
      yearMonthList: [] as SelectOption[],
    };
  },
  mounted() {
    let date = new Date();
    const currentYear = date.getFullYear();
    console.log(currentYear);
    for (let i = 0; i < 80; i++) {
      this.yearMonthList.push({
        label: (currentYear - i).toString(),
        value: (currentYear - i).toString(),
      });
    }
  },
  methods: {
    moveToNext: function () {
      this.$emit('next');
    },
  },
});
</script>
