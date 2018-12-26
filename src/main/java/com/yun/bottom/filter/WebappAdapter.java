package com.yun.bottom.filter;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.web.PageableHandlerMethodArgumentResolver;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import java.util.List;

/**
 * @author yrz
 */
@Configuration
public class WebappAdapter extends WebMvcConfigurationSupport {

    /**
     * 注册拦截器
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        LoginFilter loginInterceptor = new LoginFilter();
        // addPathPatterns 添加拦截url，     excludePathPatterns 排除拦截url
        registry.addInterceptor(new LoginFilter()).addPathPatterns("/admin/**").excludePathPatterns(loginInterceptor.getUrl());
        registry.addInterceptor(new WebFilter()).addPathPatterns("/user/**","/cate/**").excludePathPatterns(new WebFilter().getUrl());
        super.addInterceptors(registry);
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry){
        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
        super.addResourceHandlers(registry);
    }

    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
        // 注册Spring data jpa pageable的参数分解器
        argumentResolvers.add(new PageableHandlerMethodArgumentResolver());
    }

}
