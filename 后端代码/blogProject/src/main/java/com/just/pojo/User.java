package com.just.pojo;


import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonView;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.ReadOnlyProperty;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    @JsonView(SessionUser.class)
    private int id;
    @JsonView(SessionUser.class)
    private String username;
    private String password;
    @JsonView(SessionUser.class)
    private String type;
    private String phone;
    private String location;
    private String ps;
    private String intro;
    private String email;
    private int age;
    private char sex;
    @JsonView(SessionUser.class)
    private String avatar;
    private Date lastLogin;
    private Date registerTime;
    @JsonIgnore
    private boolean del;

    public interface SessionUser{

    }
}
