<template>
  <modal-base :is-visible="isVisible && onGoingStep === STEPS.INTRO" :is-close-button-visible="true" @close="close()">
    <intro
      @next="
        () => {
          onGoingStep = STEPS.STEP1;
        }
      "
    />
  </modal-base>
  <modal-base :is-visible="isVisible && onGoingStep === STEPS.STEP1">
    <step-1
      @next="
        () => {
          onGoingStep = STEPS.STEP2;
        }
      "
      :answer="answer"
    />
  </modal-base>
  <modal-base :is-visible="isVisible && onGoingStep === STEPS.STEP2">
    <step-2 @post-answer="postAnswer()" :answer="answer" />
  </modal-base>
  <modal-base :is-visible="isVisible && onGoingStep === STEPS.STEP3" :is-highlighted="true">
    <step-3
      @next="
        ($event) => {
          selectedDays = $event;
          onGoingStep = STEPS.STEP4;
        }
      "
    />
  </modal-base>
  <modal-base :is-visible="isVisible && onGoingStep === STEPS.STEP4" :is-highlighted="true">
    <step-4
      @next="
        ($event) => {
          selectedTasks = $event;
          postTasks();
          onGoingStep = STEPS.OUTRO;
        }
      "
    />
  </modal-base>
  <modal-base :is-visible="isVisible && onGoingStep === STEPS.OUTRO" :is-close-button-visible="true" @close="close()">
    <outro />
  </modal-base>
</template>
<script lang="ts">
import { defineComponent } from 'vue';
import ModalBase from '../ModalBase.vue';
import Intro from './Intro.vue';
import Step1 from './Step1.vue';
import Step2 from './Step2.vue';
import Step3 from './Step3.vue';
import Step4 from './Step4.vue';
import Outro from './Outro.vue';
import { getAuth } from 'firebase/auth';
import { postAnswer, postTask } from '../../apis/index';

type StepName = 'INTRO' | 'STEP1' | 'STEP2' | 'STEP3' | 'STEP4' | 'OUTRO';
const STEPS = {
  INTRO: 'INTRO' as StepName,
  STEP1: 'STEP1' as StepName,
  STEP2: 'STEP2' as StepName,
  STEP3: 'STEP3' as StepName,
  STEP4: 'STEP4' as StepName,
  OUTRO: 'OUTRO' as StepName,
};

interface answer {
  sex: '男性' | '女性' | 'それ以外' | '回答しない';
  birth: String;
  working_hours: String;
  holiday: Array<String>;
  partner_jobsituation: String;
  children: String;
  youngest_child_age: String;
  kindergarten: String;
}

export default defineComponent({
  name: 'ModalHouseWorkDiagnosis',
  components: {
    ModalBase,
    Intro,
    Step1,
    Step2,
    Step3,
    Step4,
    Outro,
  },
  props: {
    isVisible: {
      type: Boolean,
      required: true,
      default: false,
    },
  },
  data() {
    return {
      STEPS: STEPS,
      onGoingStep: STEPS.INTRO as StepName,
      answer: {
        sex: '男性',
        birth: '1990',
        working_hours: '40',
        holiday: ['土', '日'],
        partner_jobsituation: '週5日、雇用形態関わらず) フルタイム勤務・時短勤務',
        children: 'いない',
        youngest_child_age: '1歳',
        kindergarten: '無',
      } as answer,
      selectedDays: [],
      selectedTasks: [],
    };
  },
  methods: {
    close: function () {
      this.$emit('close');
    },
    postAnswer: async function () {
      try {
        const token = await getAuth().currentUser.getIdToken(true);
        // arrayのholidayをカンマ区切りのstringにするためにオブジェクトを生成している
        const answer = {
          sex: this.answer.sex,
          birth: this.answer.birth,
          working_hours: this.answer.working_hours,
          holiday: this.answer.holiday.join(','),
          partner_jobsituation: this.answer.partner_jobsituation,
          children: this.answer.children,
          youngest_child_age: this.answer.youngest_child_age,
          kindergarten: this.answer.kindergarten,
        };
        postAnswer(token, answer);
        this.onGoingStep = STEPS.STEP3;
      } catch (error) {
        console.error(error);
      }
    },
    postTasks: async function () {
      try {
        let days = {};
        let tasks = {};
        this.selectedDays.forEach((element, index) => {
          days[this.toEngDay(element)] = index;
        });
        this.selectedTasks.forEach((element, index) => {
          tasks[index] = element;
        });
        const req = [days, tasks];
        const token = await getAuth().currentUser.getIdToken(true);
        localStorage.setItem('isSurveyDone', 'true');
        await postTask(token, req);
      } catch (error) {
        console.error(error);
      }
    },
    toEngDay: function (jpDay: string) {
      switch (jpDay) {
        case '日':
          return 'Sun';
        case '月':
          return 'Mon';
        case '火':
          return 'Tue';
        case '水':
          return 'Wed';
        case '木':
          return 'Thu';
        case '金':
          return 'Fri';
        case '土':
          return 'Sat';
      }
    },
  },
});
</script>
