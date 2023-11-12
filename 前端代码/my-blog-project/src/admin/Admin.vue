<template>
    <el-container class="admin-container" style="background-image: url(/bg3.jpg);overflow: hidden;background-size: 100% 100%;">
        <el-header>
            <div>
                <img alt="" height="60" src="../assets/logo.png">
                <span>博客后台管理</span>
                <span style="margin-left: 20px">{{ user.username }}</span>
                <el-divider direction="vertical"></el-divider>
                <span><el-link href="/" style="color: white">主页</el-link></span>
                <Header></Header>
            </div>
            <!-- 头像 -->
            <el-dropdown class="user" trigger="click" @command="logout">
                <div class="el-dropdown-link">
                    <el-avatar :size="45" :src="user.avatar" fit="contain" shape="circle"></el-avatar>
                </div>
                <el-dropdown-menu slot="dropdown">
                    <el-dropdown-item icon="ali-iconfont icon-logout" @click="logout">退出</el-dropdown-item>
                </el-dropdown-menu>
            </el-dropdown>
        </el-header>
        <el-container>
            <el-aside :width="isCollapse? '64px' : '190px'">
                <div class="toggle-button" @click="isCollapse=!isCollapse">
                    <i :class="isCollapse?'el-icon-s-unfold':'el-icon-s-fold'"></i>
                </div>
                <el-menu
                        class="el-menu-vertical-demo"
                        :collapse="isCollapse"
                        :collapse-transition="false"
                        active-text-color="#409eff"
                        background-color="honeydew"
                        :default-active="$store.state.activePath"
                        :router="true"
                        text-color="black">
                    <el-submenu index="1">
                        <template slot="title">
                            <i class="el-icon-menu"></i>
                            <span>博客管理</span>
                        </template>
                        <el-menu-item :index=this.pathBlogList>
                            <template slot="title">
                                <i class="el-icon-s-order"></i>
                                <span>文章管理</span>
                            </template>
                        </el-menu-item>
                        <el-menu-item :index="this.pathComments">
                            <template slot="title">
                                <i class="el-icon-s-comment"></i>
                                <span>评论管理</span>
                            </template>
                        </el-menu-item>
                    </el-submenu>
                    <el-submenu index="2">
                        <template slot="title">
                            <i class="el-icon-document-copy"></i>
                            <span slot="title">页面管理</span>
                        </template>
                        <el-menu-item :index=this.pathAbout>
                            <template slot="title">
                                <i class="el-icon-edit"></i>
                                <span>关于我</span>
                            </template>
                        </el-menu-item>
                    </el-submenu>
                    <el-submenu index="3">
                        <template slot="title">
                            <i class="el-icon-document"></i>
                            <span slot="title">系统管理</span>
                        </template>
                        <el-menu-item :index=this.pathUserManage>
                            <template slot="title">
                                <i class="el-icon-user-solid"></i>
                                <span>用户管理</span>
                            </template>
                        </el-menu-item>
                    </el-submenu>
                    <el-submenu index="4">
                        <template slot="title">
                            <i class="el-icon-setting"></i>
                            <span slot="title">日志管理</span>
                        </template>
                        <el-menu-item :index=this.pathLoginLog>
                            <template slot="title">
                                <i class="el-icon-finished"></i>
                                <span>登录日志</span>
                            </template>
                        </el-menu-item>
                        <el-menu-item :index=this.pathOperationLog>
                            <template slot="title">
                                <i class="el-icon-document-checked"></i>
                                <span>操作日志</span>
                            </template>
                        </el-menu-item>
                    </el-submenu>
                </el-menu>
            </el-aside>
            <el-container>
                <!--右侧内容主体-->
                <el-main :class="isCollapse?'m-el-main-width-64':'m-el-main-width-190'">
                    <!--加 key 让组件被重用时 重新执行生命周期 否则在编辑文章页面路由到写文章页面时 数据被重用-->
                    <router-view :key="$route.fullPath"/>
                </el-main>
            </el-container>
        </el-container>
        <el-footer>


        </el-footer>
    </el-container>
</template>

<script>

export default {
    name: "Admin",
    data() {
        return {
            isCollapse: 'true',
            pathBlogList: '/blogList',
            pathComments: '/comments',
            pathAbout: '/about',
            pathUserManage: '/userManage',
            pathLoginLog: '/loginLog',
            pathOperationLog: '/operationLog',
            pathVisitLog: '/visitLog',
            user: {}
        };
    },
    methods: {
        logout() {
            this.$http.get("/logout").then((response) => {
                if (response.data.error !== null){
                    this.$message.error(response.data.ms)
                }
            })
            this.$store.commit('REMOVE_INFO')
            this.user = {}
            this.isLogin = false
            this.$message.success("退出成功!")
            this.$router.push("/")
            location.reload()
        }
    },
    created() {
        this.user = this.$store.getters.getUser
    }
}
</script>

<style>
.el-header {
    background-color: #399BDD;
    display: flex;
    justify-content: space-between;
    padding-left: 10px;
    align-items: center;
    color: #ffffff;
    font-size: 22px;
    user-select: none;
}

.el-header div {
    display: flex;
    align-items: center;
}

.el-header .title span {
    margin-left: 15px;
}

.el-aside .el-menu {
    border-right: none;
}

.admin-container {
    height: 100%;
}

.toggle-button {
    background-color: honeydew;
    font-size: 20px;
    line-height: 40px;
    color: black;
    text-align: center;
    cursor: pointer;
}
</style>
