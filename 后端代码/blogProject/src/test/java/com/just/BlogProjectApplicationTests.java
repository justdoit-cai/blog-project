package com.just;

import com.fasterxml.jackson.annotation.JsonView;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.just.dao.CommentDao;
import com.just.dao.PassageDao;
import com.just.dao.UserDao;
import com.just.pojo.Comment;
import com.just.pojo.Passage;
import com.just.pojo.User;
import com.just.utils.AuthorityUtil;
import com.just.utils.JwtUtil;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

import javax.annotation.Resource;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@SpringBootTest
class BlogProjectApplicationTests {

	@Autowired
	UserDao userDao;

	@Autowired
	CommentDao commentDao;

	@Autowired
	PassageDao passageDao;

	@Resource
	private RedisTemplate redisTemplate;

	@Test
	void contextLoads() throws NoSuchMethodException {
		String token = "eyJhbGciOiJub25lIiwidHlwIjoiSldUIn0.eyJzZWNyZXRpZCI6W10sInVzZXJuYW1lIjoiYWRtaW4iLCJwYXNzd29yZCI6IjEyMyIsImlhdCI6MTY2Mjc4MjY4NH0.";
//		JwtUtil.getTypeByToken(token);
		System.out.println(JwtUtil.getTypeByToken(token));
	}

}
