<template>
    <div class="ap1">
         
       <div class="bbb">
            <div class="ccc"><router-link to="/login" >登录</router-link></div>
            <div class="ddd"><router-link to="/register" >注册</router-link></div>
         </div>
        
    <div class="eee">
        <label for="username"></label>
        <input type="text" v-model="username" id="username" placeholder="请输入您的账号">
    </div>
    <div class="eee">
        <label for="pwd"></label>
        <input type="text" v-model="pwd" id="pwd" placeholder="请输入密码">
    </div>
    <div class="eee">
        <button @click.prevent="login">登&nbsp&nbsp&nbsp&nbsp录</button>
        <div>{{msg}}</div>
   </div>
    </div>
</template>
<script>
import RegisterVue from './Register.vue'
export default {
    data(){
        return {
            username:'',
            pwd:'',
            msg:''//接收数据
        }
    },
    methods:{
         register(){
            this.$router.push({ path: '/Register'})
        },
        login(){
            this.$axios.post(this.HOST+'/api/login',{username:this.username,password:this.pwd})
            .then(result=>{
                console.log(result.data)
                this.msg = result.data.msg
                if(this.msg=="登录成功"){
                    this.$router.push({ path: '/chat'})
                    localStorage.setItem('WEB_IM_USER', JSON.stringify({
                      uid: result.data.result[0].username,
                      nickname: result.data.result[0].nc
                    }))
                    // localStorage.setItem('WEB_IM_USER',result.data.result[0].nc);
                }
                
            })
            .catch(err=>{
                console.log(err)
            })
        }
       
        
    }
}
</script>
<style lang='stylus' sc>
  @import '../../assets/css/login.styl';
</style>    