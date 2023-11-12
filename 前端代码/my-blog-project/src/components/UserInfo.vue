<template>
    <div style="background-image: url('/bg.jpg');background-size: 100% 100%;overflow: hidden">
        <el-card class="box-card"
                 style="width: 60%;margin-right: 20%;margin-left: 20%;margin-bottom: 100px;margin-top: 100px">
            <el-descriptions class="margin-top" title="个人信息" :column="1" border>
                <el-descriptions-item>
                    <template slot="label">
                        头像
                    </template>
                    <el-avatar :src="userInfoUpdateForm.avatar" v-if="disabledInput"></el-avatar>
                    <el-input v-else placeholder="请输入头像图片的url地址" v-model="userInfoUpdateForm.avatar"></el-input>
                </el-descriptions-item>
                <el-descriptions-item>
                    <template slot="label">
                        <i class="el-icon-user"></i>
                        用户名
                    </template>
                    {{ userInfo.username }}
                </el-descriptions-item>
                <el-descriptions-item>
                    <template slot="label">
                        <i class="fa-id-card"></i>
                        身份
                    </template>
                    {{ userInfo.type }}
                </el-descriptions-item>
                <el-descriptions-item>
                    <template slot="label">
                        <i class="el-icon-mobile-phone"></i>
                        性别
                    </template>
                    <el-input v-model="userInfoUpdateForm.sex" :disabled="disabledInput">
                        {{ userInfoUpdateForm.sex }}
                    </el-input>
                </el-descriptions-item>
                <el-descriptions-item>
                    <template slot="label">
                        <i class="el-icon-mobile-phone"></i>
                        年龄
                    </template>
                    <el-input v-model="userInfoUpdateForm.age" :disabled="disabledInput">
                        {{ userInfoUpdateForm.age }}
                    </el-input>
                </el-descriptions-item>
                <el-descriptions-item>
                    <template slot="label">
                        <i class="fa-id-card"></i>
                        邮箱
                    </template>
                    <el-input v-model="userInfoUpdateForm.email" :disabled="disabledInput">
                        {{ userInfoUpdateForm.email }}
                    </el-input>
                </el-descriptions-item>
                <el-descriptions-item>
                    <template slot="label">
                        <i class="el-icon-mobile-phone"></i>
                        手机号
                    </template>
                    <el-input v-model="userInfoUpdateForm.phone" :disabled="disabledInput">
                        {{ userInfoUpdateForm.phone }}
                    </el-input>
                </el-descriptions-item>
                <el-descriptions-item>
                    <template slot="label">
                        <i class="el-icon-location-outline"></i>
                        居住地
                    </template>
                    <el-input v-model="userInfoUpdateForm.location" :disabled="disabledInput">
                        {{ userInfoUpdateForm.location }}
                    </el-input>
                </el-descriptions-item>
                <el-descriptions-item>
                    <template slot="label">
                        <i class="el-icon-tickets"></i>
                        备注
                    </template>
                    <el-input v-model="userInfoUpdateForm.ps" :disabled="disabledInput">
                        {{ userInfoUpdateForm.ps }}
                    </el-input>
                </el-descriptions-item>
                <el-descriptions-item>
                    <template slot="label">
                        <i class="el-icon-tickets"></i>
                        注册时间
                    </template>
                    {{ userInfo.registerTime }}
                </el-descriptions-item>
                <el-descriptions-item>
                    <template slot="label">
                        <i class="el-icon-tickets"></i>
                        上次登录
                    </template>
                    {{ userInfo.lastLogin }}
                </el-descriptions-item>
                <el-descriptions-item>
                    <template slot="label">
                        <i class="el-icon-tickets"></i>
                        个人介绍
                    </template>
                    <el-input v-model="userInfoUpdateForm.intro" :disabled="disabledInput">
                        {{ userInfoUpdateForm.intro }}
                    </el-input>
                </el-descriptions-item>
            </el-descriptions>
            <br>
            <el-button v-if="disabledInput" @click="startInput">点击修改</el-button>
            <el-row v-else>
                <el-button @click="updateUserInfo">确定更改</el-button>
                <el-button @click="quitInput">取消更改</el-button>
            </el-row>
        </el-card>
    </div>
</template>

<script>
export default {
    name: "userInfo",
    props: ["id"],
    data() {
        return {
            disabledInput: true,
            size: '',
            userInfo: {},
            userInfoUpdateForm: {}
        }
    },
    created() {
        this.selectUserInfo()
        //!!!!这里进行axios请求默认是异步的，也就是在等待请求的时候就会执行后面的内容了，
        // 所以这里当还没请求到this.userInfo时就已经给this.userInfoUpdateForm赋值了，导致它为空
        //得把这里的赋值放在异步的请求当中
        // this.userInfoUpdateForm = this.userInfo
        // console.log("userInfoUpdateForm")
        // console.log(this.userInfoUpdateForm)
    },
    methods: {
        selectUserInfo() {
            console.log(this.id)
            console.log("here")
            this.$http.get("/user/" + this.id).then((response) => {
                if (response.data.error !== null){
                    this.$message.error("请求错误")
                    return
                }
                this.userInfo = response.data.data
                this.userInfoUpdateForm = JSON.parse(JSON.stringify(this.userInfo))
                console.log("display")
                console.log(this.userInfoUpdateForm)
            })
        },
        startInput() {
            this.disabledInput = false
        },
        updateUserInfo() {
            this.$http.post("/user/updateInfo", this.userInfoUpdateForm).then((response) => {
                if (response.data.error !== null){
                    this.$message.error(response.data.msg)
                    return
                }
                this.userInfo = JSON.parse(JSON.stringify(this.userInfoUpdateForm))
                this.$message.success("提交成功")
                this.$store.commit("SET_USERINFO", this.userInfo);
                location.reload()
            })

            this.disabledInput = true
        },
        quitInput() {
            this.disabledInput = true
        }
    }
}
</script>

<style scoped>

.box-card {

}
</style>