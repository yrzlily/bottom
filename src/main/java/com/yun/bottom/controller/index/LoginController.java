package com.yun.bottom.controller.index;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * @author yrz
 */
@RestController
@RequestMapping("/login")
public class LoginController {

    @GetMapping("/index")
    public String index(){
        return "login/index";
    }

}
