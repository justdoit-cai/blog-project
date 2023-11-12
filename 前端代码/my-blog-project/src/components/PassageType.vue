<template>
    <div>
        <div style="background-image: url('/bg3.jpg');background-size: 100% 100%;width: 100%;overflow: hidden;z-index: -1">
            <br><br><br><br><br><br>
            <div v-for="item in passageList" :key="item.id" class="text item" style="width: 50%;margin-left: 25%">
                <el-card class="box-card">
                    <el-descriptions :title="item.title" style="text-align: center">
                        <el-descriptions-item label="描述">{{ item.description }}</el-descriptions-item>
                        <el-descriptions-item label="发布时间">{{ item.createTime }}</el-descriptions-item>
                        <el-descriptions-item label="最近更改">{{ item.updateTime }}</el-descriptions-item>
                        <el-descriptions-item label="作者">{{ item.authorName }}</el-descriptions-item>
                        <el-descriptions-item label="文章类型">
                            <el-tag size="small">{{ item.type }}</el-tag>
                        </el-descriptions-item>
                        <el-descriptions-item label="评论数">{{item.commentNum}}</el-descriptions-item>
                    </el-descriptions>
                    <el-card class="box-card">
                        <markdown-it-vue-light :content="item.content"></markdown-it-vue-light>
                    </el-card>
                    <br>
                    <el-button @click="handlerReadPassage(item.id)">阅读原文</el-button>
                </el-card>
                <br><br><br><br><br><br>
            </div>
            <div>
                <div class="block">
                    <el-pagination
                            @current-change="handleCurrentChange"
                            :current-page="currentPage"
                            :page-size="5"
                            layout="total, prev, pager, next, jumper"
                            :total="passageListSize">
                    </el-pagination>
                </div>
            </div>
            <br><br><br>
        </div>
    </div>
</template>

<script>
import axios from "axios";

export default {
    name: "PassageType",
    props: ['type'],
    data() {
        return {
            passageList: [{
                id: '',
                title: '',
                authorId: '',
                authorName: '',
                createTime: '',
                updateTime: '',
                type: '',
                description: '',
                content: ''
            }],
            passageListSize: 1,
            currentPage: 1,
        }
    },
    methods: {
        selectAll(page) {
            axios.get("/type/passage/" + this.type + "/" + page).then((response) => {
                this.passageList = response.data.data
            })
            axios.get("/type/passage/size/" + this.type).then((response) => {
                this.passageListSize = response.data.data
                console.log(this.passageListSize)
            })
        },
        handleCurrentChange(page) {
            console.log(`当前页: ${page}`);
            this.selectAll(page)
        },
        handlerReadPassage(id) {
            console.log(id)
            this.$router.push("/passage/" + id)
        }
    },
    created() {
        this.selectAll(1)
    },
}
</script>

<style scoped>

</style>