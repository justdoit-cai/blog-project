import axios from 'axios'
import Vue from "vue";

axios.defaults.baseURL = "http://localhost:8080"
Vue.prototype.$http = axios

//请求拦截
axios.interceptors.request.use(config => {
    //如果有token，统一带上
    const token = window.localStorage.getItem('token')
    if (token) { // 判断是否存在token，如果存在的话，则每个http header都加上token
        config.headers.Authorization = `${token}`;
    }
    return config
})


