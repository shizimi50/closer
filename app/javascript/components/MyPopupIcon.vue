<template>
  <van-dialog v-model:show="show" show-cancel-button theme="round-button" confirm-button-text="はい" cancel-button-text="いいえ">
    <div class="content">
      <van-row class="content__row">
        <van-col span="10" offset="8">
          <van-icon :name="icon" size="90" />
        </van-col>
      </van-row>
      <van-row justify="center" class="content__row">
        <van-col class="content__text__title" span="8">title</van-col>
      </van-row>
      <van-row justify="center" class="content__row">
        <van-col class="content__text" span="8">message</van-col>
      </van-row>
    </div>
  </van-dialog>
</template>
<script lang="ts">
import { defineComponent, ref } from 'vue';

const MyPopupIcon = defineComponent({
  name: 'MyPopupIcon',
  props: {
    title: { type: String, required: true, default: 'My Title' },
    message: { type: String, default: null, defult: 'My message' },
    icon: { type: String, default: null },
    show: { type: Boolean, default: false },
  },
  setup(props) {
    const show = ref(true);
    return { show };
  },
});
export default MyPopupIcon;
</script>
<style lang="scss">
.content {
  padding: 10%;
  &__row {
    padding-top: 15px;
  }
  &__text {
    text-align: center;
    &__title {
      text-align: center;
      font-weight: bolder;
    }
  }
}
</style>
