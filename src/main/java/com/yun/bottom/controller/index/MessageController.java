package com.yun.bottom.controller.index;

import com.yun.bottom.rabbit.MessageSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author yrz
 */
@RestController
@RequestMapping("/message")
public class MessageController {

//    @Autowired
//    private MessageSender sender;
//
//    @GetMapping("/index")
//    public String index(@RequestParam(value = "count" , required = false,defaultValue = "5")Integer k){
//        for (int i = 0; i <k ; i++) {
//            sender.send(i);
//        }
//
//        return "index";
//    }
//
//    @GetMapping("/top")
//    public String top(@RequestParam(value = "count" , required = false,defaultValue = "5")Integer k){
//        for (int i = 0; i <k ; i++) {
//            System.out.println(i);
//            sender.topSendOne();
//        }
//        return "top";
//    }
}
