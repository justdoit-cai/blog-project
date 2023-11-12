package com.just.service;

import com.just.pojo.Comment;

import java.util.List;

public interface CommentService {
    public List<Comment> selectByUserId(Integer userId);
    public Comment selectById(Integer id);
    public List<Comment> selectByPassageId(Integer passageId);
    public int deleteById(Integer id);
    public int add(Comment comment);
    public int increaseCommentLikeNum(Integer id);
    public List<Comment> selectAllComment();
}
