<template>
    <div style="background-image: url('/bg5.png');background-size: 100% 100%;width: 100%;overflow: hidden;">
        <el-card style="width: 80%;margin: 20px 10% 20px 10%">
            <!--主体内容-->
            <div class="m-content">
                <!--博客内容表单-->
                <el-form ref="passage" :model="passage" :rules="passageRules" class="demo-passage" label-position="top"
                         label-width="100px">
                    <!--文章标题-->
                    <el-row :gutter="20">
                        <el-col :span="12">
                            <el-form-item label="文章标题" prop="title">
                                <el-input v-model="passage.title" placeholder="请输入标题"></el-input>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <!--文章描述-->
                    <el-row :gutter="20">
                        <el-col :span="12">
                            <el-form-item label="文章摘要" prop="description">
                                <el-input v-model="passage.description" placeholder="请输入摘要"></el-input>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <!--分类-->
                    <el-row :gutter="20">
                        <el-col :span="12">
                            <el-form-item label="分类" prop="type">
                                <el-input v-model="passage.type" placeholder="请输入分类"></el-input>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-form-item label="文章正文" prop="content">
                        <mavon-editor v-model="passage.content"></mavon-editor>
                    </el-form-item>
                    <!--提交和重置按钮-->
                    <el-form-item>
                        <el-button type="primary" @click="submitForm">立即创建</el-button>
                        <el-button @click="resetForm">重置</el-button>
                    </el-form-item>
                </el-form>
            </div>
        </el-card>
    </div>
</template>

<script>
export default {
    name: "WriteBlog",
    data() {
        return {
            passage: {
                id: '',
                title: '',
                description: '',
                content: '',
                type: '',
            },
            passageRules: {
                title: [
                    {required: true, message: '请输入标题', trigger: 'blur'},
                    {min: 2, max: 45, message: '长度在 3 到 45 个字符', trigger: 'blur'}
                ],
                description: [
                    {required: true, message: '请输入摘要', trigger: 'blur'},
                    {max: 200, message: '摘要的长度不得超过200', trigger: 'blur'}
                ],
                content: [
                    {required: true, message: '请输入内容', trigger: 'blur'}
                ],
                type: [
                    {required: true, message: '请输入文章分类', trigger: 'blur'},
                    {max: 20, message: '文章类别的长度不得超过20', trigger: 'blur'}
                ]
            }
        }
    },
    methods: {
        submitForm() {
            this.$refs['passage'].validate((valid) => {
                if (valid) {
                    console.log(this.passage)
                    this.$http.post("/passage/add", this.passage).then((response) => {
                        if (response.data.error !== null){
                            this.$message.error(response.data.error)
                            return
                        }
                        this.$message.success("上传成功!")
                        this.$router.push("/myBlog")
                    })
                } else {
                    console.log("error")
                }
            })
        },
        resetForm() {
            this.$refs["passage"].resetFields();
        }
    },
    created() {
        if (this.$store.getters.getUser === null || this.$store.getters.getUser === ''){
            this.$message.error("请先登录")
            this.$router.push("/login")
        }
    }
}
</script>

<style scoped>
.m-content {
    width: 100%;
}
</style>