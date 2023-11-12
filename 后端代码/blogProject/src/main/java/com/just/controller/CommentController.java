package com.just.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.just.pojo.Comment;
import com.just.pojo.User;
import com.just.service.CommentService;
import com.just.service.UserService;
import com.just.utils.AuthorityUtil;
import com.just.utils.JwtUtil;
import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;
    @Autowired
    private UserService userService;

    /**
     * 管理员查看评论日志的页面
     * 分页查看所有的评论，页的大小默认为10。
     * 关键包含信息：评论id，评论者的id，评论者的用户名，评论内容，评论时间，评论点赞数，评论的文章id
     * 其他信息可选
     * 权限：仅管理员可访问
     * @param page
     * @return
     */
    @GetMapping("/all/{page}")
    public Result selectAllComment(@PathVariable Integer page, HttpServletRequest request){
        //权限检验
        if (!AuthorityUtil.isAdmin(request)){
            return new Result("无此权限", null, "error");
        }

        //分页返回评论
        PageHelper.startPage(page, 10);
        List<Comment> commentList = commentService.selectAllComment();

        //评论为空
        if (commentList == null || commentList.size() == 0){
            return new Result("暂无数据", null, "error");
        }

        //正常返回
        PageInfo<Comment> commentPageInfo = new PageInfo<>(commentList);
        List<Comment> list = commentPageInfo.getList();

        return new Result(null, list, null);
    }

    /**
     * 所有评论的条数，用于分页时的总条数
     * 权限：仅管理员可访问
     * @return
     */
    @GetMapping("/size")
    public Result selectAllCommentSize(HttpServletRequest request){
        if (!AuthorityUtil.isAdmin(request)){
            return new Result("无此权限", null, "error");
        }
        return new Result(null, commentService.selectAllComment().size(), null);
    }

    /**
     * 得到某篇文章所有的评论
     * 返回信息：评论id，评论者的id，评论者的用户名，评论内容，评论时间，评论点赞数，评论的文章id
     * 注意还要加上评论者的“头像”
     * 权限：所有人可见
     * @param passageId
     * @return
     */
    @GetMapping("/{passageId}")
    public Result getAllCommentByPassageId(@PathVariable Integer passageId){
        List<Comment> comments = commentService.selectByPassageId(passageId);
        if (comments == null || comments.isEmpty()){
            return new Result("暂无数据", null, "error");
        }else {
            return new Result(null, comments, null);
        }
    }

    /**
     * 删除某个评论
     * 权限：仅管理员可访问，暂时不提供某个用户删除自己文章的评论
     * @param id
     * @param request
     * @return
     */
    @DeleteMapping("/{id}")
    public Result deleteComment(@PathVariable Integer id, HttpServletRequest request){
        // TODO: 添加某个用户删除自己文章的评论的功能

        if (!AuthorityUtil.isAdmin(request)){
            return new Result("无此数据", null, "error");
        } else {
            commentService.deleteById(id);
            return new Result(null, null, null);
        }
    }

    /**
     * 添加评论
     * 所需要的信息：评论内容，评论者的id，评论者的用户名，评论的文章id
     * 权限：需要登录
     * @param comment
     * @return
     */
    @PostMapping("/add")
    public Result addComment(@RequestBody Comment comment, HttpServletRequest request){
        Integer id = JwtUtil.getIdFromRequest(request);
        if (id == null) {
            return new Result("请先登录", null, "error");
        }
        commentService.add(comment);
        return new Result(null, null, null);
    }

    /**
     * 给评论点赞
     * 权限:需要登录
     * @param commentId
     * @return
     */
    @PostMapping("/like/{commentId}")
    public Result increaseLikeNum(@PathVariable Integer commentId, HttpServletRequest request){
        Integer id = JwtUtil.getIdFromRequest(request);
        if (id == null) {
            return new Result("请先登录", null, "error");
        }
        commentService.increaseCommentLikeNum(commentId);
        return new Result(null, null, null);
    }

}
