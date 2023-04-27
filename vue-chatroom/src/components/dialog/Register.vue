<template>
    <div class="ap1">
        <div class="bbb">
            <div class="ccc"><router-link to="/login" >登录</router-link></div>
            <div class="ddd"><router-link to="/register" >注册</router-link></div>
        </div>
    <div class="eee">
        <label for="username"></label>
        <input type="text" v-model="username" id="username" placeholder="请输入用户名">
    </div>
     <div class="eee">
        <label for="pwd"></label>
        <input type="text" v-model="pwd" id="pwd" placeholder="请输入密码">
     </div>
     <div class="eee">
        <label for="again"></label>
        <input type="text" v-model="again" id="again" @blur="verify" placeholder="请再输一次密码">
     </div>
     <div class="eee">
        <label for="nc"></label>
        <input type="text" v-model="nc" id="nc" placeholder="你想取什么名字嘞">
     </div>
     <div class="eee" >
        <button @click.prevent="register">注&nbsp&nbsp&nbsp&nbsp册</button>
        <div>{{msg}}</div>
    </div>
    </div>
</template>
<script>
export default {
    data(){
        return {
            username:'',
            pwd:'',
            again:'',
            nc:'',
            msg:''//接收数据
        }
    },
    methods:{
        verify(){
            if(this.pwd!==this.again){
                this.msg = '两次密码不一致'
                return;
            }
        },
        register(){
            this.verify()
            this.$axios.post(this.HOST+'/api/register',{username:this.username,password:this.pwd,nc:this.nc})
            .then(result=>{
                this.msg = result.data.msg
                
            })
            .catch(err=>{
                
            })
        }
    }
}
</script>
<style lang='stylus'>
  @import '../../assets/css/login.styl';
</style>