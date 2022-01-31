<template>
  <div class="tw-text-center">
    <h2 class="tw-text-gray-800 tw-font-bold tw-text-xl tw-mb-5">ご家族について教えてください</h2>
    <my-form-group label="配偶者または同居パートナーの就業状況">
      <my-select v-model="answer.partner_jobsituation" :options="employmentStatusOptions" />
    </my-form-group>
    <my-form-group label="子供の人数" class="tw-mt-5">
      <my-select v-model="answer.children" :options="numOfChildrenOptions" />
    </my-form-group>
    <my-form-group v-if="answer.children !== 'いない'" label="一番下の子供の年齢" class="tw-mt-5">
      <my-select v-model="answer.youngest_child_age" :options="youngestChildAgeOptions" />
    </my-form-group>
    <my-form-group v-if="answer.children !== 'いない'" label="保育園、幼稚園に通っている子供の有無" class="tw-my-5">
      <div class="tw-flex tw-items-center">
        <my-radio-button
          class="tw-mr-3"
          label="有"
          :checked="answer.kindergarten === '有'"
          @click="
            () => {
              answer.kindergarten = '有';
            }
          "
        />
        <my-radio-button
          class="tw-mr-3"
          label="無"
          :checked="answer.kindergarten === '無'"
          @click="
            () => {
              answer.kindergarten = '無';
            }
          "
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
import MySelect from '../General/MySelect.vue';
import SelectOption from '../../models/componentProps/SelectOption';

export default defineComponent({
  name: 'Step1',
  components: {
    MyButtonCircle,
    MyRadioButton,
    MyFormGroup,
    MyInput,
    MySelect,
  },
  props: ['answer'],
  data() {
    return {
      employmentStatusOptions: [
        {
          label: '週5日、雇用形態関わらず) フルタイム勤務・時短勤務',
          value: 'fulltime',
        },
        {
          label: '時短勤務(週5日、雇用形態関わらず)',
          value: 'shorttime',
        },
        {
          label: 'パート',
          value: 'parttime',
        },
      ] as SelectOption[],
      numOfChildrenOptions: [
        {
          label: 'いない',
          value: '-1',
        },
        {
          label: '1人',
          value: '1',
        },
        {
          label: '2人',
          value: '2',
        },
        {
          label: '3人',
          value: '3',
        },
        {
          label: '4人',
          value: '4',
        },
        {
          label: '5人以上',
          value: '5',
        },
      ] as SelectOption[],
      youngestChildAgeOptions: [
        {
          label: '0歳',
          value: '0',
        },
        {
          label: '1歳',
          value: '1',
        },
        {
          label: '2歳',
          value: '2',
        },
        {
          label: '3歳',
          value: '3',
        },
        {
          label: '4歳',
          value: '4',
        },
        {
          label: '5歳',
          value: '5',
        },
        {
          label: '6歳',
          value: '6',
        },
        {
          label: '7歳',
          value: '7',
        },
        {
          label: '8歳',
          value: '8',
        },
        {
          label: '9歳以上',
          value: '9',
        },
      ] as SelectOption[],
    };
  },
  methods: {
    moveToNext: function () {
      this.$emit('post-answer');
    },
  },
});
</script>
