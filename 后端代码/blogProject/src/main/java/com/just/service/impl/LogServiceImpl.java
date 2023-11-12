package com.just.service.impl;

import com.just.dao.LogDao;
import com.just.pojo.LoginLog;
import com.just.pojo.SqlLog;
import com.just.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LogServiceImpl implements LogService {
    @Autowired
    private LogDao logDao;

    @Override
    public int add(LoginLog loginLog) {
        return logDao.add(loginLog);
    }

    @Override
    public List<LoginLog> selectAllLoginLog() {
        return logDao.selectAllLoginLog();
    }

    @Override
    public List<SqlLog> selectAllSqlLog() {
        return logDao.selectAllSqlLog();
    }

}
