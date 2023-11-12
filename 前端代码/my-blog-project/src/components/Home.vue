<template>
  <div>
      <div>
          <div style="background-image: url('https://cdn.naccl.top/blog/img/bg1.jpg');background-size: 100% 100%;width: 100%;height: 1050px">
              <div class="banner-container">
                  <el-row style="height: 95vh">
                      <el-col :span="24" style="height: 100%">
                          <div shadow="none" class="welcome">
                              <h1 class="tit">
                                  欢迎来到Justdoit个人博客
                                  <div class="border"></div>
                              </h1>
                              <h2 class="intro">{{ intro }}</h2>
                          </div>
                      </el-col>
                  </el-row>
              </div>
          </div>
      </div>
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
  </div>
</template>

<script>
import axios from "axios";

export default {
    name: "Home",
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
            passageListSize: 0,
            intro: '',
            currentPage: 1,
        }
    },
    methods: {
            selectAll(page) {
                axios.get("/passage/index/" + page).then((response) => {
                    this.passageList = response.data.data
                })
                axios.get("/passage/size").then((response) => {
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
    mounted() {
        let str = '这是我的博客、会分享关于编程、开发的一些内容，以后也会写一些随笔，希望可以对您有所帮助...';
        let idx = 0;
        let that = this
        let timer = setTimeout(function fn() {
            // console.log(this.intro)
            that.intro = that.intro + str.substring(idx, idx + 1)
            idx++
            if (idx > str.length) {
                that.intro = ''
                idx = 0
            }
            setTimeout(fn, 200)
        }, 2000)
    }
}
</script>

<style scoped>
.banner-container {

    line-height: 1.5;
    color: #eee;
    position: absolute;
    top: 10%;
    left: 5%;
    width: 90%;
    height: 100%;


}
.intro {
    letter-spacing: 5px;
    line-height: 50px;
    width: 80%;
    margin: 0 auto;
    text-align: center;
    font-weight: normal;
    color: black;
}
.tit {
    box-sizing: border-box;
    position: relative;
    width: 800px;
    height: 100px;
    line-height: 100px;
    box-shadow: inset 0 0 0 1px white;
    margin: 40px auto;
    margin-top: 80px;
    color: darkorange;
    text-align: center;
    font-size: 50px;
    font-weight: normal;
    letter-spacing: 10px;
}
/*.item {*/
/*    border-radius: 10em;*/
/*    font-family: Lato,'Helvetica Neue',Arial,Helvetica,sans-serif;*/
/*    background: #E0E1E2;*/
/*    margin: 0 15px 0 0;*/
/*    line-height: 1em;*/
/*    text-align: center!important;*/
/*    font-style: normal;*/
/*    text-decoration: none;*/

/*    transition: opacity .1s ease,background-color .1s ease,color .1s ease,box-shadow .1s ease,background .1s ease;*/
/*    opacity: 0.4 !important;*/
/*    color: rgba(0,0,0,.6);*/
/*    padding: 11px 12px 11px 12px;*/
/*    min-height: 1em;*/
/*    vertical-align: baseline;*/

/*    outline: 0;*/
/*}*/



</style>