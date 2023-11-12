package com.just.service.impl;

import com.just.dao.UserDao;
import com.just.pojo.User;
import com.just.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public boolean checkPassword(String username, String password) {
        if (username == null || username.equals("") || password == null || password.equals("")){
            return false;
        }
        User user = userDao.selectByUsername(username);
        if (user == null){
            return false;
        };
        return password.equals(user.getPassword());
    }

    @Override
    public boolean checkUsername(String username) {
        return userDao.selectByUsername(username) != null;
    }


    @Override
    public List<User> selectAll() {
        return userDao.selectAll();
    }

    @Override
    public User selectById(Integer id) {
        return userDao.selectById(id);
    }

    @Override
    public User selectByUsername(String username) {
        return userDao.selectByUsername(username);
    }

    @Override
    public int updatePassword(Integer id, String password) {
        User user = userDao.selectById(id);
        if(user == null){
            return 0;
        }
        return userDao.updatePassword(user.getId(), password);
    }

    @Override
    public int insert(User user) {
        user.setRegisterTime(new Date());

        return userDao.insert(user);
    }

    @Override
    public int deleteById(Integer id) {
        return userDao.deleteById(id);
    }

    @Override
    public int updateInfo(User user) {
        return userDao.updateInfo(user);
    }

    @Override
    public int updateType(Integer id, String type) {
        return userDao.updateType(id, type);
    }


}
