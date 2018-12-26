package com.yun.bottom.utils;

import com.yun.bottom.bean.Layer;
import com.yun.bottom.enums.Result;

/**
 * @author yrz
 */
public class ResultUtils {

    public static Layer layer(Integer count , Object data){
        Layer layer = new Layer();
        layer.setCode(Result.LAYER_GET_DATA.getCode());
        layer.setMsg(Result.LAYER_GET_DATA.getMsg());
        layer.setCount(count);
        layer.setData(data);
        return layer;
    }

}
