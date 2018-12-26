package com.yun.bottom.entity;


import lombok.Data;
import org.hibernate.annotations.DynamicInsert;

import javax.persistence.*;
import java.util.List;

/**
 * @author yrz
 */
@Entity
@DynamicInsert
@Data
@Table(name = "bt_admin_nav")
public class Nav {

    @Id
    @GeneratedValue
    private Integer id;

    @Column(name = "nav_name")
    private String navName;

    @Column(name = "nav_parent_id")
    private Integer navParentId;

    @Column(name = "sort")
    private Integer sort;

    private String url;

    private String icon;

    @Column(name = "create_time")
    private String createTime;

    @Transient
    private List<Nav> nav;

}
