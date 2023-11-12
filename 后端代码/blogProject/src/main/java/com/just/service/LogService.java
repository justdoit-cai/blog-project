package com.just.service;


import com.just.pojo.LoginLog;
import com.just.pojo.SqlLog;

import java.util.List;

public interface LogService {
    public int add(LoginLog loginLog);
    public List<LoginLog> selectAllLoginLog();
    public List<SqlLog> selectAllSqlLog();
}
