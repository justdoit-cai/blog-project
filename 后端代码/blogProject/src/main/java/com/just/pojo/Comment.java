package com.just.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonKey;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
    private int id;
    private int passageId;
    private String content;
    private int commentatorId;
    private String commentatorAvatar;
    private String commentatorUsername;
    private Date createTime;
    private int likeNum = 0;

    @JsonIgnore
    private int del;

}
