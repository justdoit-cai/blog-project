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
                    prop="authorName"
                    label="用户名"
                    width="250">
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
            <el-table-column label="操作" width="250">
                <template slot-scope="scope">
                    <el-button
                        size="mini"
                        type="success"
                        @click="handleRead(scope.$index, scope.row)">查看
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
            axios.get("/passage/all/" + page).then((response) => {
                console.log(response.data)
                this.tableData = response.data.data
            })
            axios.get("/passage/size").then((response) => {
                console.log(response.data)
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
                axios.delete("/passage/" + row.id).then((response) => {
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
        handleRead(index, row){
            this.$router.push("/passage/" + row.id)
        }
    }
}
</script>