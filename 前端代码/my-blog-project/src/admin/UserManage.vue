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
                    prop="registerTime"
                    label="注册时间"
                    width="250">
            </el-table-column>
            <el-table-column
                    prop="username"
                    label="用户名"
                    width="250">
            </el-table-column>
            <el-table-column
                    prop="type"
                    label="权限"
                    width="250">
            </el-table-column>
            <el-table-column
                    prop="lastLogin"
                    label="最近登录时间"
                    width="250">
            </el-table-column>
            <el-table-column label="操作">
                <template slot-scope="scope">
                    <el-button
                            size="mini"
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
                @size-change="handleSizeChange"
                @current-change="handleCurrentChange"
                :current-page="currentPage"
                :page-sizes="[10, 20, 50, 100]"
                :page-size="10"
                layout="total, sizes, prev, pager, next, jumper"
                :total="total">
        </el-pagination>
        <el-dialog
                title="编辑用户信息"
                :visible.sync="dialogEdit"
                width="30%"
                :before-close="handleClose">
            <!--html属性里面不能用插值表达式，如果要用只能用v-bind-->
            <el-form ref="form" :model="formEdit" label-width="80px">
                <el-form-item label="账号">
                    <el-input v-model="formEdit.username" :placeholder="formEdit.type" disabled></el-input>
                </el-form-item>
                <el-form-item label="权限">
                    <el-select v-model="formEdit.type" :placeholder="formEdit.type">
                        <el-option label="管理员" value="admin"></el-option>
                        <el-option label="普通用户" value="user"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item>
                    <el-button @click="dialogEdit = false">取 消</el-button>
                    <el-button type="primary" @click="handleUpdate">提 交</el-button>
                </el-form-item>
            </el-form>
        </el-dialog>

    </div>

</template>

<script>

import axios from "axios";

export default {
    data() {
        return {
            dialogEdit: false,
            tableData: [],
            formEdit: {
                id: '',
                username: '',
                type: ''
            },
            currentPage: 3,
            total: 120
        }
    },
    created() {
        this.selectAll(1)
    },
    methods: {
        selectAll(page) {
            axios.get("/user/all/" + page).then((response) => {
                this.tableData = response.data.data
            })
            axios.get("/user/size").then((response) => {
                this.total = response.data.data
            })
        },
        handleDelete(index, row) {
            console.log("index = " + index)
            console.log(row)
            this.$confirm("确定删除?", "提示", {
                type: "info",
            }).then(() => {
                axios.delete("/user/" + row.id).then((response) => {
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
        handleEdit(index, row) {
            this.formEdit.id = row.id
            this.formEdit.username = row.username
            this.formEdit.type = row.type
            this.dialogEdit = true
        },
        handleClose() {
            this.dialogEdit = false
        },
        handleUpdate() {
            this.$confirm("确定更新?", "提示", {
                type: "info",
            }).then(() => {
                axios.post("/user/updateType", this.formEdit).then((response) => {
                    console.log(response)
                    if (response.data.error === null) {
                        this.$message.success("更新成功!");
                        this.selectAll(1);
                        this.dialogEdit = false
                    } else {
                        this.$message.error("更新失败!");
                    }
                })
            }).catch(() => {
                this.$message.info("取消更新操作");
            })
        },
        handleCurrentChange(val) {
            console.log(`当前页: ${val}`);
            this.selectAll(val)
        }
    }
}
</script>