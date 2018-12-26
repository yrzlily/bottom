package com.yun.bottom.enums;

/**
 * @author yrz
 */

public enum  Result {
    //layer读取数据
    LAYER_GET_DATA(0,"读取成功"),
    //请求返回结果
    RESULT_SUCCESS(1,"请求成功");

    Result(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    private Integer code;

    private String msg;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
