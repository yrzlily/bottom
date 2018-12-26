package com.yun.bottom.controller.index;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author yrz
 */
@RestController
public class IndexController extends AuthController{

    @GetMapping("")
    public List index(@RequestBody  @RequestParam("list")List<String> list){
        return list;
    }

    @GetMapping("/cate")
    public String cate(){
        return "cate";
    }

}
