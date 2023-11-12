<template>
    <div>
        <div>
            <div style="background-image: url('/bg4.jpg');background-size: 100% 100%;overflow: hidden">
                <el-card class="box-card" style="width: 80%;margin-left: 10%;margin-bottom: 100px;margin-top: 150px">
                    <div slot="header" class="clearfix">
                        <h1>{{ passage.title }}</h1>
                    </div>
                    <div>
                        <div>
                            <el-descriptions>
                                <el-descriptions-item label="描述">{{ passage.description }}</el-descriptions-item>
                                <el-descriptions-item label="发布时间">{{ passage.createTime }}</el-descriptions-item>
                                <el-descriptions-item label="最近更改">{{ passage.updateTime }}</el-descriptions-item>
                                <el-descriptions-item label="作者">{{ passage.authorName }}</el-descriptions-item>
                                <el-descriptions-item label="文章类型">
                                    <el-tag size="small">{{ passage.type }}</el-tag>
                                </el-descriptions-item>
                                <el-descriptions-item label="评论数">{{passage.commentNum}}</el-descriptions-item>
                            </el-descriptions>
                        </div>
                        <div>
                            <markdown-it-vue-light :content="passage.content"
                                                   style="margin-left: 10%;margin-right: 10%;"></markdown-it-vue-light>
                        </div>
                        <div>
                            <br>
                            <el-button type="primary" @click="increaseLikeNum">点赞此文</el-button>
                            此篇文章当前共有 {{passage.likeNum}} 次点赞
                        </div>
                    </div>
                </el-card>
                <div class="box-card" style="width: 80%;margin-left: 10%;margin-bottom: 200px;">
                    <CommentArea :id="id"></CommentArea>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Header from "@/components/Header.vue";
import Footer from "@/components/Footer.vue";
import CommentArea from "@/components/CommentArea.vue";

export default {
    components: {CommentArea, Footer, Header},
    props: ['id'],
    data() {
        return {
            passage: {}
        }
    },
    created() {
        this.select()
    },
    methods: {
        select(){
            this.$http.get("/passage/" + this.id).then((response) => {
                if (response.data.error !== null){
                    this.$message.error(response.data.msg)
                    return
                }
                this.passage = response.data.data
            })
        },
        increaseLikeNum() {
            this.$http.post("/passage/like/" + this.id).then((response) => {
                if (response.data.error !== null){
                    this.$message.error(response.data.msg)
                    return
                }
                this.$message.success("点赞成功!")
                this.select()
            })
        }
    }
}
</script>
<style scoped>

.clearfix:before,
.clearfix:after {
    display: table;
    content: "";
}

.clearfix:after {
    clear: both
}

.box-card {
    width: 480px;
}
</style>