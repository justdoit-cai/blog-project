<template>
    <div>
        <div>
            <Header></Header>
        </div>
        <div>
<!--            <Index></Index>-->
            <router-view :key="$route.fullPath"/>
        </div>
        <div>
            <Footer></Footer>
        </div>
    </div>
</template>

<script>
import axios from "axios";
import Footer from "@/components/Footer.vue";
import Header from "@/components/Header.vue";
import Index from "@/components/Home.vue";
import WriteBlog from "@/components/WriteBlog.vue";
import Type from "@/components/Type.vue";

export default {
    name: "Main",
    components: {Index, Header, Footer, WriteBlog, Type},
    data() {
        return {
            isLogin: true,
            user: {
                username: 'Tom猫',
                photo: 'https://img1.baidu.com/it/u=2812417321,4100104782&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=750',
            },
            passage: [{
                id: '',
                title: '',
                authorId: '',
                authorName: '',
                createTime: '',
                updateTime: '',
                type: '',
                description: '',
                content: ''
            }],
            intro: '',
        }
    },
    methods: {
        logout() {

        },
        login() {
            this.$router.push("/login")
        },
        handlerUserInfo() {

        },
    },
}
</script>

<style scoped>

</style>