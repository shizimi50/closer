<template>
  <modal-base class="tw-text-center" :is-visible="isVisible" @close="close()">
    <svg
      class="tw-h-20 tw-w-20 tw-text-primary tw-mx-auto tw-mb-5"
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
      <path d="M14 8v-2a2 2 0 0 0 -2 -2h-7a2 2 0 0 0 -2 2v12a2 2 0 0 0 2 2h7a2 2 0 0 0 2 -2v-2" />
      <path d="M7 12h14l-3 -3m0 6l3 -3" />
    </svg>
    <p>本当にログアウトしますか？</p>
    <div class="tw-flex tw-items-center tw-justify-center tw-mt-5">
      <my-button class="tw-mx-2 tw-w-24" text="はい" category="danger" @click="logout()" />
      <my-button class="tw-mx-2 tw-w-24" text="いいえ" @click="close()" />
    </div>
  </modal-base>
</template>
<script lang="ts">
import { defineComponent } from 'vue';
import ModalBase from './ModalBase.vue';
import MyButton from './General/MyButton.vue';
import { getAuth } from 'firebase/auth';

export default defineComponent({
  name: 'ModalHouseWorkDiagnosis',
  components: {
    ModalBase,
    MyButton,
  },
  props: {
    isVisible: {
      type: Boolean,
      required: true,
      default: false,
    },
  },
  setup() {
    const logout = () => {
      try {
        getAuth().signOut();
        window.location.reload();
      } catch (error) {
        console.log(error);
      }
    };
    return { logout };
  },
  methods: {
    close: function () {
      this.$emit('close');
    },
  },
});
</script>
