package com.yun.bottom.dto;

import lombok.Data;

/**
 * @author yrz
 */
@Data
public class CateInfo {

    private Integer id;

    private String name;

    private Integer parentId;

    public CateInfo(Integer id, String name, Integer parentId) {
        this.id = id;
        this.name = name;
        this.parentId = parentId;
    }
}
