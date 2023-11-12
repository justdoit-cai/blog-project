package com.just.controller;

import com.fasterxml.jackson.annotation.JsonView;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.just.service.UserService;
import com.just.service.impl.UserServiceImpl;
import com.just.utils.AuthorityUtil;
import com.just.utils.JwtUtil;
import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.just.pojo.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/add")
    public Result addUser(@RequestBody User user){
        if (!userService.checkUsername(user.getUsername())){
            return new Result("账号已存在", null, "error");
        } else {
            userService.insert(user);
            return new Result(null, null, null);
        }
    }

    @GetMapping("/all/{page}")
    public Result selectAll(@PathVariable Integer page, HttpServletRequest request){
        if (!AuthorityUtil.isAdmin(request)){
            return new Result("无此权限", null, "error");
        }
        PageHelper.startPage(page, 10);
        List<User> users;
        try {
            users = userService.selectAll();
        }catch (Exception e){
            e.printStackTrace();
            return new Result("服务端出现异常", null, "error");
        }
        PageInfo<User> userPageInfo = new PageInfo<>(users);
        List<User> list = userPageInfo.getList();
        return new Result(null, list, null);
    }

    @GetMapping("/size")
    public Result selectAllSize(HttpServletRequest request){
        if (!AuthorityUtil.isAdmin(request)){
            return new Result("无此权限", null, "error");
        }
        return new Result(null, userService.selectAll().size(), null);
    }

    @GetMapping("/{id}")
    public Result selectById(@PathVariable Integer id){
        User user;
        try {
            user = userService.selectById(id);
        }catch (Exception e){
            e.printStackTrace();
            return new Result("服务端出现异常", null, "error");
        }
        return new Result(null, user, null);
    }

    @DeleteMapping("/{id}")
    public Result deleteById(@PathVariable Integer id, HttpServletRequest request){
        if (!AuthorityUtil.isAdmin(request)){
            return new Result("无此权限", null, "error");
        }
        try {
            userService.deleteById(id);
        }catch (Exception e){
            e.printStackTrace();
            return new Result("服务端出现异常", null, "error");
        }
        return new Result("删除成功", null, null);
    }

    @PostMapping("/updateInfo")
    public Result updateInfo(@RequestBody User user, HttpServletRequest request){
        //检查请求修改的用户id是否和当前用户的id一致,防止窜改请求包的id修改任意用户的信息,否则返回无权限
        if (!AuthorityUtil.isSelf(request, user.getId())){
            return new Result("无此权限", null, "error");
        }
        try {
            userService.updateInfo(user);
        }catch (Exception e){
            e.printStackTrace();
            return new Result("服务端出现异常", null, "error");
        }
        return new Result("更新成功", null, null);
    }

    @PostMapping("/updateType")
    public Result updateType(@RequestBody User user, HttpServletRequest request){
        if (!AuthorityUtil.isAdmin(request)){
            return new Result("无此权限", null, "error");
        }
        userService.updateType(user.getId(), user.getType());
        return new Result(null, null, null);
    }

}
