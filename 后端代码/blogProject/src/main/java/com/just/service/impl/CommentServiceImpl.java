package com.just.service.impl;

import com.just.dao.CommentDao;
import com.just.dao.UserDao;
import com.just.pojo.Comment;
import com.just.pojo.User;
import com.just.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentDao commentDao;
    @Autowired
    private UserDao userDao;

    @Override
    public List<Comment> selectByUserId(Integer userId) {
        return commentDao.selectCommentByUserId(userId);
    }

    @Override
    public Comment selectById(Integer id) {
        Comment comment = commentDao.selectById(id);
        int commentatorId = comment.getCommentatorId();
        User user = userDao.selectById(commentatorId);
        comment.setCommentatorAvatar(user.getAvatar());
        return comment;
    }

    @Override
    public List<Comment> selectByPassageId(Integer passageId) {
        List<Comment> commentList = commentDao.selectAllCommentByPassageId(passageId);
        for (Comment comment : commentList) {
            int commentatorId = comment.getCommentatorId();
            User user = userDao.selectById(commentatorId);
            comment.setCommentatorAvatar(user.getAvatar());
        }
        return commentList;
    }

    @Override
    public int deleteById(Integer id) {
        return commentDao.deleteComment(id);
    }

    @Override
    public int add(Comment comment) {
        comment.setCreateTime(new Date());
        int commentatorId = comment.getCommentatorId();
        User user = userDao.selectById(commentatorId);
        comment.setCommentatorAvatar(user.getAvatar());
        return commentDao.addComment(comment);
    }

    @Override
    public int increaseCommentLikeNum(Integer id) {
        return commentDao.increaseCommentLikeNum(id);
    }

    @Override
    public List<Comment> selectAllComment() {
        return commentDao.selectAllComment();
    }
}
