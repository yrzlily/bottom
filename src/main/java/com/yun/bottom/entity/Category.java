package com.yun.bottom.entity;

import lombok.Data;
import org.hibernate.annotations.DynamicInsert;

import javax.persistence.*;

/**
 * @author yrz
 */
@Data
@Entity
@DynamicInsert
@Table(name = "bt_category")
public class Category {

    @Id
    @GeneratedValue
    private Integer id;

    private String name;

    @Column(name = "parent_id")
    private Integer parentId;

    private Integer sort;


}
