package com.just.controller.interceptor;

import com.just.controller.Result;
import com.just.utils.AuthorityUtil;
import org.springframework.http.HttpMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("=====AdminInterceptor=====");
        //放行跨域请求的第一次option请求，解决第二次请求拦截器无法得到header的问题
        if (HttpMethod.OPTIONS.toString().equals(request.getMethod())){
            System.out.println("OPTIONS请求，放行...");
            return true;
        }
        String uri = request.getRequestURI();
        System.out.println("token = " + request.getHeader("Authorization"));
        System.out.println("token = " + request.getHeader("authorization"));
        boolean isAdmin = AuthorityUtil.isAdmin(request);
        if (!isAdmin){
            System.out.println("defend " + uri);
        }else {
            System.out.println("welcome admin to " + uri);
        }
        return isAdmin;
    }
}
