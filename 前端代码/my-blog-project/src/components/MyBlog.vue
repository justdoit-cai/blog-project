<template>
    <div>
        <el-table
                :data="tableData"
                stripe
                style="width: 100%">
            <el-table-column
                    fixed
                    type="index"
                    width="50">
            </el-table-column>
            <el-table-column
                    prop="title"
                    label="文章标题"
                    width="250">
            </el-table-column>
            <el-table-column
                    prop="description"
                    label="文章介绍"
                    width="250">
            </el-table-column>
            <el-table-column
                    prop="type"
                    label="文章类型"
                    width="250">
            </el-table-column>
            <el-table-column
                    prop="createTime"
                    label="发布时间"
                    width="250">
            </el-table-column>
            <el-table-column
                    prop="updateTime"
                    label="更新时间"
                    width="250">
            </el-table-column>
            <el-table-column
                prop="likeNum"
                label="点赞数"
                width="100">
            </el-table-column>
            <el-table-column
                prop="commentNum"
                label="评论数"
                width="100">
            </el-table-column>
            <el-table-column
                prop="visitNum"
                label="访问数"
                width="100">
            </el-table-column>
            <el-table-column
                label="操作"
                width="250">
                <template slot-scope="scope">
                    <el-button
                        size="mini"
                        type="primary"
                        @click="handleRead(scope.$index, scope.row)">查看
                    </el-button>
                    <el-button
                            size="mini"
                            type="success"
                            @click="handleEdit(scope.$index, scope.row)">编辑
                    </el-button>
                    <el-button
                            size="mini"
                            type="danger"
                            @click="handleDelete(scope.$index, scope.row)">删除
                    </el-button>
                </template>
            </el-table-column>
        </el-table>
        <el-pagination
                @current-change="handleCurrentChange"
                :current-page="currentPage"
                :page-size="10"
                layout="total, prev, pager, next, jumper"
                :total="passageListSize">
        </el-pagination>

    </div>

</template>

<script>

import axios from "axios";

export default {
    data() {
        return {
            tableData: [{
                id: '',
                type: '',
                title: '',
                authorId: '',
                description: '',
                createTime: '',
                updateTime: '',
                commentNum: '',
                likeNum: '',
                visitNum: '',
            }],
            currentPage: 1,
            passageListSize: 120,
            //pageSize是写死的
            pageSize: 10
        }
    },
    created() {
        if (this.$store.getters.getUser === null || this.$store.getters.getUser === ''){
            this.$message.error("请先登录")
            this.$router.push("/login")
        }
        this.selectAll(1)
    },
    methods: {
        selectAll(page) {
            axios.get("/passage/my/" + page + "/" + this.pageSize).then((response) => {
                console.log(response.data)
                this.tableData = response.data.data
            })
            axios.get("/passage/my/size").then((response) => {
                this.passageListSize = response.data.data
                console.log(this.passageListSize)
            })
        },
        handleCurrentChange(val) {
            console.log(`当前页: ${val}`);
            this.selectAll(val)
        },
        handleDelete(index, row) {
            console.log(row)
            this.$confirm("确定删除?", "提示", {
                type: "info",
            }).then(() => {
                axios.delete("/passage/" + row.id).then((response) => {
                    console.log(response)
                    if (response.data.error === null) {
                        this.$message.success("删除成功!");
                        this.selectAll(1);
                    } else {
                        this.$message.error(response.data.msg);
                    }
                })
            }).catch(() => {
                this.$message.info("取消删除操作");
            })
        },
        handleEdit(index, row) {
            this.$router.push("/editPassage/" + row.id)
        },
        handleRead(index, row){
            this.$router.push("/passage/" + row.id)
        }
    }
}
</script>