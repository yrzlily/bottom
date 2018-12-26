package com.yun.bottom.filter;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * @author yrz
 */

public class WebFilter implements HandlerInterceptor {

    private final static Logger log = LoggerFactory.getLogger(WebFilter.class);

    private List<String> url = new ArrayList<>();

    /**
     * 开始进入地址请求拦截
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        HttpSession session = request.getSession();
        log.info(request.getHeader("token"));
        if(session.getAttribute("user") != null){
            return true;
        }else{
            //未登录，跳转到登录页
            response.sendRedirect("/login/index");
            return true;
        }
    }

    /**
     * 定义排除拦截URL
     * @return
     */
    List<String> getUrl(){
        url.add("/login/**");
        //网站静态资源
        url.add("/static/**");
        return url;
    }

}
