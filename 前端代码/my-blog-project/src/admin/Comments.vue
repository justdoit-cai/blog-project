<template>
    <div>
        <el-table
                :data="tableData"
                stripe
                style="width: 100%">
            <el-table-column
                    type="index"
                    width="50">
            </el-table-column>
            <el-table-column
                    prop="commentatorUsername"
                    label="用户名"
                    width="250">
            </el-table-column>
            <el-table-column
                prop="content"
                label="评论内容"
                width="150">
            </el-table-column>
            <el-table-column
                    prop="createTime"
                    label="评论时间"
                    width="250">
            </el-table-column>
            <el-table-column
                prop="likeNum"
                label="点赞数"
                width="250">
            </el-table-column>
            <el-table-column label="操作" width="250">
                <template slot-scope="scope">
                    <el-button
                        size="mini"
                        type="success"
                        @click="handleRead(scope.$index, scope.row)">查看原文
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
                :total="total">
        </el-pagination>

    </div>

</template>

<script>

import axios from "axios";

export default {
    data() {
        return {
            dialogEdit: false,
            tableData: [],
            currentPage: 1,
            total: 0
        }
    },
    created() {
        this.selectAll(1)
    },
    methods: {
        selectAll(page) {
            axios.get("/comment/all/" + page).then((response) => {
                this.tableData = response.data.data
            })
            axios.get("/comment/size").then((response) => {
                this.total = response.data.data
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
                axios.delete("/comment/" + row.id).then((response) => {
                    console.log(response)
                    if (response.data.error === null) {
                        this.$message.success("删除成功!");
                        this.selectAll(1);
                    } else {
                        this.$message.error("删除失败!");
                    }
                })
            }).catch(() => {
                this.$message.info("取消删除操作");
            })
        },
        handleRead(index, row) {
            this.$router.push("/passage/" + row.passageId)
        }
    }
}
</script>