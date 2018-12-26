package com.yun.bottom.dto;

import lombok.Data;

import java.util.List;

/**
 * lay树结构
 * @author yrz
 */
@Data
public class LayTree {

    private Integer id;

    private String name;

    private boolean spread = true;

    private Integer navParentId;

    private String url;

    private List<LayTree> children;

    private Integer sort;

    private String icon;

    public LayTree(String name,String url ,Integer id, Integer navParentId , Integer sort,String icon) {
        this.name = name;
        this.url = url;
        this.id = id;
        this.sort = sort;
        this.icon = icon;
        this.navParentId = navParentId;
    }
}
