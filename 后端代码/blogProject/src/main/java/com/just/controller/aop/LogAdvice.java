package com.just.controller.aop;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Component
@Aspect
public class LogAdvice {
    @Resource
    private RedisTemplate redisTemplate;

    /**
     * 对所有代码进行aop，记录网站访问量
     * 但是弊端是一次请求会有多个数据包，导致记录多次
     * 暂时只记录主页的访问量
     */
    @Pointcut("execution(public * com.just.controller.PassageController.selectIndexPassage(..))")
    private void pv(){}

    @Before("pv()")
    public void increPV(){
        ValueOperations valueOperations = redisTemplate.opsForValue();
        Object pv = valueOperations.get("pv");
        if (pv == null){
            valueOperations.set("pv", 1);
        }else {
            Long pv1 = valueOperations.increment("pv");
        }
    }
}
