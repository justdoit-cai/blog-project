package com.just.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonView;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.servlet.http.PushBuilder;
import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Passage {
    @JsonView({IndexPassage.class, TablePassage.class})
    private int id;
    @JsonView(IndexPassage.class)
    private int authorId;
    @JsonView({IndexPassage.class, TablePassage.class})
    private String title;
    @JsonView({IndexPassage.class, TablePassage.class})
    private String description;
    @JsonView(IndexPassage.class)
    private String content;
    @JsonView({IndexPassage.class, TablePassage.class})
    private String type;
    @JsonView({IndexPassage.class, TablePassage.class})
    private Date createTime;
    @JsonView({IndexPassage.class, TablePassage.class})
    private Date updateTime;
    @JsonView({TablePassage.class})
    private int visitNum = 0;
    @JsonView({IndexPassage.class, TablePassage.class})
    private int likeNum = 0;
    @JsonIgnore
    private boolean del;

    //数据库表中没有的字段，补充字段
    @JsonView(IndexPassage.class)
    private String authorName;
    private List<Comment> commentList;
    @JsonView({IndexPassage.class, TablePassage.class})
    private int commentNum;


    /**
     * 主页显示的视图
     */
    public interface IndexPassage {

    }

    /**
     * 本人查看自己的文章列表时的视图（不需要显示文章内容和评论的具体内容）
     */
    public interface TablePassage{

    }
}
