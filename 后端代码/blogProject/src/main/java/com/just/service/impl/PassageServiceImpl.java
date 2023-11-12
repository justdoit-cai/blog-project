package com.just.service.impl;

import com.just.dao.CommentDao;
import com.just.dao.PassageDao;
import com.just.dao.UserDao;
import com.just.pojo.About;
import com.just.pojo.Comment;
import com.just.pojo.Passage;
import com.just.pojo.User;
import com.just.service.PassageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class PassageServiceImpl implements PassageService{
    @Autowired
    private PassageDao passageDao;
    @Autowired
    private UserDao userDao;
    @Autowired
    private CommentDao commentDao;

    @Override
    public List<Passage> selectAllPassage() {
        List<Passage> passageList = passageDao.selectAll();
        for (Passage passage : passageList){
            int authorId = passage.getAuthorId();
            User user = userDao.selectById(authorId);
            passage.setAuthorName(user.getUsername());
        }
        return passageList;
    }

    @Override
    public List<Passage> selectIndexPassage() {
        List<Passage> passageList = passageDao.selectAll();
        for (Passage passage : passageList) {
            User user = userDao.selectById(passage.getAuthorId());
            passage.setAuthorName(user.getUsername());
            if (passage.getContent().length() > 300){
                passage.setContent(passage.getContent().substring(0,300) + "……");
            }
            List<Comment> commentList = commentDao.selectAllCommentByPassageId(passage.getId());

            passage.setCommentList(commentList);
            passage.setCommentNum(commentList.size());

        }
        return passageList;
    }

    @Override
    public List<Passage> selectPassageByAuthorId(Integer id) {
        List<Passage> passageList = passageDao.selectPassageByAuthorId(id);
        //为Passage这个Pojo类的补充字段设置完整的内容
        for (Passage passage : passageList) {
            User user = userDao.selectById(id);
            List<Comment> commentList = commentDao.selectAllCommentByPassageId(passage.getId());

            passage.setAuthorName(user.getUsername());
            passage.setCommentList(commentList);
            passage.setCommentNum(commentList.size());
        }
        return passageList;
    }

    @Override
    public Passage selectById(Integer id) {
        Passage passage = passageDao.selectById(id);
        passage.setAuthorName(userDao.selectById(passage.getAuthorId()).getUsername());
        List<Comment> commentList = commentDao.selectAllCommentByPassageId(id);
        passage.setCommentList(commentList);
        passage.setCommentNum(commentList.size());
        return passage;
    }

    @Override
    public int deletePassage(Integer id) {
        return passageDao.deletePassage(id);
    }

    @Override
    public int updatePassage(Passage passage) {
        passage.setUpdateTime(new Date());
        return passageDao.updatePassage(passage);
    }

    /**
     * 插入后返回主键
     * @param passage
     * @param authorId
     * @return
     */
    @Override
    public int add(Passage passage, Integer authorId) {
        Date now = new Date();
        passage.setCreateTime(now);
        passage.setUpdateTime(now);
        passage.setAuthorId(authorId);
        passageDao.add(passage);
        return passageDao.selectMaxId();
    }

    @Override
    public int increaseLikeNum(Integer passageId) {
        return passageDao.increaseLikeNum(passageId);
    }

    @Override
    public About selectAbout() {
        return passageDao.selectAbout();
    }

    @Override
    public int updateAbout(String content) {
        return passageDao.updateAbout(content);
    }
}
