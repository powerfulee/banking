<template>
<div class="box">
  <myHeader></myHeader>
  <div class="page-tab-container">
    <mt-tab-container class="page-tabbar-tab-container" v-model="selected" swipeable>

      <mt-tab-container-item id="tab-container1">
        <first />
      </mt-tab-container-item>

      <mt-tab-container-item id="7">
        <ul style="font-size:0.3rem; padding: 0.2rem" v-for="i in list2">
          <img v-bind:src="'http://192.168.2.29:3000' + i.icon" class="img-responsive">
          <li style="font-size:0.4rem">{{i.description}}</li>
        </ul>
      </mt-tab-container-item>

      <mt-tab-container-item id="8">
        <ul style="font-size:0.3rem; padding: 0.2rem" v-for="i in list3">
          <img v-bind:src="'http://192.168.2.29:3000' + i.icon" class="img-responsive">
          <li style="font-size:0.4rem">{{i.description}}</li>
        </ul>
      </mt-tab-container-item>

      <mt-tab-container-item id="13">
        <ul style="font-size:0.3rem; padding: 0.2rem" v-for="i in list4">
          <img v-bind:src="'http://192.168.2.29:3000' + i.icon" class="img-responsive">
          <li style="font-size:0.4rem">{{i.description}}</li>
        </ul>
      </mt-tab-container-item>

    </mt-tab-container>
  </div>

  <div class="navRoot">
    <mt-navbar class="navRoot" v-model="selected">
      <mt-tab-item id="tab-container1">首页</mt-tab-item>
      <mt-tab-item id="7" @click.native.prevent="active = 'tab-container2'" @click.native="getData(7)">信用卡</mt-tab-item>
      <mt-tab-item id="8" @click.native.prevent="active = 'tab-container3'" @click.native="getData(8)">借钱</mt-tab-item>
      <mt-tab-item id="13" @click.native.prevent="active = 'tab-container4'" @click.native="getData(13)">理财</mt-tab-item>
    </mt-navbar>
  </div>

</div>
</template>

<script>
import axios from 'axios'
import myHeader from '../components/header.vue'
import myFooter from '../components/footer.vue'

import first from "@/page/first";

export default {
  name: 'page-tab-container',
  components: {
    myHeader,
    myFooter,
    first
  },
  data() {
    return {
      active: 'tab-container1',
      list2: [],
      list3: [],
      list4: [],
      selected: "tab-container1"
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
      axios({
        method: "post",
        url: "http://192.168.2.29:3000/json/product/category",
        data: {
          id: params
        },
        transformRequest: [function(data) {
          let ret = ''
          for (let it in data) {
            ret += encodeURIComponent(it) + '=' + encodeURIComponent(data[it]) + '&'
          }
          return ret
        }],
      }).then((res) => {
        switch (params) {
          case 7:
            this.list2 = res.data.data;
            break;
          case 8:
            this.list3 = res.data.data;
            break;
          case 13:
            this.list4 = res.data.data;
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
