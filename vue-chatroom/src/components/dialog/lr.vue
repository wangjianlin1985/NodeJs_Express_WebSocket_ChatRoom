<template>
<div>
    <el-container style="height: 100%; border: 1px solid #eee">
  <el-aside width="200px"  style="background-color: rgb(238, 241, 246)">
      <h3>在线聊天室管理系统</h3>
    <el-menu :default-openeds="['1', '3']">
        
      <el-submenu index="1">
        <template slot="title"><i class="el-icon-message"></i>用户管理</template>
        <el-menu-item-group>
          <el-menu-item index="1-1">个人信息</el-menu-item>
          <el-menu-item index="1-2">登录时间</el-menu-item>
        </el-menu-item-group>
      </el-submenu>
      <el-submenu index="2">
        <template slot="title"><i class="el-icon-menu"></i>聊天记录</template>
        <el-menu-item-group>
          <el-menu-item index="2-1">个人历史记录</el-menu-item>
          <el-menu-item index="2-2">选项2</el-menu-item>
        </el-menu-item-group>
        <el-submenu index="2-4">
          <template slot="title">选项4</template>
          <el-menu-item index="2-4-1">选项4-1</el-menu-item>
        </el-submenu>
      </el-submenu>
    </el-menu>
  </el-aside>
  
  <el-container>
    <el-header style="text-align: right; font-size: 12px">
      <el-dropdown>
        <i class="el-icon-setting" style="margin-right: 15px"></i>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item>退出登录</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
      <span>1111</span>
    </el-header>
    
    <el-main>
      <el-table :data="tableData">
        <el-table-column prop="date" label="日期" width="140">
        </el-table-column>
        <el-table-column prop="name" label="姓名" width="120">
        </el-table-column>
        <el-table-column prop="address" label="地址">
        </el-table-column>
      </el-table>
    </el-main>
  </el-container>
</el-container>
</div>
</template>


<style>
/* html,body{
    width: 100%;
    height: 100%;
} */
  .el-header {
    background-color: #B3C0D1;
    color: #333;
    line-height: 60px;
  }
  
  .el-aside {
    color: #333;
  }
</style>

<script>
  export default {
    data() {
      const item = {
        date: '2016-05-02',
        name: '王小虎',
        address: '上海市普陀区金沙江路 1518 弄'
      };
      return {
        tableData: Array(20).fill(item)
      }
    }
  };
</script>