package com.just.controller;

import com.just.pojo.User;
import com.just.service.UserService;
import com.just.service.impl.UserServiceImpl;
import com.just.utils.JwtUtil;
import com.just.utils.LogUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@RestController
@CrossOrigin
public class MainController {

    @Autowired
    private UserService userService;

//    @GetMapping("/")
//    public String index(HttpServletRequest request){
//        return "hello";
//    }

    @PostMapping("/login")
    public Result login(@RequestBody User user, HttpServletRequest request, HttpServletResponse response) throws IOException, NoSuchFieldException {
        String username = user.getUsername();
        String password = user.getPassword();
        if (userService.checkPassword(username, password)){
            User user1 = userService.selectByUsername(username);

            //前端存储的用户信息
            User userInfo = new User();
            userInfo.setId(user1.getId());
            userInfo.setUsername(user1.getUsername());
            userInfo.setType(user1.getType());
            userInfo.setAvatar(user1.getAvatar());

            String token = JwtUtil.generateToken(username, user1.getType());

            response.setHeader("Authorization", token);
            response.addHeader("Access-Control-Expose-Headers", "Authorization");
            response.setHeader("Access-Control-Expose-Header", "Authorization");

            //记录日志
            LogUtil.login(token, request);

            return Result.getResult(null, userInfo, null, User.SessionUser.class);
        }else {
            return new Result("账号或密码错误", null, "error");
        }
    }


    @PostMapping("/logout")
    public Result logout(HttpServletRequest request, HttpServletResponse response){
        //记录日志
        LogUtil.logout(request.getHeader("Authorization"), request);

        // TODO: 使用redis完成JWT的退出功能，暂时只完成了前端的退出
        return new Result(null, null, null);
    }

    @PostMapping("/register")
    public Result register(@RequestBody User user){
        String username = user.getUsername();
        String password = user.getPassword();
        boolean isUsernameExist = userService.checkUsername(username);
        if (isUsernameExist){
            return new Result("该账号已存在", null, "error");
        }else {
            userService.insert(user);
        }
        return new Result(null, null, null);
    }
}
