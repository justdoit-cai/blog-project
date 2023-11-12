<template>
  <!--网站底部-->
    <div class="footer">
        <el-row :gutter="24" style="padding-top: 30px">
            <el-col :sm="8">
                <el-row :gutter="24" class="footer-title">
                    <el-col :span="4" :offset="7">联系博主</el-col>
                </el-row>
                <el-row :gutter="24" class="footer-content">
                    <el-col :sm="10" :offset="4">
                        QQ：2068830937<br>
                        邮箱：2068830937@qq.com
                    </el-col>
                    <el-col :sm="10">
                        <el-image :src="src" style="width: 80px; height: 80px"></el-image>
                    </el-col>
                </el-row>
            </el-col>



            <el-col :sm="8">
                <el-row :gutter="24" class="footer-title">
                    <el-col :span="24">签名</el-col>
                </el-row>
                <el-row :gutter="24" class="footer-content">
                    <el-col :span="24" style="font-size: 15px">
                        在黑白里温柔地爱彩色,在彩色里朝圣黑白
                    </el-col>
                </el-row>
            </el-col>
            <el-col :sm="8">
                <el-row :gutter="24" class="footer-title">
                    <el-col :span="24">网站信息</el-col>
                </el-row>
                <el-row :gutter="24" class="footer-content">
                    <el-col :span="24">
                        {{'总访问量: '+pv}} <br>
                    </el-col>
                </el-row>
            </el-col>

        </el-row>
        <el-divider ></el-divider>

        <el-row :gutter="24" style="height: 50px;margin-top: 25px;font-size: 12px;">
            <el-col :span="24">
                Copyright&nbsp;&copy;&nbsp;2023-2024&nbsp;Justdoit's&nbsp;Blog.&nbsp;All&nbsp;rights&nbsp;reserved.&nbsp;
            </el-col>
        </el-row>

    </div>
</template>

<script>
export default {
    name: "Footer",
    data() {
        return {
            pv: 0,
            uv: 0,
            src: "/small.jpg"
        }
    },
    methods:{
        //获取pv和uv,暂时只记录pv
        getPVAndUV(){
            this.$http.get("/pv").then((response) => {
                this.pv = response.data
            })
        }
    },
    // 监听,当路由发生变化的时候执行
    watch: {
        '$route':'getPVAndUV'
    },
    created() {
        this.getPVAndUV()
    }
}
</script>

<style scoped>
.footer-title {
    font-size: 13px;
    font-weight: bold;
    margin-bottom: 5px;
}

.footer-content {
    font-size: 13px;
}

.footer {
    margin: 0 auto;
    text-align: center;
    min-height: 20px;
    max-width: 100%;
    padding: 0 15px;
    background-color: lightskyblue;
}
</style>