<template>
    <div>
        <div style="height: 700px;overflow: auto">
            <el-table
                    :data="tableData"
                    stripe
                    style="width: 100%">
                <el-table-column
                        type="index"
                        width="50">
                </el-table-column>
                <el-table-column
                        prop="operation"
                        label="操作"
                        width="250">
                </el-table-column>
                <el-table-column
                        prop="time"
                        label="时间"
                        width="250">
                </el-table-column>
                <el-table-column
                        prop="operationParams"
                        label="执行的sql语句参数"
                        width="800">
                </el-table-column>
            </el-table>
        </div>
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
            total: 0,
        }
    },
    created() {
        this.selectAll(1)
    },
    methods: {
        selectAll(page) {
            axios.get("/log/sql/" + page).then((response) => {
                console.log(response.data)
                this.tableData = response.data.data
            })
            axios.get("/log/sql/size").then((response) => {
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

<style>

</style>