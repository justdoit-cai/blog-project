package com.just.service;

import com.just.pojo.User;
import org.springframework.stereotype.Service;

import java.util.List;

public interface UserService {

    public boolean checkPassword(String username, String password);

    public boolean checkUsername(String username);


    public List<User> selectAll();

    public User selectById(Integer id);

    public User selectByUsername(String username);
    public int updatePassword(Integer id, String password);

    public int insert(User user);

    public int deleteById(Integer id);

    public int updateInfo(User user);

    public int updateType(Integer id, String type);
}
