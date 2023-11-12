package com.just.dao;

import com.just.pojo.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * 数据库sql映射需要添加@Mapper被容器识别到
 */
@Mapper
public interface UserDao {
    @Select("select * from tb_user where is_delete != 1")
    @Results(
            id = "userMap",
            value ={
                    @Result(column = "last_login", property = "lastLogin"),
                    @Result(column = "register_time", property = "registerTime"),
                    @Result(column = "isDelete", property = "del"),
            }
    )
    public List<User> selectAll();
    @Select("select * from tb_user where id = #{id} and is_delete != 1")
    @ResultMap({"userMap"})
    public User selectById(Integer id);

    @Select("select * from tb_user where username = #{username} and is_delete != 1")
    @ResultMap({"userMap"})
    public User selectByUsername(String username);



    @Update("update tb_user set is_delete = 1 where id = #{id}")
    public int deleteById(Integer id);

    @Update("update tb_user set password = #{password} where id = #{id}")
    public int updatePassword(Integer id, String password);

    @Update("update tb_user set type = #{type} where id = #{id}")
    public int updateType(Integer id, String type);

    @Update("update tb_user set phone = #{phone}, email = #{email}, " +
            "age = #{age}, sex = #{sex}, avatar = #{avatar}, location = #{location}," +
            "ps = #{ps},intro = #{intro} where id = #{id}")
    public int updateInfo(User user);

    @Insert("insert into tb_user (username, password, register_time) values (#{username}, #{password}, #{registerTime})")
    public int insert(User user);

    @Select("select max(id) from tb_user")
    public int selectMaxId();

    @Update("update tb_user set last_login = #{lastLogin} where id = #{id}")
    public int updateLastLogin(User user);
}
