package com.yun.bottom.rabbit;

import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @author yrz
 */

public class MessageSender {

    @Autowired
    private RabbitTemplate rabbitTemplate;

    /**
     * 生产者
     * @param i
     */
    public void send(int i){
        String context = "hello " + new Date();
        System.out.println("Sender : " + i);
        this.rabbitTemplate.convertAndSend("hello", context);
    }


    public void topSendOne(){
        String context = "context 1";
        System.out.println("Sander:" + context);
        this.rabbitTemplate.convertAndSend("exchange", "topic.message", context);
    }

    public void topSendTwo(){
        String context = "context 2";
        System.out.println("Sander:" + context);
        this.rabbitTemplate.convertAndSend("exchange", "topic.messages", context);
    }
}
