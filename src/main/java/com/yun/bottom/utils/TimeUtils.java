package com.yun.bottom.utils;

import java.sql.Date;
import java.text.SimpleDateFormat;

/**
 * @author yrz
 */
public class TimeUtils {

    /**
     * 时间戳转时间
     * @param seconds
     * @param format
     * @return
     */
    public static String timeChangeDate(String seconds,String format){

        if(seconds == null || seconds.isEmpty() || seconds.equals("null")){
            return "";
        }
        if(format == null || format.isEmpty()){
            format = "yyyy-MM-dd HH:mm:ss";
        }
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(new Date(Long.valueOf(seconds+"000")));
    }

    /**
     * 获取当前时间
     * @return
     */
    public static String getTime(){
        long time = System.currentTimeMillis();
        String t = String.valueOf(time/1000);
        return t;
    }

}
