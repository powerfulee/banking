import Vue from 'vue'
import Router from 'vue-router'
import Index from '@/page/index'
import List from '@/page/list'
import Detail from '@/page/detail'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      component: Index,
    },
    {
      path: '/list',
      redirect: '/list/:id',
      component: List,
      children: [
        { path: ':id', name: 'list', component: List }
      ]
    },
    {
      path: '/detail',
      redirect: '/detail/:id',
      component: Detail,
      children: [
        { path: ':id', name: 'detail', component: Detail }
      ]
    }
  ]
})
