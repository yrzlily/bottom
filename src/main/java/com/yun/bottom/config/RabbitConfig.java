package com.yun.bottom.config;

import com.rabbitmq.client.AMQP;
import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Configuration;


/**
 * @author yrz
 */
@Configuration
public class RabbitConfig {

    public Queue queue(){
        return new Queue("hello");
    }

}
