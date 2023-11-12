<template>
    <div style="background-image: url('/bg5.png');overflow: hidden;background-size: 100% 100%;">
        <el-card class="box-card" style="width: 80%;margin-left: 10%;margin-bottom: 100px;margin-top: 150px">
            <div v-if="isAdmin">
                <div v-if="isWrite">
                    <mavon-editor v-model="passage.content"></mavon-editor>
                </div>
                <div v-else>
                    <markdown-it-vue-light :content="passage.content"
                                           style="margin-left: 10%;margin-right: 10%;"></markdown-it-vue-light>
                </div>
                <br>
                <div>
                    <div v-if="isWrite">
                        <el-button @click="updatePassage">保存更改</el-button>
                        <el-button @click="resetPassage">取消更改</el-button>
                        <el-button @click="isWrite=false">返回阅读</el-button>
                    </div>
                    <div v-else>
                        <el-button @click="isWrite=true">进入编辑界面</el-button>
                    </div>
                </div>
            </div>
            <div v-else>
                <markdown-it-vue-light :content="passage.content"
                                       style="margin-left: 10%;
                                       margin-right: 10%;">
                </markdown-it-vue-light>
            </div>
        </el-card>
    </div>
</template>

<script>
export default {
    name: "About",
    data() {
        return {
            isAdmin: false,
            isWrite: false,
            user: {},
            passage: {},
            bak: {},
        }
    },
    created() {
        this.user = this.$store.getters.getUser
        if (this.user == null || this.user.username === '' || this.user.type !== 'admin') {
            this.isAdmin = false
        } else {
            this.isAdmin = true
        }
        this.select()
    },
    methods: {
        select() {
            this.$http.get("/passage/about").then((response) => {
                if (response.data.error !== null){
                    this.$message.error(response.data.msg)
                    return
                }
                this.passage = response.data.data
                this.bak = JSON.parse(JSON.stringify(this.passage))
            })
        },
        updatePassage() {
            this.$http.post("/passage/about", this.passage).then((response) => {
                if (response.data.error !== null){
                    this.$message.error(response.data.msg)
                    return
                }
                this.$message.success("修改成功!")
                this.select()
            })
        },
        resetPassage() {
            this.passage = JSON.parse(JSON.stringify(this.bak))
            this.$message.success("恢复成功!")
        }
    }
}
</script>

<style scoped>

</style>