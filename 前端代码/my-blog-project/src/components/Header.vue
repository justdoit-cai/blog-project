<template>
    <div>
        <el-header style="background-color: lightblue">
            <div>
                <img alt="" height="60" src="../assets/logo.png">
                <span>justdoit的博客</span>
                <el-divider direction="vertical"></el-divider>
                <span><router-link to="/" style="color: white;text-decoration: none">主页</router-link></span>
                <el-divider direction="vertical"></el-divider>
                <span><router-link to="/writeBlog"
                                   style="color: white;text-decoration: none">发布文章</router-link></span>
                <el-divider direction="vertical"></el-divider>
                <span><router-link to="/myBlog" style="color: white;text-decoration: none">我的文章</router-link></span>
                <el-divider direction="vertical"></el-divider>
                <span><router-link to="/type" style="color: white;text-decoration: none">分类</router-link></span>
                <el-divider direction="vertical"></el-divider>
                <span><router-link to="/about" style="color: white;text-decoration: none">关于我</router-link></span>
            </div>
            <span v-if="isLogin" style="font-size: 28px;position: relative;right: 0">
                当前用户: {{user.username}}
            </span>
            <span v-else style="font-size: 28px;position: relative;right: 0">
                当前用户: 游客
            </span>
            <div style="width: 50px;">
                <el-dropdown class="user" v-if="isLogin">
                    <div class="el-dropdown-link">
                        <el-avatar :size="45" :src="user.avatar" fit="contain" shape="circle"></el-avatar>
                    </div>
                    <el-dropdown-menu slot="dropdown">
                        <el-dropdown-item icon="ali-iconfont el-icon-s-tools" @click.native="GoToUserInfo">个人信息
                        </el-dropdown-item>
                        <el-dropdown-item icon="ali-iconfont el-icon-position" @click.native="logout">退出
                        </el-dropdown-item>
                    </el-dropdown-menu>
                </el-dropdown>
                <el-dropdown v-else class="user" trigger="click" @command="login">
                    <div class="el-dropdown-link">
                        <i class="fa fa-user-o"></i>
                    </div>
                    <el-dropdown-menu slot="dropdown">
                        <el-dropdown-item icon="ali-iconfont fa-mouse-pointer">登录</el-dropdown-item>
                    </el-dropdown-menu>
                </el-dropdown>
            </div>
        </el-header>
    </div>
</template>

<script>

export default {
    name: "Header",
    data() {
        return {
            isLogin: false,
            user: {},
        }
    },
    methods: {
        GoToUserInfo() {
            this.$router.push("/userInfo/" + this.user.id)
        },
        logout() {
            this.$store.commit('REMOVE_INFO')
            this.user = {}
            this.isLogin = false
            this.$message.success("退出成功!")
        },
        login() {
            this.$router.push("/login")
        }
    },
    created() {
        if (this.$store.getters.getUser !== '' && this.$store.getters.getUser !== null) {
            this.isLogin = true
            this.user = this.$store.getters.getUser
        } else {
            this.isLogin = false
        }
    },
}
</script>

<style scoped>
.el-header, .el-footer {
    background-color: #B3C0D1;
    color: #333;
    text-align: center;
    line-height: 60px;
}

.el-aside {
    background-color: #D3DCE6;
    color: #333;
    text-align: center;
    line-height: 200px;
}

.el-main {
    background-color: #E9EEF3;
    color: #333;
    text-align: center;
    line-height: 160px;
}

body > .el-container {
    margin-bottom: 40px;
}
</style>