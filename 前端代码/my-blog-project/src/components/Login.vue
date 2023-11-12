<template>
    <div id="wrapper">
        <div id="login-box">
            <h1>Login</h1>
            <el-form ref="loginForm" :model="loginForm" :rules="loginRules">
                <el-form-item prop="username">
                    <i class="fa fa-user" aria-hidden="true"></i>
                    <el-input type="text" placeholder="请输入账号" v-model="loginForm.username"></el-input>
                </el-form-item>
                <el-form-item prop="password">
                    <i class="fa fa-key" aria-hidden="true"></i>
                    <el-input type="password" placeholder="请输入密码" v-model="loginForm.password"></el-input>
                </el-form-item>
            </el-form>
            <button @click="handlerLogin">登录</button>
            <button @click="handlerRegister">注册</button>
        </div>
    </div>
</template>

<script>
import userInfo from "@/components/UserInfo.vue";

export default {
    name: "Login",
    data(){
        return {
            loginForm: {
                username: '',
                password: ''
            },
            loginRules: {
                username:[
                    {required: true, message: '请输入账号', trigger: 'blur'},
                ],
                password:[
                    {required: true, message: '请输入密码', trigger: 'blur'},
                ]
            }
        }
    },
    methods: {
        handlerLogin(){
            this.$refs["loginForm"].validate((valid) => {
                if (valid) {
                    this.loginForm.password = this.$md5(this.loginForm.password)
                    this.$http.post("/login", this.loginForm).then((response) => {
                        if (response.data.error !== null){
                            this.$message.error(response.data.msg)
                            return
                        }
                        //后端传过来的大写Authorization会转为小写的
                        var token = response.headers['authorization']
                        this.$store.commit('SET_TOKEN', token)
                        this.$store.commit('SET_USERINFO', response.data.data)
                        if (response.data.data.type === 'admin') {
                            this.$router.push("/admin")
                        }else if (response.data.data.type === 'user'){
                            this.$router.push("/")
                        }
                    })
                } else {
                    console.log("error")
                }
            })
        },
        handlerRegister(){
            this.$router.push("/register")
        }
    }
}
</script>

<style scoped>
#login-box {
    width: 30%;
    height: auto;
    margin: 10% auto 0;
    text-align: center;
    background: #00000080;
    padding: 20px 50px;
}

#login-box h1 {
    color: #ffffff;
}

#login-box .form {
    margin-top: 50px;
}

#login-box .form i {
    font-size: 18px;
    color: #ffffff;
}

#login-box .form .item {
    margin-top: 15px;
}

#login-box .form .item input {
    width: 180px;
    font-size: 18px;
    border: 0;
    border-bottom: 2px solid #ffffff;
    padding: 5px 10px;
    background: #ffffff00;
    color: #ffffff;
}

#login-box button {
    margin-top: 15px;
    width: 180px;
    height: 30px;
    font-size: 20px;
    font-weight: 700;
    border: 0;
    background-image: linear-gradient(to right, #b8cbb8 0%, #b8cbb8 0%, #ddbaee 0%, #e8a8ee 33%, #b8d9f8 66%, #59bcf5 100%);
    border-radius: 15px;
}

#wrapper {
    background: url("../../public/bg.jpg") no-repeat;
    background-size: 100% auto;
    width: 100%;
    height: 100%;
    position : absolute;
    top: 0;
}

*{
    margin : 0;
    padding : 0;
}
</style>