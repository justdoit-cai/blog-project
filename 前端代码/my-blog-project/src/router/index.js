import Vue from 'vue'
import VueRouter from "vue-router";

import Login from "@/components/Login.vue";
import Register from "@/components/Register.vue";
import Admin from "@/admin/Admin.vue";
import WriteBlog from "@/components/WriteBlog.vue";
import BlogList from "@/admin/BlogList.vue";
import UserManage from "@/admin/UserManage.vue";
import About from "@/components/About.vue";
import Comments from "@/admin/Comments.vue";
import LoginLog from "@/admin/LoginLog.vue";
import OperationLog from "@/admin/OperationLog.vue";
import Type from "@/components/Type.vue";
import VisitLog from "@/admin/VisitLog.vue";
import Passage from "@/components/Passage.vue";
import UserInfo from "@/components/UserInfo.vue";
import Main from "@/components/Main.vue";
import Home from "@/components/Home.vue";
import CommentArea from "@/components/CommentArea.vue";
import MyBlog from "@/components/MyBlog.vue";
import EditPassage from "@/components/EditPassage.vue";
import PassageType from "@/components/PassageType.vue";


Vue.use(VueRouter)

const router = new VueRouter({
    // 指定hash属性与组件的对应关系
    routes: [
        {
            path: "/login",
            component: Login
        },
        {
            path: "/register",
            component: Register
        },
        {
            path: "/admin",
            component: Admin,
            meta:  {requireAuth: true},
            children: [
                {
                    path: "/blogList",
                    component: BlogList
                },
                {
                    path: "/userManage",
                    component: UserManage
                },
                {
                    path: "/comments",
                    component: Comments
                },
                {
                    path: "/loginLog",
                    component: LoginLog
                },
                {
                    path: "/operationLog",
                    component: OperationLog
                },
                {
                    path: "/visitLog",
                    component: VisitLog
                }
            ]
        },
        {
            path: "/",
            component: Main,
            meta: {
                keepAlive: false
            },
            children: [
                {
                  path: "",
                  redirect: "/home"
                },
                {
                  path: "/home",
                  component: Home
                },
                {
                    path: "/about",
                    component: About
                },
                {
                    path: "/passage/:id",
                    component: Passage,
                    props: true
                },
                {
                    path: "/userInfo/:id",
                    component: UserInfo,
                    props: true
                },
                {
                    path: "/writeBlog",
                    component: WriteBlog
                },
                {
                    path: "/type",
                    component: Type
                },
                {
                    path: "/myBlog",
                    component: MyBlog
                },
                {
                    path: "/editPassage/:id",
                    component: EditPassage,
                    props: true
                },
                {
                    path: "/passageType/:type",
                    component: PassageType,
                    props: true
                }
            ]
        },
        {
            path: '/commentArea',
            component: CommentArea
        }
    ]
})

export default router