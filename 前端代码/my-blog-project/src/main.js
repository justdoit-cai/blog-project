import Vue from 'vue'
import App from './App.vue'
import store from "@/store";
import router from "@/router";
import ElementUI from "element-ui"
import "element-ui/lib/theme-chalk/index.css"
import 'font-awesome/css/font-awesome.min.css'
import "./axios/axios"
// import "./mock"

//mavonEditor
import mavonEditor from 'mavon-editor'
import 'mavon-editor/dist/css/index.css'


Vue.use(mavonEditor)

//markdown-it-vue-light (markdown-it的精简版 去掉流程图渲染)
import MarkdownItVueLight from 'markdown-it-vue/dist/markdown-it-vue-light.umd.min.js'
import 'markdown-it-vue/dist/markdown-it-vue-light.css'

Vue.use(MarkdownItVueLight)

//v-viewer
import 'viewerjs/dist/viewer.css'
import Viewer from 'v-viewer'

Vue.use(Viewer)

Viewer.setDefaults({
    Options: {
        inline: true,
        button: false,
        navbar: true,
        title: true,
        toolbar: true,
        tooltip: true,
        movable: true,
        zoomable: true,
        rotatable: true,
        scalable: true,
        transition: true,
        fullscreen: true,
        keyboard: true,
        url: 'data-source'
    }
})


Vue.config.productionTip = false

Vue.use(ElementUI)

import md5 from 'js-md5';

Vue.prototype.$md5 = md5;


new Vue({
    render: h => h(App),
    store: store,
    router: router
}).$mount('#app')


//路由守卫，必须放在new Vue的后面
// router.beforeEach((to, from, next) => {
//     if (to.meta.requireAuth) {  // 需要权限
//         //判断当前是否拥有权限
//         if (this.$store.getters.getUser.type === 'admin') {
//             console.log("放行")
//             next();
//         } else {  // 无权，跳转登录
//             console.log("禁止通过")
//             this.$message.error("请登录管理员账号")
//             this.$router.push("/login")
//         }
//     } else {  // 不需要权限，直接访问
//         next();
//     }
// })