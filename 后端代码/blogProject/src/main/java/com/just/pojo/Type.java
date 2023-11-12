package com.just.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Type {
    private String type;
    private int authorNum;
    private int likeNum;
    private int visitNum;
    private int passageNum;
}
