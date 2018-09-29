<template>
<div class="box">
  <myHeader></myHeader>

  <mt-tab-container class="page-tabbar-tab-container" v-model="selected" swipeable>

    <mt-tab-container-item id="tab-container1">
      <first />
    </mt-tab-container-item>

    <mt-tab-container-item id="7">
      <ul style="font-size:0.3rem; padding: 0.2rem" v-for="i in list2">
        <img :src="imgAddress + i.icon" class="img-responsive">
        <li style="font-size:0.4rem">{{i.description}}</li>
      </ul>
    </mt-tab-container-item>

    <mt-tab-container-item id="8">
      <ul style="font-size:0.3rem; padding: 0.2rem" v-for="i in list3">
        <img :src="imgAddress + i.icon" class="img-responsive">
        <li style="font-size:0.4rem">{{i.description}}</li>
      </ul>
    </mt-tab-container-item>

    <mt-tab-container-item id="13">
      <ul style="font-size:0.3rem; padding: 0.2rem" v-for="i in list4">
        <img :src="imgAddress + i.icon" class="img-responsive">
        <li style="font-size:0.4rem">{{i.description}}</li>
      </ul>
    </mt-tab-container-item>

  </mt-tab-container>

  <mt-navbar class="navRoot" v-model="selected">
    <mt-tab-item class="navLinkText" id="tab-container1">首页</mt-tab-item>
    <mt-tab-item class="navLinkText" id="7">信用卡</mt-tab-item>
    <mt-tab-item class="navLinkText" id="8">理财</mt-tab-item>
    <mt-tab-item class="navLinkText" id="13">借钱</mt-tab-item>
  </mt-navbar>

</div>
</template>

<script>
import axios from 'axios'
import myHeader from '../components/header.vue'

import first from "@/page/first";

export default {
  name: 'page-tab-container',
  components: {
    myHeader,
    first
  },
  data() {
    return {
      active: 'tab-container1',
      list2: [],
      list3: [],
      list4: [],
      selected: "tab-container1",
      imgAddress: this.GLOBAL.serverAddress
    };
  },
  created() {
    this.getData(7),
      this.getData(8),
      this.getData(13)
  },
  watch: {
    selected: function(val, oldVal) {
      this.getDate(val)
    }
  },
  methods: {
    getData(params) {
      let data = {
        id: params
      }
      this.$api.post('product/category', data, r => {
        switch (params) {
          case 7:
            this.list2 = r.data;
            break;
          case 8:
            this.list3 = r.data;
            break;
          case 13:
            this.list4 = r.data;
            break;
        }
      })
    }
  }
};
</script>

<style lang="css" scoped>
  .item {
    display: inline-block;
  }

  .nav {
    padding: 10px;
  }

  .link {
    color: inherit;
    padding: 20px;
    display: block;
  }
</style>
