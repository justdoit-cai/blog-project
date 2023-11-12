<template>
    <div id="wrapper">
        <div id="register-box">
            <h1>注册</h1>
            <el-form ref="registerForm" :model="registerForm" :rules="registerRules">
                <el-form-item prop="username">
                    <i class="fa fa-user" aria-hidden="true"></i>
                    <el-input type="text" placeholder="请输入账号" v-model="registerForm.username"></el-input>
                </el-form-item>>
                <el-form-item prop="password">
                    <i class="fa fa-key" aria-hidden="true"></i>
                    <el-input type="password" placeholder="请输入密码" v-model="registerForm.password"></el-input>
                </el-form-item>>
                <el-form-item prop="password2">
                    <i class="fa fa-key" aria-hidden="true"></i>
                    <el-input type="password" placeholder="再次输入密码" v-model="registerForm.password2"></el-input>
                </el-form-item>
            </el-form>>
            <el-button @click="handlerRegister">注册</el-button>
            <el-button @click="handlerLogin">返回登录</el-button>
        </div>
    </div>
</template>

<script>
export default {
    name: "Register",
    data(){
        let validatePassword = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入密码'));
            } else if(this.registerForm.password !== this.registerForm.password2){
                callback(new Error('两次密码输入的不一致'));
            } else {
                callback();
            }
        };
        return {
            registerForm: {
                username: '',
                password: '',
                password2: '',
            },
            registerRules: {
                username: [
                    {required: true, message: '请输入账号', trigger: 'blur'},
                    {min: 8, max: 20, message: '账号长度需在8~20位之间', trigger: 'blur'},
                ],
                password: [
                    {min: 6, max: 20, message: '密码长度需在6~20位之间', trigger: 'blur'},
                ],
                password2: [
                    {min: 6, max: 20, message: '密码长度需在6~20位之间', trigger: 'blur'},
                    //这里是validator而不是validate
                    {validator: validatePassword, trigger: 'blur'}
                ]
            }
        }
    },
    methods: {
        handlerLogin(){
            this.$router.push("/login")
        },
        handlerRegister(){
            this.$refs["registerForm"].validate((valid) => {
                if (valid) {
                    this.registerForm.password = this.$md5(this.registerForm.password)
                    this.registerForm.password2 = this.$md5(this.registerForm.password2)
                    this.$http.post("/register", this.registerForm).then((response) => {
                        if (response.data.error !== null){
                            this.$message.error(response.data.msg)
                            return
                        }
                        this.$message.success("注册成功")
                        this.$router.push("/login")
                    })
                } else {
                    console.log("error")
                }
            })
        }
    }
}
</script>

<style scoped>
#register-box {
    width: 30%;
    height: auto;
    margin: 10% auto 0;
    text-align: center;
    background: #00000080;
    padding: 20px 50px;
}

#register-box h1 {
    color: #ffffff;
}

#register-box .form {
    margin-top: 50px;
}

#register-box .form i {
    font-size: 18px;
    color: #ffffff;
}

#register-box .form .item {
    margin-top: 15px;
}

#register-box .form .item input {
    width: 180px;
    font-size: 18px;
    border: 0;
    border-bottom: 2px solid #ffffff;
    padding: 5px 10px;
    background: #ffffff00;
    color: #ffffff;
}

#register-box button {
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