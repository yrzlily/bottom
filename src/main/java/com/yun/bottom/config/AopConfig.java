package com.yun.bottom.config;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * @author yrz
 */
@Component
@Aspect
public class AopConfig {

    private static final Logger log = LoggerFactory.getLogger(AopConfig.class);

    @Pointcut("execution(* com.yun.bottom.controller.index.*Controller.*(..))")
    public void point(){

    }

    /**
     * 请求信息
     * @param joinPoint 加入切点
     */
    @Before("point()")
    public void doBefore(JoinPoint joinPoint){
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        assert attributes != null;
        HttpServletRequest request = attributes.getRequest();

        //url
        log.info("URL = {}",request.getRequestURL().toString());
        //传输类型
        log.info("HTTP_METHOD = {}",request.getMethod());
        //IP
        log.info("IP = {}" , request.getRemoteAddr());
        //类方法
        log.info("CLASS_METHOD = {}",joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName());
        //参数
        log.info("Args = {}",joinPoint.getArgs());

    }

    /**
     * 结束
     */
    @After("point()")
    public void doAfter(){
        log.info("end");
    }

    /**
     * 响应信息
     * @param object 响应参数
     */
    @AfterReturning(returning = "object" , pointcut = "point()")
    public void doAfterReturning(Object object){
        log.info("RESPONSE = {}",object.toString());
    }

}
