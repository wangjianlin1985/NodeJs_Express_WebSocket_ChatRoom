<template>

  <div id="app">
    <c-dialog ref="loginDialog" title='请输入你的昵称' confirmBtn="开始聊天" @confirm="login">
      <input class="nickname" v-model="nickname" type="text" placeholder="请输入你的昵称">
    </c-dialog>

    <c-dialog ref="createGroupDialog" title='请输入房间名称' confirmBtn="确认" @confirm="createGroup">
      <input class="nickname" v-model="groupName" type="text" placeholder="请输入房间名称">
    </c-dialog>

    <div class="web-im dis-flex">
      <div class="left">
        <div class="aside content">
          <div class="header">
            <div class="tabbar dis-flex">
              <label :class="{active:switchType==1, unread: usersUnRead}" for="" @click="switchType=1">在线人员</label>
              <label :class="{active:switchType==2, unread: groupsUnRead}" for="" @click="switchType=2">房间</label>
            </div>
          </div>
          <div class="body user-list">
              <div v-if="switchType==2" class="user" @click="triggerGroup(item)" v-for="(item,index) in currentGroups" :key="index">
              {{item.name}}
              <span class="tips-num" v-if="item.unread">{{item.unread}}</span>
              <span v-if="!checkUserIsGroup(item)" @click.stop="addGroup(item)" class="add-group">+</span>
            </div>
              <div v-if="switchType==1 && item.uid!=uid" class="user" @click="triggerPersonal(item)" :class="{offline: !item.status}" v-for="(item,index) in currentUserList" :key="index">
              {{item.nickname}}
              <span class="tips-num" v-if="item.unread">{{item.unread}}</span>
            </div>
          </div>
          <div class="footer">
            <div class="func dis-flex">
              <label @click="$refs.createGroupDialog.show()">创建房间</label>
            </div>
          </div>
        </div>
      </div>
      <div class="right content">
        <div class="header im-title">{{title}}</div>
        <div class="body im-record" id="im-record" style="position:relative;" @click.stop="emojiSelector(false)">
          <div class="ul">
            <div class="li" :class="{user: item.uid == uid}" v-for="(item,index) in currentMessage" :key="index">
              <template v-if="item.type===1">
                <p class="join-tips">{{item.msg}}</p>
              </template>
              <template v-else>
                <p class="message-date">
                  <span class="m-nickname">{{item.nickname}}</span> {{item.date}}</p>
                <p class="message-box" >
                  <img :src="item.msg" v-if="item.type === 3" style="width:320px;height:180px;"/>
                  <span v-else-if="item.type === 4">
                    <img src="../../assets/images/folder.png" style="height:60px;">
                    {{item.msg.split("@*****@")[1]}}
                    <img src="../../assets/images/download.png" style="height:25px;" @click="downloadFile(item.msg.split('@*****@')[0])"/>
                  </span>
                  <span v-else-if="item.type === 2">{{item.msg}}</span>
                </p>
              </template>
            </div>
          </div>
          <div class="fileUpload" v-if="uploadBoxShow">
            <img src="../../assets/images/folder.png" style="height:100%"/>
            <div class="content">{{uploadFileName || ""}}</div>
            <img src="../../assets/images/upload.png" style="height:27px;margin-right:7px;" @click="sendFile" v-if="!uploading"/>
            <img src="../../assets/images/close.svg" style="height:20px;" @click="clearFile" v-if="!uploading"/>
          </div>
        </div>
        <div class="footer im-input dis-flex">
          <form ref="uploadForm">
            <ul id="fp">
              <li class="file"><input type="file" style="left:-4px;" @change="uploadFileChange" multiple="false" ref="fileUploader"/><img src="../../assets/images/file.png" alt="" /></li>
              <li class="file"><input type="file" style="left:4px" @change="sendImg" multiple="false" accept="image/*" ref="imgUploader"/><img src="../../assets/images/photo.png" alt="" /></li>
              <li class="file">
                <img src="../../assets/images/Emoji.png" alt="" style="height:23px;width:23px;" @click="emojiSelector(true)"/>
                <div class="emojipicker" v-if="showEmojiSelector">
                  <VEmojiPicker :showSearch="false" @select="selectEmoji"/>
                </div>
              </li>
            </ul>
          </form>

          <!-- <div id="i" > -->
          <button id="i" @click="showHistoryDialog"> 历史记录</button>
          <!-- </div> -->
          <input type="text" v-model="msg" placeholder="请输入内容">
            <button @click="send">发送</button>
            <!-- <button  @click="aaaaa=!aaaaa">ioioio</button>
            <div v-if="aaaaa" style="height:100px;width:100px background:red">1111</div> -->
        </div>
      </div>
    </div>
    <div class="his" v-if="!aa">
      <div class="history">
        <div class="tabs">
          <div :class="{'item':true,'active':currHistory === 0}" @click="changeCurrHistory(0)">全部</div>
          <div :class="{'item':true,'active':currHistory === 1}" @click="changeCurrHistory(1)">图片</div>
          <div :class="{'item':true,'active':currHistory === 2}" @click="changeCurrHistory(2)">文件</div>
        </div>
        <div class="content">
          <div class="item" v-for="(item,index) in processedHistory" :key="index">
            <div class="title" :style="item.sender == uid ? 'color:#00b7a3' : '#409eff'">{{item.sender_nc === "" ? "UID: " + item.sender : item.sender_nc}} {{item.time}}</div>
            <div class="msg">
              <div v-if="item.type === 100">{{item.value.content}}</div>
              <div v-else-if="item.type === 30" class="image">
                <img :src="item.value.content"/>
              </div>
              <div v-else-if="item.type === 40" class="file" >
                <img src="../../assets/images/folder.png" style="height:60px;">
                <div class="name">{{item.value.filename}}</div>
                <img src="../../assets/images/download.png" style="height:25px;" @click="downloadFileFromUrl(item.value.content,item.value.filename)"/>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <a style="display:none;" href="" ref="downloadFileTag"></a>
  </div>
