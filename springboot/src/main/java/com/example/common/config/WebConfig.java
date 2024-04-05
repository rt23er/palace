package com.example.common.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.annotation.Resource;

@Configuration
public class WebConfig implements  WebMvcConfigurer {

    @Resource
    private JwtInterceptor jwtInterceptor;

    // 加自定义拦截器JwtInterceptor，设置拦截规则
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
//        registry.addInterceptor(jwtInterceptor).addPathPatterns("/**")
//                .excludePathPatterns("/")
//                .excludePathPatterns("/login")
//                .excludePathPatterns("/register")
//                .excludePathPatterns("/Ai/**")
//                .excludePathPatterns("/files/**");
        InterceptorRegistration registration = registry.addInterceptor(jwtInterceptor);
//        所有路径都被拦截
        registration.addPathPatterns("/**");
//        添加不拦截路径
        registration.excludePathPatterns(
                "/",
                "/login",
                "/register",
                "/Ai/**",
                "/files/**",
                "/v3/**",
                "/swagger-ui.html/**",
                "/webjars/**",
                "/swagger-resources/**",
                "/doc.html",
                "/images/**"
        );

    }
}