package com.yun.bottom.controller;

import com.yun.bottom.utils.FilesUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.sql.Date;
import java.util.Map;

/**
 * @author yrz
 */
@RequestMapping("/file")
@RestController
public class FilesController {

    @PostMapping("/upload")
    public Map<String, Object> upload(@RequestParam("file") MultipartFile file , HttpServletRequest request) throws IOException {

        return FilesUtils.result(FilesUtils.upload(request ,file));
    }

}
