package com.just.utils;

import com.just.dao.LogDao;
import com.just.pojo.LoginLog;
import com.just.service.LogService;
import com.just.service.UserService;
import org.apache.coyote.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Component
public class LogUtil {

    private static UserService userService;
    private static LogService logService;

    public LogUtil(UserService userService, LogService logService){
        LogUtil.userService  = userService;
        LogUtil.logService = logService;
    }

    public static void login(String token, HttpServletRequest request){
        String username = JwtUtil.getUsernameByToken(token);
        String type = JwtUtil.getTypeByToken(token);
        Date now = new Date();
        String action = "登录";
        String ip = getIpAddr(request);
        LoginLog loginLog = new LoginLog(username,type,ip,now,action);
        System.out.println("loginLog = " + loginLog);
        logService.add(loginLog);
    }

    public static void logout(String token, HttpServletRequest request){
        String username = JwtUtil.getUsernameByToken(token);
        String type = JwtUtil.getUsernameByToken(token);
        Date now = new Date();
        String action = "退出";
        String ip = getIpAddr(request);
        LoginLog loginLog = new LoginLog(username,type,ip,now,action);
        logService.add(loginLog);
    }


    public static String getIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        if ((ip.contains(","))){
            ip = ip.substring(0 , ip.indexOf(","));
        }
        return ip;
    }
}
