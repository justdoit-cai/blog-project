<template>
    <div style="background-color: white; width: 80%;margin-left: 10%;margin-right: 10%">
        <div @click="inputFocus" class="my-reply" style="background-color: lightskyblue">
            <el-avatar class="header-img" :size="40" :src="user.avatar"></el-avatar>
            <div class="reply-info">
                <div
                        tabindex="0"
                        contenteditable="true"
                        id="replyInput"
                        spellcheck="false"
                        placeholder="输入评论..."
                        class="reply-input"
                        @click="btnShow=true"
                >
                </div>
            </div>
            <div class="reply-btn-box" v-show="btnShow">
                <el-button class="reply-btn" size="medium" @click="sendComment" type="primary">发表评论</el-button>
            </div>
        </div>
        <div v-for="(item,i) in commentList" :key="i" class="author-title reply-father">
            <el-avatar class="header-img" :size="40" :src="item.commentatorAvatar"></el-avatar>
            <div class="author-info">
                <span class="author-name">{{ item.commentatorUsername }}</span>
                <span class="author-time">{{ item.createTime }}</span>
            </div>
            <div class="icon-btn">
                <i class="fa fa-heart-o" @click="increaseLikeNum(i)"></i>{{ item.likeNum }}
            </div>
            <div class="talk-box">
                <p>
                    <span class="reply">{{ item.content }}</span>
                </p>
            </div>
        </div>
    </div>
</template>

<!--https://blog.csdn.net/zLanaDelRey/article/details/100997792-->
<script>

export default {
    name: 'CommentArea',
    props: ["id"],
    created() {
        this.user = this.$store.getters.getUser
        this.selectAll()
    },
    data() {
        return {
            btnShow: false,
            user: {},
            commentList: [],
            comment: {},
        }
    },
    methods: {
        selectAll() {
            console.log("current passage is " + this.id)
            this.$http.get("/comment/" + this.id).then((response) => {
                this.commentList = response.data.data
            })
        },
        increaseLikeNum(i) {
            this.commentList[i].likeNum++
            this.$http.post("/comment/like/" + this.commentList[i].id).then((response) => {
                if (response.data.error !== null) {
                    this.$message.error(response.data.msg)
                    return
                }
                this.$message.success("点赞成功!")
            })
        },
        inputFocus() {
            var replyInput = document.getElementById('replyInput');
            replyInput.style.padding = "8px 8px"
            replyInput.style.border = "2px solid blue"
            replyInput.focus()
        },
        sendComment() {
            if (this.user === null || this.user === '') {
                this.$message.error("请先登录")
                return
            }
            var content = document.getElementById('replyInput').innerHTML
            if (content === '') {
                this.$message.error("评论不能为空")
                return;
            }
            //不能这样子提交，否则返回400
            // var comment = {
            //     id: 1,
            //     passageId: parseInt(this.id),
            //     content: content,
            //     commentatorId: this.user.id,
            //     commentatorUsername: this.user.username,
            //     // createTime: '2023-1-1 12:21',
            //     likeNum: 0,
            //     del: 0
            // }
            this.comment.passageId = this.id
            this.comment.content = content
            this.comment.commentatorId = this.user.id
            this.comment.commentatorUsername = this.user.username

            this.$http.post("/comment/add", this.comment).then((response) => {
                if (response.data.error !== null) {
                    this.$message.error(response.data.msg)
                    return
                }
                this.commentList.push(this.comment)
                this.$message.success("添加成功")
                this.selectAll()
                document.getElementById('replyInput').innerHTML = ''
                this.btnShow = false
            })
        },
        dateStr(date) {
            //获取js 时间戳
            var time = new Date().getTime();
            //去掉 js 时间戳后三位，与php 时间戳保持一致
            time = parseInt((time - date) / 1000);
            //存储转换值
            var s;
            if (time < 60 * 10) {//十分钟内
                return '刚刚';
            } else if ((time < 60 * 60) && (time >= 60 * 10)) {
                //超过十分钟少于1小时
                s = Math.floor(time / 60);
                return s + "分钟前";
            } else if ((time < 60 * 60 * 24) && (time >= 60 * 60)) {
                //超过1小时少于24小时
                s = Math.floor(time / 60 / 60);
                return s + "小时前";
            } else if ((time < 60 * 60 * 24 * 30) && (time >= 60 * 60 * 24)) {
                //超过1天少于30天内
                s = Math.floor(time / 60 / 60 / 24);
                return s + "天前";
            } else {
                //超过30天ddd
                // var date = new Date(parseInt(date));
                date = new Date(parseInt(date));
                return date.getFullYear() + "/" + (date.getMonth() + 1) + "/" + date.getDate();
            }
        },
    },
}
</script>

<style scoped lang="css">
.my-reply {
    padding: 10px;
    background-color: #fafbfc;
}

.my-reply .header-img {
    display: inline-block;
    vertical-align: top;
}

.my-reply .reply-info {
    display: inline-block;
    margin-left: 5px;
    width: 90%;
}

@media screen and (max-width: 1200px) {
    .my-reply .reply-info {
        width: 80%;
    }
}

.my-reply .reply-info .reply-input {
    min-height: 20px;
    line-height: 22px;
    padding: 10px 10px;
    color: #ccc;
    background-color: #fff;
    border-radius: 5px;
}

.my-reply .reply-info .reply-input:empty:before {
    content: attr(placeholder);
}

.my-reply .reply-info .reply-input:focus:before {
    content: none;
}

.my-reply .reply-info .reply-input:focus {
    padding: 8px 8px;
    border: 2px solid #00f;
    box-shadow: none;
    outline: none;
}

.my-reply .reply-btn-box {
    height: 25px;
    margin: 10px 0;
}

.my-reply .reply-btn-box .reply-btn {
    position: relative;
    float: right;
    margin-right: 15px;
}

.my-comment-reply {
    margin-left: 50px;
}

.my-comment-reply .reply-input {
    width: flex;
}

.author-title:not(:last-child) {
    border-bottom: 1px solid rgba(178, 186, 194, 0.3);
}

.author-title {
    margin-top: 1rem;
    padding: 10px;
}

.author-title .header-img {
    display: inline-block;
    vertical-align: top;
}

.author-title .author-info {
    display: inline-block;
    margin-left: 5px;
    width: 60%;
    height: 40px;
    line-height: 20px;
}

.author-title .author-info > span {
    display: block;
    cursor: pointer;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}

.author-title .author-info .author-name {
    color: #000;
    font-size: 18px;
    font-weight: bold;
}

.author-title .author-info .author-time {
    font-size: 14px;
}

.author-title .icon-btn {
    width: 30%;
    padding: 0 !important;
    float: right;
}

@media screen and (max-width: 1200px) {
    .author-title .icon-btn {
        width: 20%;
        padding: 7px;
    }
}

.author-title .icon-btn > span {
    cursor: pointer;
}

.author-title .icon-btn .iconfont {
    margin: 0 5px;
}

.author-title .talk-box {
    margin: 0 50px;
}

.author-title .talk-box > p {
    margin: 0;
}

.author-title .talk-box .reply {
    font-size: 16px;
    color: #000;
}

.author-title .reply-box {
    margin: 10px 0 0 50px;
    background-color: #efefef;
}

</style>