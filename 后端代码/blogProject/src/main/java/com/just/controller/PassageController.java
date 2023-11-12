package com.just.controller;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonView;
import com.fasterxml.jackson.core.JsonParser;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.just.pojo.About;
import com.just.pojo.Passage;
import com.just.pojo.User;
import com.just.service.PassageService;
import com.just.service.UserService;
import com.just.utils.AuthorityUtil;
import com.just.utils.JwtUtil;
import io.jsonwebtoken.Jwt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/passage")
public class PassageController {
    @Autowired
    private PassageService passageService;

    @Autowired
    private UserService userService;

    /**
     * 分页返回所有的文章
     * admin可以访问
     * @param page
     * @return
     */
    @GetMapping("/all/{page}")
    public Result selectAllPassage(@PathVariable Integer page, HttpServletRequest request) {
        if (!AuthorityUtil.isAdmin(request)) {
            return new Result("无此权限", null, "error");
        }
        PageHelper.startPage(page, 10);
        List<Passage> passageList = passageService.selectAllPassage();
        if (passageList == null || passageList.isEmpty()) {
            return new Result("暂无数据", null, "error");
        } else {
            PageInfo<Passage> passagePageInfo = new PageInfo<>(passageList);
            List<Passage> list = passagePageInfo.getList();
            return new Result(null, list, null);
        }
    }

    /**
     * 处理首页的文章列表
     *
     * @param page
     * @return
     * @throws NoSuchFieldException
     */
    @JsonView(Passage.IndexPassage.class)
    @GetMapping("/index/{page}")
    public Result selectIndexPassage(@PathVariable Integer page, HttpServletRequest request) throws NoSuchFieldException {
        PageHelper.startPage(page, 5);
        List<Passage> passageList = passageService.selectIndexPassage();
        if (passageList == null || passageList.isEmpty()) {
            return new Result("暂无数据", null, "error");
        } else {
////            return  new Result(null, passageList, null);
            PageInfo<Passage> passagePageInfo = new PageInfo<>(passageList);
            List<Passage> list = passagePageInfo.getList();
            return Result.getResult(null, list, null, Passage.IndexPassage.class);
//            return new Result(null, list, null);
        }
    }

    /**
     * 根据文章id获取文章详情
     *
     * @param passageId
     * @return
     */
    @GetMapping("/{passageId}")
    public Result selectOneByPassageId(@PathVariable Integer passageId) {
        Passage passage = passageService.selectById(passageId);
        return new Result(null, passage, null);
    }

    /**
     * 获取所有文章的总数
     *
     * @return
     * @throws NoSuchFieldException
     */
    @GetMapping("/size")
    public Result selectAllPassageSize(HttpServletRequest request) throws NoSuchFieldException {
        //startPage要在sql查询的前面加才能生效
        PageHelper.startPage(1, 5);
        List<Passage> passageList = passageService.selectIndexPassage();
        PageInfo<Passage> passagePageInfo = new PageInfo<>(passageList);
        long size = passagePageInfo.getTotal();
        return new Result(null, size, null);
    }

    /**
     * 获取当前登录用户的文章总数
     * @param request
     * @return
     * @throws NoSuchFieldException
     */
    @GetMapping("/my/size")
    public Result selectMyPassageSize(HttpServletRequest request) throws NoSuchFieldException {
        //startPage要在sql查询的前面加才能生效
        PageHelper.startPage(1, 5);
        int id = getIdFromRequest(request);
        List<Passage> passageList = passageService.selectPassageByAuthorId(id);
        PageInfo<Passage> passagePageInfo = new PageInfo<>(passageList);
        long size = passagePageInfo.getTotal();
        return new Result(null, size, null);
    }

    /**
     * 分页获取某个作者的所有文章
     *
     * @param page
     * @param size
     * @param request
     * @return
     * @throws NoSuchFieldException
     */
    @GetMapping("/my/{page}/{size}")
    public Result selectByAuthorId(@PathVariable Integer page, @PathVariable Integer size, HttpServletRequest request) throws NoSuchFieldException {
        int id = getIdFromRequest(request);
        if (id == -1) {
            return new Result("请先登录", null, "error");
        }

        PageHelper.startPage(page, size);
        List<Passage> passageList = passageService.selectPassageByAuthorId(id);
        PageInfo<Passage> passagePageInfo = new PageInfo<>(passageList);
        List<Passage> list = passagePageInfo.getList();

        if (list == null || list.isEmpty()) {
            return new Result("empty", null, "error");
        }
        return Result.getResult(null, list, null, Passage.TablePassage.class);
    }

    /**
     * 删除某个文章
     *
     * @param passageId
     * @param request
     * @return
     */
    @DeleteMapping("/{passageId}")
    public Result deleteById(@PathVariable Integer passageId, HttpServletRequest request) {
        int userId = getIdFromRequest(request);
        Passage passage = passageService.selectById(passageId);
        //判断前端要删除的文章是否存在
        if (passage == null) {
            return new Result("所要删除的文章不存在", null, "error");
        }
        //判断要求删除的用户是不是admin
        if (AuthorityUtil.isAdmin(request)) {
            passageService.deletePassage(passageId);
            return new Result(null, null, null);
        } else if (passage.getAuthorId() == userId) {
            //判断要求删除的用户是不是该文章的作者
            passageService.deletePassage(passageId);
            return new Result(null, null, null);
        } else {
            return new Result("无此权限", null, "error");
        }
    }

    /**
     * 更新某个文章的内容
     *
     * @param passage
     * @param request
     * @return
     */
    @PostMapping("/")
    public Result update(@RequestBody Passage passage, HttpServletRequest request) {
        int userId = getIdFromRequest(request);
        int passageId = passage.getId();
        Passage realPassage = passageService.selectById(passageId);
        //用户越权更新别人的文章
        if (realPassage.getAuthorId() != userId) {
            System.out.println(realPassage.getAuthorId());
            return new Result("无此权限", null, "error");
        } else {
            passageService.updatePassage(passage);
            return new Result(null, null, null);
        }
    }

    /**
     * 添加文章
     *
     * @param passage
     * @param request
     * @return
     */
    @PostMapping("/add")
    public Result add(@RequestBody Passage passage, HttpServletRequest request) {
        //从token中获取当前发布文章的作者
        int authorId = getIdFromRequest(request);
        int id = passageService.add(passage, authorId);

        return new Result(null, id, null);
    }

    @PostMapping("/like/{passageId}")
    public Result increaseLikeNum(@PathVariable Integer passageId) {
        passageService.increaseLikeNum(passageId);
        return new Result(null, null, null);
    }

    @GetMapping("/about")
    public Result getAbout() {
        return new Result(null, passageService.selectAbout(), null);
    }

    @PostMapping("/about")
    public Result updateAbout(@RequestBody About about, HttpServletRequest request) {
        if (!AuthorityUtil.isAdmin(request)) {
            return new Result("无此权限", null, "error");
        }
        passageService.updateAbout(about.getContent());
        return new Result(null, null, null);
    }

    /**
     * 从request获取用户id的工具方法，简化controller层的代码
     *
     * @param request
     * @return
     */
    private int getIdFromRequest(HttpServletRequest request) {
        try {
            String token = request.getHeader("Authorization");
            String username = JwtUtil.getUsernameByToken(token);
            User user = userService.selectByUsername(username);
            return user.getId();
        } catch (Exception e) {
            return -1;
        }
    }
}
