package com.just.controller;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@CrossOrigin
public class RedisController {
    @Resource
    private RedisTemplate redisTemplate;

    @GetMapping("/pv")
    public Integer getPV(){
        ValueOperations valueOperations = redisTemplate.opsForValue();
        Object pv = valueOperations.get("pv");
        if (pv == null){
            return 0;
        }
        return (Integer) pv;
    }

}
