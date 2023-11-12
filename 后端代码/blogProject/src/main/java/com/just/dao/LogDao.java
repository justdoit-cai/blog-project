package com.just.dao;

import com.just.pojo.LoginLog;
import com.just.pojo.SqlLog;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface LogDao {
    @Insert("insert into tb_login_log (id,username,type,ip,time,action) " +
            "values (#{id},#{username},#{type},#{ip},#{time},#{action})")
    public int add(LoginLog loginLog);

    @Select("select * from tb_login_log")
    public List<LoginLog> selectAllLoginLog();

    @Select("select id,operation,time,operation_params as operationParams from tb_sql_log")
    public List<SqlLog> selectAllSqlLog();
}