</template>

<script>
import Vue from 'vue'
import moment from 'moment'
import { VEmojiPicker } from 'v-emoji-picker'
import Cdialog from './dialog'

var getuser;
export default {
  name: 'App',
  components: {
    'c-dialog': Vue.extend(require('./dialog.vue').default),
    VEmojiPicker
  },
  data(){

    return {
      aa: true,
      title: '请选择房间或者人员进行聊天',
      switchType: 1,
      uid: '',
      nickname: '',
      socket: '',
      msg: '',
      date:'',
      messageList: [],//消息
      users: [],//用户
      groups: [],//房间数组
      groupId: '',//房间id
      bridge: [],
      groupName: '',
      name:'',//用于历史记录记录昵称
      uploadBoxShow: false, //用于控制上传框是否显示
      uploading: false, //是否处于上传文件状态
      uploadFileName: "", //要上传的文件名
      history: [], // 当前会话的历史记录
      currHistory: 0, // 当前选择的历史记录分类
      showEmojiSelector: false, //是否显示表情选择器
    }
  },
  mounted() {
    let vm = this;
    let user = localStorage.getItem('WEB_IM_USER'); //获取本地存储用户信息
    user = user && JSON.parse(user) || {};
    vm.uid = user.uid;
    vm.nickname = user.nickname;

    if(!vm.uid){//是否第一次登陆
      vm.$refs.loginDialog.show()
    } else {
      vm.conWebSocket();
    }
//敲击回车键可以发送消息
    document.onkeydown = function (event) {
        var e = event || window.event;
        if (e && e.keyCode == 13) { //回车键的键值为13
            vm.send()
        }
    }
    //用于判断是否要离开当前聊天页面
    window.onbeforeunload = function (e) {
      vm.socket.JSON.stringify({
        uid: vm.uid,
        type: 2,
        nickname: vm.nickname,
        bridge: []
      });
    }
  },
  computed: {
    processedHistory(){
      let temp = this.history.map(val=>{
        let tmp = {...val}
        tmp.receiver = JSON.parse(tmp.receiver)
        tmp.value = JSON.parse(tmp.value)
        return tmp
      })
      if(this.currHistory === 0){
        return temp
      }else if(this.currHistory === 1){
        return temp.filter(val=>val.type === 30)
      }else if(this.currHistory === 2){
        return temp.filter(val=>val.type === 40)
      }
    },
    currentMessage() {//当前对话渲染的msg列表
      let vm = this;
      let data = vm.messageList.filter(item=>{//数组排序，转换成字符串后进行对比
        if(item.type === 1) {
          return item;
        } else if(this.groupId) {
          return item.groupId === this.groupId
        } else if(item.bridge.length){
          return item.bridge.sort().join(',') == vm.bridge.sort().join(',')
        }
      })
      data.map(item=>{
        item.status = 0
        return item;
      })
      return data;
    },
    currentGroups() {
      let vm = this;
      vm.groups.map(group=>{
        group.unread = this.messageList.filter(item=>{
          return item.groupId === group.id && item.status === 1
        }).length
        return group;
      })
      return vm.groups;
    },
    //房间未读消息
    groupsUnRead(){
      return this.messageList.some(item=>{
        return item.groupId && item.status === 1
      })
    },
    //私聊未读消息
    usersUnRead(){
      return this.messageList.some(item=>{
        return item.bridge.length && item.status === 1
      })
    },
    currentUserList() {
      let vm = this;
      vm.users.map(user=>{
        user.unread = this.messageList.filter(item=>{
          return item.bridge.length && item.uid === user.uid && item.status === 1
        }).length
        return user;
      })
      return vm.users;
    },
  },
  methods: {
    emojiSelector(isShow){
      this.showEmojiSelector = isShow
    },
    selectEmoji(emoji) {
      this.msg += emoji.data
      this.showEmojiSelector = false
    },
    // 显示历史记录框
    async showHistoryDialog(){
      if(!this.bridge.length && !this.groupId){
        this.$message({type: 'error', message: '请选择发送人或者房间'})
        return;
      }
      this.aa = !this.aa
      if(!this.aa){
        let history = await this.getHistory()
        this.history = history
      }
    },
    changeCurrHistory(id){
      this.currHistory = id
    },
    //加入房间
    addGroup(item){
      this.socket.send(JSON.stringify({
        uid: this.uid,
        type: 20,
        nickname: this.nickname,
        groupId: item.id,
        groupName: item.name,
        bridge: []
      }));
      this.$message({type: 'success', message: `成功加入${item.name}房间`})
    },
    //判断用户是否是房间成员
    checkUserIsGroup (item) {
      return item.users.some(item=>{
        return item.uid === this.uid
      })
    },
    //创建房间
    createGroup(){
      this.groupName = this.groupName.trim();
      if(!this.groupName){
        this.$message({type: 'error', message: '请输入房间名称'})
        return;
      }
      this.socket.send(JSON.stringify({
        uid: this.uid,
        type: 10,
        nickname: this.nickname,
        groupName: this.groupName,
        bridge: []
      }));
    },
    // 切换到群聊
    async triggerGroup(item) {
      let issome = item.users.some(item=>{
        return item.uid === this.uid
      })
      if(!issome){
        this.$message({type: 'error', message: `您还不是${item.name}房间成员`})
        return
      }
      this.bridge = [];
      this.groupId = item.id;
      this.title = `当前房间：${item.name}`;
      let history = await this.getHistory()

      this.history = history
    },
    // 切换到某个用户
    async triggerPersonal(item) {
      if(this.uid === item.uid){
        return;
      }
      this.groupId = '';
      this.bridge = [this.uid, item.uid];// 将当前用户uid，和需要对话的uid放入bridge
      this.title = `${item.nickname}`;
      getuser=item.nickname;
      let history = await this.getHistory()
      this.history = history
    },
    send(){
      this.msg = this.msg.trim();//删除字符串中的空白字符串

      if(!this.msg){
        return
      }
      if(this.bridge.length === 0 && this.groupId === ""){
        this.$message({type: 'error', message: '请选择发送人或者房间'})
        return;
      }
      // console.log(this.msg);
      let sensiti=['妈的','你妹的','傻逼','sb','操']
      for(let i=0;i<sensiti.length;i++){
        if(this.msg.indexOf(sensiti[i])!==-1){
          this.msg='***';
          break;
        }
      }
      this.sendMessage(100, this.msg)

    },
    sendMessage(type,msg){

      this.socket.send(JSON.stringify({
        uid: this.uid,
        type: type,
        nickname: this.nickname,
        msg: msg,
        bridge: this.bridge,
        groupId: this.groupId,
      }));
      this.handleHistory(type, msg)
      this.msg = '';
    },
    // 保存历史记录
    handleHistory(type, msg){
      if(type === 100 || type === 30 || type === 40){
        let data = {
          type,
          sender: this.uid,
          receiver: {
            group: false,
            id: ""
          },
          value: {
            "content": "",
            "filename": ""
          }
        }
        // 判断接收人是群组还是用户
        if(this.bridge.length > 0){
          // 用户
          data.sender = this.bridge.filter(val=>val==this.uid)[0]
          data.receiver.id = this.bridge.filter(val=>val!=this.uid)[0]
        }else{
          // 群组
          data.receiver.group = true,
          data.receiver.id = this.groupId
        }
        switch(type){
          case 100:
            data.value.content = msg
            break;
          case 30:
            data.value.content = this.HOST + '/public/images/' + msg.split("@*****@")[0]
            data.value.filename = msg.split("@*****@")[0]
            break;
          case 40:
            data.value.content = this.HOST + '/public/files/' + msg.split("@*****@")[1]
            data.value.filename = msg.split("@*****@")[1]
            break;
          default:
            return;
        }
        this.$axios.post(this.HOST+'/api/sendmessage',data)
      }
    },
    // 获取聊天记录
    async getHistory(){
      let data = {
        receiver: {
          group: false,
          id: null
        },
        sender: this.uid
      }
      // 判断当前聊天是群组还是用户
      if(this.bridge.length > 0){
        // 用户
        data.receiver.id = this.bridge.filter(val=>val!=this.uid)[0]
      }else if(this.groupId){
        // 群组
        data.receiver.group = true
        data.receiver.id = this.groupId
      }else{
        return;
      }
      let res = await this.$axios.post(this.HOST+'/api/getHistory',data)
      return res.data
    },
    //发送图片至后端
    sendImg(){
      let img = this.$refs.imgUploader.files[0]
      if (img.size > 5*1024*1024) {
          this.$refs.uploadForm.reset() //清空input file
          console.log("图片超出大小限制")
          alert("图片最大为5M")
          return;
      }
      let reader = new FileReader()
      let _this = this
      if (img) {
        reader.onload = function (event) {
          let base64 = event.target.result
          let fileType = base64.match(/(?<=^data:image\/)\w+(?=;base64,)/)[0]
          let fileName = `${new Date().getTime()}.${fileType}`
          _this.sendMessage(30,fileName + "@*****@" + base64)
          _this.$refs.uploadForm.reset() //清空input file
          console.log("图片发送成功")
        };
      }

      reader.readAsDataURL(img)//将文件转换成base64编码
    },
    uploadFileChange(){
      let file = this.$refs.fileUploader.files[0]
      if (file.size > 5*1024*1024) {
        this.$refs.uploadForm.reset() //清空input file
        console.log("文件超出大小限制")
        alert("文件最大为5M")
        return;
      }
      this.uploadFileName = file.name
      this.uploadBoxShow = true
    },
    sendFile(){
      let file = this.$refs.fileUploader.files[0]
      this.uploading = true
      this.uploadFileName = "上传中……"
      let reader = new FileReader()
      let _this = this
      if (file) {
        reader.onload = function (event) {
          let base64 = event.target.result//
          let time = new Date()
          _this.sendMessage(40,time.getTime()+"@*****@"+file.name+"@*****@"+base64)
          _this.$refs.uploadForm.reset() //清空input file
          _this.uploading = false
          _this.uploadFileName = ""
          _this.uploadBoxShow = false
          console.log("文件发送成功")
        };
      }
      reader.readAsDataURL(file)//将文件转换成base64编码
    },
    clearFile(){
      this.$refs.uploadForm.reset()
      this.uploadBoxShow = false
    },
    downloadFile(timeStamp){
      this.sendMessage(50,timeStamp)
    },
    downloadFileFromUrl(url,filename){
      fetch(url).then(res=>res.blob()).then(blob=>{
        let vurl = window.URL.createObjectURL(blob);
        let link = this.$refs.downloadFileTag;
        link.href = vurl;
        link.download = filename;
        link.click();
        window.URL.revokeObjectURL(vurl)
      })
    },
    resolveFile(base64,filename){
      let arr = base64.split(','),
          mime = arr[0].match(/:(.*?);/)[1],
          bstr = atob(arr[1]),
          n = bstr.length,
          u8arr = new Uint8Array(n)
      while (n--) {
          u8arr[n] = bstr.charCodeAt(n)
      }
      let blob = new Blob([u8arr], { type: mime })
      blob.lastModifiedDate = new Date();
      blob.name = filename;
      let url = window.URL.createObjectURL(blob);
      let link = this.$refs.downloadFileTag;
      link.href = url;
      link.download = filename;
      link.click();
      window.URL.revokeObjectURL(url)
    },
    conWebSocket(){
      let vm = this;
      if(window.WebSocket){
        vm.socket = new WebSocket('ws://localhost:8001');
        let socket = vm.socket;
        let _this = this
        socket.onopen = function(e){
          console.log("连接服务器成功");
          vm.$message({type: 'success', message: '连接服务器成功'})
//           if(!vm.uid){// 生成新的用户id,并存入localStorage
//             vm.uid = 'web_im_' + moment().valueOf();
//             localStorage.setItem('WEB_IM_USER', JSON.stringify({
//               uid: vm.uid,
//               nickname: vm.nickname
//             }))
//           }
          vm.sendMessage(1)
        }
        socket.onclose = function(e){
          console.log("服务器关闭");
        }
        socket.onerror = function(){
          console.log("连接出错");
        }
        // 接收服务器的消息
        socket.onmessage = function(e){
          let message = JSON.parse(e.data);
          vm.messageList.push(message);
          if(message.users) {//有users就赋值给users
            vm.users = message.users;
          }
          if (message.groups){//有groups群组就赋值给groups
            vm.groups = message.groups;
          }

          vm.$nextTick(function(){
            var div = document.getElementById('im-record');
            div.scrollTop = div.scrollHeight;
          })
          if(message.type === 5){
            _this.resolveFile(message.msg,message.filename)
          }
        }
      }
    },

    login(){
      this.nickname = this.nickname.trim();
      if(!this.nickname){
        this.$message({type: 'error', message: '请输入您的昵称'})
        return;
      }
      this.$refs.loginDialog.hide()
      this.conWebSocket();
    }
  }
}
</script>

