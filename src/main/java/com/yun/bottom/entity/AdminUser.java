package com.yun.bottom.entity;

import lombok.Data;
import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * @author yrz
 */
@Entity
@Data
@Table(name = "bt_admin_user")
public class AdminUser {

    @Id
    @GeneratedValue
    private Integer id;

    @NotNull
    private String username;

    private String password;

    private String avatar;

    @Column(name = "create_time")
    private String createTime;

    @Column(name = "role_id")
    private Integer roleId;
}
