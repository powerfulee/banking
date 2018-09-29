<template>
<div slot="bottom" class="navRoot">
  <router-link :to="'/'" class="navLink" exact>
    <i class="fa fa-home navLinkIco" aria-hidden="true"></i>
    <span class="navLinkText">首页</span>
  </router-link>
  <router-link :to="{path: '/list/7'}" class="navLink">
    <i class="fa fa-home navLinkIco" aria-hidden="true"></i>
    <span class="navLinkText">信用卡</span>
  </router-link>
  <router-link :to="{path: '/list/8'}" class="navLink">
    <i class="fa fa-home navLinkIco" aria-hidden="true"></i>
    <span class="navLinkText">借钱</span>
  </router-link>
  <router-link :to="{path: '/list/13'}" class="navLink">
    <i class="fa fa-home navLinkIco" aria-hidden="true"></i>
    <span class="navLinkText">理财</span>
  </router-link>
</div>
</template>