<style lang='stylus'>
  @import '../../assets/css/app.styl';
  .file
  {
    position:relative;
    overflow:hidden;
  }
  .file input[type=file]
  {
    position:absolute;
    z-index:1 !important;
    font-size:12px !important;
    width:0px !important;
    opacity:0;
    display:block !important;
    border: 1px solid red;
  }
  .fileUpload{
    position: absolute;
    width:210px;
    height:60px;
    background-color: #fff;
    bottom:10px;
    left:10px;
    border-radius:10px;
    color:#000;
    padding:10px;
    box-sizing:border-box;
    border:2px solid #a0a0a0;
    display:flex;
    justify-content: center;
    align-items:center;
  }
  .fileUpload > .content{
    flex:1;
    overflow: scroll;
    white-space: nowrap;
    font-size:14px;
    font-weight:bold;
    box-sizing: border-box;
    padding: 0 2px;
  }
  .history{
    height:100%;
    width:100%;
    display:flex;
    flex-direction:column;
    box-sizing:border-box;
  }
  .history .tabs{
    display:flex;
    padding: 3px 5px;
  }
  .history .tabs .item{
    width:60px;
    margin: 0 5px;
    text-align:center;
    color:#fff;
    border-radius: 5px;
    font-size:12px;
    padding: 3px 0;
    cursor:pointer;
  }
  .history .tabs .item.active{
    background-color:#00b7a3;
  }
  .history .content{
    flex-grow:1;
    display:flex;
    flex-direction:column;
    padding: 5px 10px;
    overflow-y:scroll;
    overflow-x:hidden;
    border-left:none!important;
  }
  .history .content .item{
    margin-bottom:10px;
    height:auto;
  }
  .history .content .item .title{
    font-size:14px;
    font-weight:bold;
    color:#409eff;
  }
  .history .content .item .msg{
    font-size:13px;
    margin-top:5px;
    padding-left:1em;
    // border:1px solid black;
  }
  .history .content .item .msg .image{
    width:50%;
    height:auto;
  }
  .history .content .item .msg .image img{
    width:100%;
    height:100%;
    display:block;
  }
  .history .content .item .msg .file{
    border: 2px solid #999;
    border-radius: 5px;
    padding:5px;
    display:flex;
    justify-content: space-between;
    align-items:center;
  }
  .history .content .item .msg .file .name{
    width: 65%;
    overflow:hidden;
    text-overflow:ellipsis;
    word-wrap:nowrap;
  }
  .emojipicker{
    position:absolute;
    z-index:999;
    bottom:30px;
    left:-60px;
  }
</style>

