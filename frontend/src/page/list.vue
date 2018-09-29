<template>
<div class="box">

  <myHeader></myHeader>

  <ul style="font-size:0.3rem; padding: 0.2rem" v-for="i in list.data">
    <img v-bind:src="'http://192.168.2.29:3000' + i.icon" class="img-responsive">
    <li style="font-size:0.4rem">{{i.description}}</li>
  </ul>

  <myFooter></myFooter>

</div>
</template>

<script>
import axios from 'axios'

import myHeader from '../components/header.vue'
import myFooter from '../components/footer.vue'

export default {
  components: {
    myHeader,
    myFooter
  },
  data() {
    return {
      id: this.$route.params.id,
      list: []
    }
  },
  created() {
    var params = this.id
    this.getData(params)
  },
  watch: {
    '$route' (to, from) {
      this.getData(this.$route.params.id)
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
        this.list = res.data
      })
    }
  }
}
</script>
