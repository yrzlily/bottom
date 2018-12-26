package com.yun.bottom.controller.index;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author yrz
 */

public class AuthController {

    private final static Logger log = LoggerFactory.getLogger(AuthController.class);

    public void auth(HttpServletResponse response) throws IOException {
        log.info("auth");
    }
}
