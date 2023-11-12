package com.just.dao;

import com.just.pojo.Comment;
import org.apache.ibatis.annotations.*;

import java.util.Date;
import java.util.List;

@Mapper
public interface CommentDao {

    @Select("select id,passage_id,content,commentator_id,commentator_username," +
            "create_time,like_num,is_delete " +
            "from tb_comment where passage_id = #{passageId} and is_delete != 1")
    @Results(
            id = "commentMap",
            value ={
                    @Result(column = "passage_id", property = "passageId"),
                    @Result(column = "commentator_id", property = "commentatorId"),
                    @Result(column = "commentator_username", property = "commentatorUsername"),
                    @Result(column = "like_num", property = "likeNum"),
                    @Result(column = "is_delete", property = "del"),
                    @Result(column = "create_time", property = "createTime"),
            }
    )
    public List<Comment> selectAllCommentByPassageId(Integer passageId);

    @Select("select * from tb_comment where is_delete != 1")
    @ResultMap({"commentMap"})
    public List<Comment> selectAllComment();

    @Select("select * from tb_comment where commentator_id = #{userId} and is_delete != 1")
    @ResultMap({"commentMap"})
    public List<Comment> selectCommentByUserId(Integer userId);

    @Select("select * from tb_comment where id = #{id} and is_delete != 1")
    @ResultMap({"commentMap"})
    public Comment selectById(Integer id);
    @Update("update tb_comment set is_delete = 1 where id = #{id}")
    public int deleteComment(Integer id);


    @Update("update tb_comment set like_num = like_num + 1 where id = #{id} and is_delete != 1")
    public int increaseCommentLikeNum(Integer id);
    @Insert("insert into tb_comment (passage_id,content,commentator_id,commentator_username,create_time) " +
            "values (#{passageId}, #{content}, #{commentatorId}, #{commentatorUsername}, #{createTime})")
    public int addComment(Comment comment);


    @Select("select max(id) from tb_comment where is_delete != 1")
    public int getCommentMaxId();

    @Select("select max(id) from tb_comment")
    public int selectMaxId();
}
