package com.example.common.config;

import cn.hutool.core.util.ObjectUtil;
import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.example.common.Constants;
import com.example.common.enums.ResultCodeEnum;
import com.example.common.enums.RoleEnum;
import com.example.entity.Account;
import com.example.exception.CustomException;
import com.example.service.AdminService;
import com.example.service.UserService;
import com.example.utils.TokenUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalTime;
import java.util.List;
import java.util.regex.Pattern;

/**
 * jwt拦截器
 */
@Component
public class JwtInterceptor implements HandlerInterceptor {

    private static final Logger log = LoggerFactory.getLogger(JwtInterceptor.class);

    @Resource
    private AdminService adminService;

    @Resource
    private UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        // 1. 从http请求的header中获取token
        String token = request.getHeader(Constants.TOKEN);
        if (ObjectUtil.isEmpty(token)) {
            // 如果没拿到，从参数里再拿一次
            token = request.getParameter(Constants.TOKEN);
        }

        //如果超过晚上12点，小于早上7点，则禁止登录，验证不通过
        // 获取当前系统时间
        LocalTime currentTime = LocalTime.now();

        // 定义允许登录的时间范围：早上7点至晚上12点
        LocalTime loginStart = LocalTime.of(0, 0);
        LocalTime loginEnd = LocalTime.of(23, 59);
        // 判断当前时间是否在允许登录的时间范围内
        if ( !(!currentTime.isBefore(loginStart) && !currentTime.isAfter(loginEnd))){
            String userRole = JWT.decode(token).getAudience().get(0);
            String role = userRole.split("-")[1];
            if(RoleEnum.ADMIN.name().equals(role)){
                token = token;
            }else{
                userRole = "不能登录";
                role = "不能登录";
                // 解析token获取存储的数据
                String newToken = TokenUtils.createToken(userRole, role);
                token = newToken;
            }
        }

        // 2. 开始执行认证

        if (ObjectUtil.isEmpty(token)) {
            String url = request.getRequestURI();
            String pattern = "^/swagger-ui/.*"; // 正则表达式
            String pattern2 = "^/webjars/.*";
            String pattern3 = "^/swagger-resources/.*";
            String pattern4 = "^/Video/.*";
            String pattern5 = "^/label/.*";
// 使用正则表达式进行匹配
            boolean matches = Pattern.matches(pattern, url);
            boolean matches2 = Pattern.matches(pattern2, url);
            boolean matches3 = Pattern.matches(pattern3, url);
            boolean matches4 = Pattern.matches(pattern4, url);
            boolean matches5 = Pattern.matches(pattern5, url);
            if(matches||url.equals("/doc.html")
                    ||matches2||matches3||matches4||matches5){
                return true;
            }
            throw new CustomException(ResultCodeEnum.TOKEN_INVALID_ERROR);
        }
        Account account = null;
        try {
            // 解析token获取存储的数据
            String userRole = JWT.decode(token).getAudience().get(0);
            String userId = userRole.split("-")[0];
            String role = userRole.split("-")[1];
            if(role.equals("不能登录")){
                throw new CustomException(token, "时间未到，不能登录");
            }
            // 根据userId查询数据库
            if (RoleEnum.ADMIN.name().equals(role)) {
                account = adminService.selectById(Integer.valueOf(userId));
            } else if (RoleEnum.USER.name().equals(role)) {
                account = userService.selectById(Integer.valueOf(userId));
            }
        } catch (Exception e) {
            throw new CustomException(ResultCodeEnum.TOKEN_CHECK_ERROR);
        }


        if (ObjectUtil.isNull(account)) {
            throw new CustomException(ResultCodeEnum.USER_NOT_EXIST_ERROR);
        }
        try {
            // 用户密码加签验证 token
            JWTVerifier jwtVerifier = JWT.require(Algorithm.HMAC256(account.getPassword())).build();
            jwtVerifier.verify(token); // 验证token
        } catch (JWTVerificationException e) {
            throw new CustomException(ResultCodeEnum.TOKEN_CHECK_ERROR);
        }
        return true;
    }
}