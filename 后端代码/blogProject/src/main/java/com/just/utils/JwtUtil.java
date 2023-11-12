package com.just.utils;

import com.just.pojo.User;
import com.just.service.UserService;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.security.PrivateKey;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Component
public class JwtUtil {

    /**
     * Spring 容器所管理的主要是对象实例，而@Autowired 依赖注入的都是容器内的对象实例，
     * 在 Java 中 static 修饰的静态属性（变量和方法）是属于类的，而非属于实例对象。
     * 当类加载器加载静态变量时，Spring上下文尚未加载完成，则类加载器不会在 Bean
     * 中正确注入属性。如下是一个错误的例子：
     */
//    @Autowired
//    private static UserService userService;

    //办法1：@Autowired + 构造器
    private static UserService userService;

    @Autowired
    public JwtUtil(UserService userService) {
        JwtUtil.userService = userService;
    }

    //一天过期
    private static long expire = 60 * 60 * 24;
    //JWT密钥
    private static String secretKey = "helloworld@Ilikeyou_justdoit+thestoryneverends~#lauv;ItsOK!~";

    /**
     * 提供username和type返回token
     *
     * @param username
     * @param type
     * @return
     */
    public static String generateToken(String username, String type) {
        Date now = new Date();
        Date expiration = new Date(now.getTime() + 1000 * expire);
        Map<String, Object> payload = new HashMap<>();
        payload.put("username", username);
        payload.put("type", type);
        return Jwts.builder()
                .setHeaderParam("type", "JWT")
                .setClaims(payload)
                .setIssuedAt(now)
                .setExpiration(expiration)
                .signWith(SignatureAlgorithm.HS512, secretKey)
                .compact();
    }


    /**
     * 验证token是否有效
     *
     * @param token
     * @param user
     * @return
     */
    public static boolean validateToken(String token, User user) {
        String username = getUsernameByToken(token);
        String type = getTypeByToken(token);
        Date expiredDate = getExpiredDateByToken(token);
        return username.equals(user.getUsername()) && type.equals(user.getType()) && !expiredDate.before(new Date());
    }

    /**
     * 从token中获取用户名
     *
     * @param token
     * @return
     */
    public static String getUsernameByToken(String token) {
        return (String) getClaimsByToken(token).get("username");
    }

    /**
     * 从toke中获取用户类型
     *
     * @param token
     * @return
     */
    public static String getTypeByToken(String token) {
        return (String) getClaimsByToken(token).get("type");
    }

    /**
     * 从toke中获取到期时间
     *
     * @param token
     * @return
     */
    public static Date getExpiredDateByToken(String token) {
        return getClaimsByToken(token).getExpiration();
    }

    /**
     * 从token中获取claims
     * @param token
     * @return
     */
    public static Claims getClaimsByToken(String token) {
        return Jwts.parser()
                .setSigningKey(secretKey)
                .parseClaimsJws(token)
                .getBody();
    }

    /**
     * 从request获取用户id的工具方法，简化controller层的代码
     * @param request
     * @return
     */
    public static Integer getIdFromRequest(HttpServletRequest request) {
        try {
            String token = request.getHeader("Authorization");
            String username = JwtUtil.getUsernameByToken(token);
            User user = userService.selectByUsername(username);
            return user.getId();
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 从request获取用户type的工具方法，简化controller层验证身份时的代码
     * 也便于以后修改token的存储方式
     * @param request
     * @return
     */
    public static String getTypeFromRequest(HttpServletRequest request) {
        try {
            String token = request.getHeader("Authorization");
            return getTypeByToken(token);
        } catch (Exception e) {
            return null;
        }
    }

}
