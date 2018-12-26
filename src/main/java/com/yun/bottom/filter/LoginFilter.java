package com.yun.bottom.filter;


import org.springframework.web.servlet.HandlerInterceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * @author yrz
 */

public class LoginFilter implements HandlerInterceptor {

    private List<String> url = new ArrayList<>();

    /**
     * 开始进入地址请求拦截
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        HttpSession session = request.getSession();
        if(session.getAttribute("admin_user") != null){
            return true;
        }else{
            //未登录，跳转到登录页
            response.sendRedirect("/admin/login");
            return false;
        }
    }

    /**
     * 定义排除拦截URL
     * @return
     */
    List<String> getUrl(){
        url.add("/admin/login");

        //网站静态资源
        url.add("/static/**");
        return url;
    }

}
