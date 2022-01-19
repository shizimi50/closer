<template>
  <div class="my-card">
    <div class="header">
      <div>Mon</div>
      <p>June 2nd, 2021</p>
      <p></p>
    </div>
    <van-swipe-cell class="chore">
      <van-cell center title="Chore Name">
        <template #right-icon>
          <van-icon name="question-o" />
        </template>
      </van-cell>
      <template #right>
        <van-button square type="danger" class="delete-button" icon="delete-o" />
      </template>
    </van-swipe-cell>
    <van-button square size="large">+</van-button>
  </div>
</template>
<script lang="ts">
import { defineComponent } from 'vue';

const MyCard = defineComponent({
  name: 'MyCard',
  setup() {
    return {};
  },
});
export default MyCard;
</script>
<style lang="scss">
.my-card {
  position: relative;
  padding: 8px;
  margin: 20px 25px;
  border-radius: 16px;
  background: #f1f1f1;
  height: 200px;
  box-shadow: 5px 5px 5px #dfdddd;
}
.chore {
  background: white;
  box-shadow: 5px 5px 5px #dfdddd;
  &-list {
    display: flex;
    flex-direction: column;
    align-items: center;
  }
}

.delete-button {
  height: 100%;
}
</style>
