package com.just.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoginLog {
    private int id;
    private String username;
    private String type;
    private String ip;
    private Date time;
    private String action;

    public LoginLog(String username, String type, String ip, Date time, String action) {
        this.username = username;
        this.type = type;
        this.ip = ip;
        this.time = time;
        this.action = action;
    }
}
