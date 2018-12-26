package com.yun.bottom.entity;

import lombok.Data;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * @author yrz
 */
@Entity
@DynamicUpdate
@Table(name = "bt_admin_role")
@Data
public class Role {

    @Id
    @GeneratedValue
    private Integer id;

    @Column(name = "role_name")
    private String roleName;

}
