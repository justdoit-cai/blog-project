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
                    prop="username"
                    label="用户名"
                    width="250">
            </el-table-column>
            <el-table-column
                prop="type"
                label="用户身份"
                width="250">
            </el-table-column>
            <el-table-column
                    prop="ip"
                    label="ip"
                    width="250">
            </el-table-column>
            <el-table-column
                prop="time"
                label="时间"
                width="250">
            </el-table-column>
            <el-table-column
                prop="action"
                label="登录|退出"
                width="250">
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
            total: 120
        }
    },
    created() {
        this.selectAll(1)
    },
    methods: {
        selectAll(page) {
            axios.get("/log/login/" + page).then((response) => {
                console.log(response.data)
                this.tableData = response.data.data
            })
            axios.get("/log/login/size").then((response) => {
                console.log(response.data)
                this.total = response.data.data
            })
        },
        handleCurrentChange(val) {
            console.log(`当前页: ${val}`);
            this.selectAll(val)
        }
    }
}
</script>