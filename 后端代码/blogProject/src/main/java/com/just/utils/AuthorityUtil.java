package com.just.utils;

import com.just.controller.Result;

import javax.servlet.http.HttpServletRequest;

/**
 * 封装controller层检验身份的操作
 * 这里主要需要的是检查用户是不是admin和给定的userId和token中的id是否一致
 */
public class AuthorityUtil {
    public static boolean isAdmin(HttpServletRequest request){
        //权限检验
        String userType = JwtUtil.getTypeFromRequest(request);
        return userType != null && userType.equals("admin");
    }

    public static boolean isSelf(HttpServletRequest request, int userId){
        Integer id = JwtUtil.getIdFromRequest(request);
        return id != null && id == userId;
    }
}
