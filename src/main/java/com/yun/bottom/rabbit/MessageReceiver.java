package com.yun.bottom.rabbit;

import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

/**
 * @author yrz
 */

@RabbitListener(queues = "hello")
public class MessageReceiver {

    /**
     * 消费者
     * @param hello
     */
    @RabbitHandler
    public void process(String hello) {
        System.out.println("Receiver  : " + hello);
    }

}
