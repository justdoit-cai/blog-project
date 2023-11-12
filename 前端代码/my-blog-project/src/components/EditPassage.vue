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
                        <el-button type="primary" @click="submitForm">保存更新</el-button>
                        <el-button @click="resetForm">取消更新</el-button>
                    </el-form-item>
                </el-form>
            </div>
        </el-card>
    </div>
</template>

<script>
import passage from "@/components/Passage.vue";

export default {
    name: "EditPassage",
    props: ['id'],
    data() {
        return {
            passage: {},
            resetPassage: {},
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
                    this.$http.post("/passage/", this.passage).then((response) => {
                        if (response.data.error !== null){
                            this.$message.error(response.data.msg)
                            return
                        }
                        this.$message.success("更新成功!")
                    })
                } else {
                    console.log("error")
                }
            })
        },
        resetForm() {
            console.log(this.resetPassage)
            //这里需要注意，这里是对象，如果只是普通赋值，三个会一起变
            this.passage = JSON.parse(JSON.stringify(this.resetPassage))
        }

    },
    created() {
        this.$http.get("/passage/" + this.id).then((response) => {
            if (response.data.error !== null){
                this.$message.error(response.data.msg)
            }else {
                this.passage = response.data.data
                //这里需要注意，这里是对象，如果只是普通赋值，三个会一起变
                this.resetPassage = JSON.parse(JSON.stringify(response.data.data))
            }
        })
    },

}
</script>

<style scoped>
.m-content {
    width: 100%;
}
</style>