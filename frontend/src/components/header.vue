<template>
<swiper :options="swiperOption" ref="mySwiper">
  <swiper-slide v-for="item in items" :key="item.id">
    <a :href="item.link_url" target="_blank">
      <img :src="imgAddress + item.pic_url" class="img-responsive">
    </a>
  </swiper-slide>
  <div class="swiper-pagination" slot="pagination"></div>
  <div class="swiper-button-prev" slot="button-prev"></div>
  <div class="swiper-button-next" slot="button-next"></div>
  <div class="swiper-scrollbar" slot="scrollbar"></div>
</swiper>
</template>

<script>
import {
  swiper,
  swiperSlide
} from 'vue-awesome-swiper'

import '../config/Global'

export default {
  components: {
    swiper,
    swiperSlide
  },
  data() {
    return {
      items: [],
      swiperOption: {
        notNextTick: true,
        // swiper configs 所有的配置同swiper官方api配置
        autoplay: 3000,
        // direction : 'vertical',
        effect: "coverflow",
        grabCursor: true,
        setWrapperSize: true,
        //autoHeight: true,
        paginationType: "bullets",
        pagination: '.swiper-pagination',
        paginationClickable: true,
        prevButton: '.swiper-button-prev',
        nextButton: '.swiper-button-next',
        scrollbar: '.swiper-scrollbar',
        mousewheelControl: true,
        observeParents: true
      },
      imgAddress: serverAddress
    }
  },
  computed: {
    swiper() {
      return this.$refs.mySwiper.swiper;
    }
  },
  mounted() {
    this.swiper.slideTo(0, 0, false);
  },
  created() {
    this.getRotates()
  },
  methods: {
    getRotates() {
      let params = {
        page: '1'
      }
      this.$api.post('rotates/show', params, r => {
        this.items = r.data
      })
    }
  }
}
</script>
