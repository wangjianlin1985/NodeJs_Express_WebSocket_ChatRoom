<template>
  <div id="app1">

        <!-- <router-link to="/login">登录</router-link>
        <router-link to="/register">注册</router-link> -->
        <router-view></router-view>

  </div>
</template>

<script>
import Vue from 'vue'
import moment from 'moment'
import login from './components/dialog/Login.vue'
export default {
  data(){
    return{
      
    }
  },
  components:{//挂载组件
      'v-login':login//v-home自定义标签
    }
}

</script>


