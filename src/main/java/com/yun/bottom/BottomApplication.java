package com.yun.bottom;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

/**
 * @author yrz
 */
@SpringBootApplication
@EnableWebMvc
public class BottomApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(BottomApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(BottomApplication.class);
    }
}
