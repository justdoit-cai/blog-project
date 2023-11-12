package com.just.dao;

import com.just.pojo.About;
import com.just.pojo.Comment;
import com.just.pojo.Passage;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface PassageDao {
    @Select("select * from tb_passage where is_delete != 1")
    @Results(
            id = "passageMap",
            value ={
                @Result(column = "author_id", property = "authorId"),
                @Result(column = "create_time", property = "createTime"),
                @Result(column = "update_time", property = "updateTime"),
                @Result(column = "like_num", property = "likeNum"),
                @Result(column = "visit_num", property = "visitNum"),
                @Result(column = "is_delete", property = "del"),
            }
    )
    public List<Passage> selectAll();

    @Select("select * from tb_passage where author_id = #{authorId} and is_delete != 1")
    @ResultMap({"passageMap"})
    public List<Passage> selectPassageByAuthorId(Integer authorId);

    @Select("select * from tb_passage where id = #{id} and is_delete != 1")
    @ResultMap({"passageMap"})
    public Passage selectById(Integer id);

    @Delete("update tb_passage set is_delete = 1 where id = #{id}")
    public int deletePassage(Integer id);

    @Update("update tb_passage set title = #{title}, content = #{content}," +
            "description = #{description},type = #{type}, update_time = #{updateTime} where id = #{id}")
    public int updatePassage(Passage passage);

    @Insert("insert into tb_passage (id,author_id,description,title,content,type,create_time) " +
            "values (null, #{authorId},#{description},#{title},#{content},#{type},#{createTime})")
    public int add(Passage passage);

    @Select("select max(id) from tb_passage")
    public int selectMaxId();

    @Update("update tb_passage set like_num = like_num + 1 where id = #{passageId}")
    public int increaseLikeNum(Integer passageId);

    @Select("select * from tb_about where id = 1")
    public About selectAbout();

    @Update("update tb_about set content = #{content} where id = 1")
    public int updateAbout(String content);

    @Update("update tb_passage set update_time = #{update_time} where id = #{id}")
    public int updateUpdateTime(Passage passage);
}
