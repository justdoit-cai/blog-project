package com.just.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.just.pojo.LoginLog;
import com.just.pojo.Passage;
import com.just.pojo.SqlLog;
import com.just.service.LogService;
import com.just.utils.AuthorityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/log")
public class LogController {
    @Autowired
    private LogService logService;

    /**
     * 分页查询用户的登录登出日志信息
     * 默认页的大小为10
     * 权限：admin
     * @param page
     * @return
     */
    @GetMapping("/login/{page}")
    public Result selectAllLoginLog(@PathVariable Integer page, HttpServletRequest request) {
        PageHelper.startPage(page, 10);
        List<LoginLog> loginLogList = logService.selectAllLoginLog();
        if (loginLogList == null || loginLogList.isEmpty()){
            return new Result("暂无数据", null, "error");
        }
        PageInfo<LoginLog> loginLogPageInfo = new PageInfo<>(loginLogList);
        List<LoginLog> list = loginLogPageInfo.getList();
        return new Result(null, list, null);
    }

    /**
     * 查询用户的登录登出日志信息的总条数
     * @param request
     * @return
     */
    @GetMapping("/login/size")
    public Result selectLoginLogSize(HttpServletRequest request) {
        return new Result(null, logService.selectAllLoginLog().size(), null);
    }


    /**
     * 分页查询后端的sql语句执行日志
     * 默认页的大小为10
     * @param page
     * @return
     */
    @GetMapping("/sql/{page}")
    public Result selectAllSqlLog(@PathVariable Integer page, HttpServletRequest request) {
        PageHelper.startPage(page, 10);
        List<SqlLog> sqlLogList = logService.selectAllSqlLog();
        if (sqlLogList == null || sqlLogList.isEmpty()){
            return new Result("暂无数据", null, "error");
        }
        PageInfo<SqlLog> sqlLogPageInfo = new PageInfo<>(sqlLogList);
        List<SqlLog> list = sqlLogPageInfo.getList();
        return new Result(null, list, null);
    }

    /**
     * 得到sql语句执行日志的数量
     * @return
     */
    @GetMapping("/sql/size")
    public Result selectSqlLogSize(HttpServletRequest request) {
        return new Result(null, logService.selectAllSqlLog().size(), null);
    }


}
