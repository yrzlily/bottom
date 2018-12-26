package com.yun.bottom.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.*;

/**
 * @author yrz
 */
public class FilesUtils {

    private static final Logger log = LoggerFactory.getLogger(FilesUtils.class);

    /**
     * 上传文件
     * @param request
     * @param file
     * @return
     * @throws IOException
     */
    public static String upload(HttpServletRequest request , MultipartFile file ) throws IOException {

        File path = new File(ResourceUtils.getURL("classpath:").getPath());
        if(!path.exists()) {
            path = new File("");
        }
        System.out.println("path:"+path.getAbsolutePath());
        File upload = new File(path.getAbsolutePath(),"static/images/upload/");
        if(!upload.exists()) {
            upload.mkdirs();
        }


        String uploadDir = request.getServletContext().getRealPath("/");

        log.info(uploadDir);

        String type = Objects.requireNonNull(file.getOriginalFilename()).substring(file.getOriginalFilename().lastIndexOf("."));;
        UUID uid = UUID.randomUUID();
        String fileName = uid + type;
        log.info(fileName);

        OutputStream os=new FileOutputStream(upload + "/" + fileName);
        //获取输入流 CommonsMultipartFile 中可以直接得到文件的流
        InputStream is=file.getInputStream();
        int temp;
        //一个一个字节的读取并写入
        while((temp=is.read())!=(-1))
        {
            os.write(temp);
        }
        os.flush();
        os.close();
        is.close();

        return "/static/images/upload/" + fileName;
    }

    public static Map<String,Object> result(String file){
        Map<String , Object> map = new LinkedHashMap<>();
        map.put("code" , 0);
        map.put("msg" , "上传成功");

        Map<String , Object> files = new HashMap<>();
        files.put("src" , file);
        map.put("data" , files);
        return map;
    }


}
