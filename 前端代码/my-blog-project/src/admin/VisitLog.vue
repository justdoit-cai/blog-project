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
                    prop="time"
                    label="时间"
                    width="250">
            </el-table-column>
            <el-table-column
                    prop="ip"
                    label="ip"
                    width="250">
            </el-table-column>
            <el-table-column
                    prop="location"
                    label="地点"
                    width="250">
            </el-table-column>
            <el-table-column
                    prop="method"
                    label="方法"
                    width="150">
            </el-table-column>
            <el-table-column
                    prop="url"
                    label="url"
                    width="250">
            </el-table-column>
            <el-table-column
                    prop="statusCode"
                    label="状态码"
                    width="150">
            </el-table-column>
            <el-table-column
                prop="length"
                label="数据包长度"
                width="250">
            </el-table-column>
        </el-table>
        <el-pagination
                @size-change="handleSizeChange"
                @current-change="handleCurrentChange"
                :current-page="currentPage"
                :page-sizes="[10, 20, 50, 100]"
                :page-size="10"
                layout="total, sizes, prev, pager, next, jumper"
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
            tableData: [{
                id: '',
                time: '',
                ip: '',
                location: '',
                method: '',
                url: '',
                statusCode: '',
                length: '',
            }],
            currentPage: 3,
            total: 120
        }
    },
    created() {
        this.selectAll()
    },
    methods: {
        selectAll() {
            axios.get("/visitLog").then((response) => {
                console.log(response.data)
                this.tableData = response.data.data
            })
        },
        handleSizeChange(val) {
            console.log(`每页 ${val} 条`);
        },
        handleCurrentChange(val) {
            console.log(`当前页: ${val}`);
        }
    }
}
</script>