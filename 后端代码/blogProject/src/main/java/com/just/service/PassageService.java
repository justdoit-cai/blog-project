package com.just.service;

import com.just.pojo.About;
import com.just.pojo.Passage;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface PassageService {
    public List<Passage> selectAllPassage();
    public List<Passage> selectIndexPassage();
    public List<Passage> selectPassageByAuthorId(Integer id);

    public Passage selectById(Integer id);

    public int deletePassage(Integer id);

    public int updatePassage(Passage passage);

    public int add(Passage passage, Integer authorId);

    public int increaseLikeNum(Integer passageId);

    public About selectAbout();

    public int updateAbout(String content);
}
