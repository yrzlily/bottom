package com.yun.bottom.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * @author yrz
 */
@Entity
@Data
public class AdminRole {

    @Id
    @GeneratedValue
    private Integer id;

}
