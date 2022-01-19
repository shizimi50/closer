<template>
  <div class="tw-flex tw-items-center tw-justify-between tw-w-full tw-p-4">
    <svg
      @click="$router.push({ name: prevPage })"
      class="h-6 w-6 text-black"
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
      <polyline points="15 6 9 12 15 18" />
    </svg>
    <div>
      <h1 class="tw-font-bold">{{ title }}</h1>
    </div>
    <svg @click="showSideBar" class="tw-h-6 tw-w-6 tw-text-gray-800" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
    </svg>
    <van-popup v-model:show="isSideBarOpen" position="right" class="tw-h-screen tw-px-5 tw-py-10 tw-text-white tw-bg-gray-800">
      <ul>
        <li class="tw-py-2" @click="openHouseWorkDiagnosisModal()">おすすめの家事診断</li>
        <li class="tw-py-2" @click="openLogoutModal()">ログアウト</li>
      </ul>
    </van-popup>
  </div>
  <ModalLogout
    :is-visible="isLogoutModalOpen"
    @close="
      () => {
        isLogoutModalOpen = false;
      }
    "
  />
  <modal-house-work-diagnosis
    :is-visible="isHouseWorkDiagnosisModalOpen"
    @close="
      () => {
        isHouseWorkDiagnosisModalOpen = false;
      }
    "
  />
</template>
<script lang="ts">
import { defineComponent, ref } from 'vue';
import ModalLogout from './ModalLogout.vue';
import ModalHouseWorkDiagnosis from './ModalHouseWorkDiagnosis/Modal.vue';

export default defineComponent({
  name: 'MyHeader2',
  components: {
    ModalLogout,
    ModalHouseWorkDiagnosis,
  },
  props: {
    title: { type: String, required: true, default: 'My Title' },
    subTitle: { type: String, default: null },
    prevPage: { type: String, default: '/' },
  },
  setup(props) {
    const isSideBarOpen = ref(false);
    const isHouseWorkDiagnosisModalOpen = ref(false);
    const isLogoutModalOpen = ref(false);
    const showSideBar = () => {
      isSideBarOpen.value = true;
    };
    const openLogoutModal = () => {
      isLogoutModalOpen.value = true;
      isSideBarOpen.value = false;
    };
    const openHouseWorkDiagnosisModal = () => {
      isHouseWorkDiagnosisModalOpen.value = true;
      isSideBarOpen.value = false;
    };
    return {
      isSideBarOpen,
      showSideBar,
      props,
      isLogoutModalOpen,
      openLogoutModal,
      isHouseWorkDiagnosisModalOpen,
      openHouseWorkDiagnosisModal,
    };
  },
});
</script>
