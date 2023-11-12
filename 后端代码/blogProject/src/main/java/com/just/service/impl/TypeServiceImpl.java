package com.just.service.impl;

import com.just.dao.CommentDao;
import com.just.dao.TypeDao;
import com.just.dao.UserDao;
import com.just.pojo.Comment;
import com.just.pojo.Passage;
import com.just.pojo.Type;
import com.just.pojo.User;
import com.just.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeServiceImpl implements TypeService {
    @Autowired
    private TypeDao typeDao;
    @Autowired
    private UserDao userDao;
    @Autowired
    private CommentDao commentDao;
    @Override
    public List<Type> selectAllType() {
        return typeDao.selectAllType();
    }

    @Override
    public List<Passage> selectPassageByType(String type) {
        List<Passage> passageList = typeDao.selectPassageByType(type);
        for (Passage passage : passageList) {
            User user = userDao.selectById(passage.getAuthorId());
            passage.setAuthorName(user.getUsername());
            if (passage.getContent().length() > 300){
                passage.setContent(passage.getContent().substring(0,300) + "……");
            }
            List<Comment> commentList = commentDao.selectAllCommentByPassageId(passage.getId());

            passage.setAuthorName(user.getUsername());
            passage.setCommentList(commentList);
            passage.setCommentNum(commentList.size());
        }
        return passageList;
    }
}
