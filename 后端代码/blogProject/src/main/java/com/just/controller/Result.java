package com.just.controller;

import com.fasterxml.jackson.annotation.JsonView;
import com.just.utils.AnnotationUtil;
import com.just.utils.JwtUtil;
import lombok.Data;
import org.apache.ibatis.javassist.bytecode.annotation.Annotation;

import java.lang.reflect.Field;

@Data
public class Result {
    private String msg;
    @JsonView
    private Object data;
    private String error;

    public Result(String msg, Object data, String error) {
        this.msg = msg;
        this.data = data;
        this.error = error;
    }

    /**
     * 动态修改@JsonView注解的内容
     * 解决@JsonView不能返回嵌套对象的问题
     * @param msg
     * @param data
     * @param error
     * @param view
     * @return
     * @throws NoSuchFieldException
     */
    public static Result getResult(String msg, Object data, String error, Class view) throws NoSuchFieldException {
        Result result = new Result(msg,data, error);
        Field field = result.getClass().getDeclaredField("data");
        AnnotationUtil.modifyAnnoByReflex_field(field, view);
        return result;
    }
}
