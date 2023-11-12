package com.just.dao;

import com.just.pojo.Passage;
import com.just.pojo.Type;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface TypeDao {

    @Select("select type,count(id) as passageNum,count(distinct author_id) as authorNum, " +
            "sum(like_num) as likeNum, sum(visit_num) as visitNum " +
            "from tb_passage group by type")
    public List<Type> selectAllType();

    @Select("select * from tb_passage where type = #{type} and is_delete != 1")
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
    public List<Passage> selectPassageByType(String type);
}
