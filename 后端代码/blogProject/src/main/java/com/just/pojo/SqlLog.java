package com.just.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SqlLog {
    private int id;
    private String operation;
    private Date time;
    private String operationParams;
}
