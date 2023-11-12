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
                  prop="type"
                  label="类别"
                  width="250">
          </el-table-column>
          <el-table-column
                  prop="passageNum"
                  label="文章数"
                  width="250">
          </el-table-column>
          <el-table-column
              prop="authorNum"
              label="作者数"
              width="250">
          </el-table-column>
          <el-table-column
                  prop="visitNum"
                  label="访问量"
                  width="250">
          </el-table-column>
          <el-table-column
                  prop="likeNum"
                  label="点赞数"
                  width="250">
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
              </template>
          </el-table-column>
      </el-table>
      <el-pagination
              @current-change="handleCurrentChange"
              :current-page="currentPage"
              :page-size="pageSize"
              layout="total, prev, pager, next, jumper"
              :total="typeListSize">
      </el-pagination>
  </div>
</template>

<script>
import axios from "axios";

export default {
    name: "Type",
    data() {
        return {
            tableData: [],
            typeListSize: 1,
            currentPage: 1,
            pageSize: 10,
        }
    },
    methods: {
        selectAll(page) {
            axios.get("/type/" + page).then((response) => {
                console.log(response.data)
                this.tableData = response.data.data
            })
            axios.get("/type/size").then((response) => {
                this.typeListSize = response.data.data
                console.log(this.typeListSize)
            })
        },
        handleCurrentChange(val) {
            console.log(`当前页: ${val}`);
            this.selectAll(val)
        },
        handleRead(index, row){
          this.$router.push("/passageType/" + row.type)
        },
    },
    created() {
      this.selectAll(1)
    }
}
</script>

<style scoped>

</style>