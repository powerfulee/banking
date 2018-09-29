<template>
<div class="page-loadmore-wrapper" ref="wrapper" :style="{ height: wrapperHeight + 'px' }">
  <mt-loadmore :top-method="loadTop" :bottom-method="loadBottom" :bottom-all-loaded="allLoaded" :auto-fill="false" @top-status-change="handleTopChange" @bottom-status-change="handleBottomChange" ref="loadmore">

    <ul v-for="item in list">
      <router-link :to="{path: '/detail/' + item.id}" class="navLink">
        <img :src="imgAddress + item.icon" class="img-responsive">
        </router-link>
        <li style="font-size:0.4rem">{{item.description}}</li>
    </ul>

    <div slot="top" class="mint-loadmore-top">
      <span v-show="topStatus !== 'loading'" :class="{ 'is-rotate': topStatus === 'drop' }">↓</span>
      <span v-show="topStatus === 'loading'">
          <mt-spinner type="snake"></mt-spinner>
      </span>
    </div>
    <div slot="bottom" class="mint-loadmore-bottom">
      <span v-show="bottomStatus !== 'loading'" :class="{ 'is-rotate': bottomStatus === 'drop' }">↑</span>
      <span v-show="bottomStatus === 'loading'">
            <mt-spinner type="snake"></mt-spinner>
      </span>
    </div>

  </mt-loadmore>
</div>
</template>

<script>
import axios from 'axios'

import {
  swiper,
  swiperSlide
} from 'vue-awesome-swiper'

import myHeader from '../components/header.vue'
import myFooter from '../components/footer.vue'
import {
  Spinner,
  Loadmore
} from 'mint-ui'

export default {
  components: {
    myHeader,
    myFooter,
    'mt-spinner': Spinner,
    'mt-loadmore': Loadmore,
  },
  data() {
    return {
      list: [],
      allLoaded: false,
      autoFill: false, //若为真，loadmore 会自动检测并撑满其容器
      pageNo: 1, //当前页数
      limit: 10, //每页条数
      totalPage: null,
      //wrapperHeight: 0,
      topStatus: '',
      bottomStatus: '',
      imgAddress: this.GLOBAL.serverAddress
    }
  },
  created() {
    /*
    axios({
      method: "post",
      url: this.GLOBAL.serverAddress + '/api/product/list',
      data: {
        page: this.pageNo
      },
      transformRequest: [function(data) {
        let ret = ''
        for (let it in data) {
          ret += encodeURIComponent(it) + '=' + encodeURIComponent(data[it]) + '&'
        }
        return ret
      }],
    }).then((res) => {
      this.totalPage = res.data.totalPage
      this.list = res.data.data
    })
    */
    let data = {
      page: this.pageNo
    }
    this.$api.post('product/list', data, r => {
      this.totalPage = r.totalPage
      this.list = r.data
    })
  },
  methods: {
    loadTop() {
      console.log('loadTop')
      setTimeout(() => {
        this.$refs.loadmore.onTopLoaded();
        console.log('load top end');
      }, 2000);
    },
    loadBottom() {
      setTimeout(() => {
        if (this.pageNo < this.totalPage) {
          this.pageNo++
          let data = {
            page: this.pageNo
          }
          this.$api.post('product/list', data, r => {
            this.list = this.list.concat(r.data)
          })
        } else {
          this.allLoaded = true;
        }
        this.$refs.loadmore.onBottomLoaded();
      }, 1000);
    },
    handleTopChange(status) {
      console.log(status);
      this.topStatus = status;
    },
    handleBottomChange(status) {
      console.log('handleBottomChange ', status);
      this.bottomStatus = status;
    },
    mounted() {
      this.wrapperHeight = document.documentElement.clientHeight - this.$refs.wrapper.getBoundingClientRect().bottom;
    }
  }
}
</script>

<style lang="scss">
body {
    margin: 0;
    background-color: #fafafa;
}
.mint-loadmore-top {
    span {
        display: inline-block;
        transition: 0.2s linear;
        vertical-align: middle;
    }
    span.is-rotate {
        transform: rotate(180deg);
    }
}
.mint-loadmore-bottom {
    span {
        display: inline-block;
        transition: 0.2s linear;
        vertical-align: middle;
    }
    span.is-rotate {
        transform: rotate(180deg);
    }
}
</style>
