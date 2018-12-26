package com.yun.bottom.services;

import com.yun.bottom.entity.AdminUser;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * @author yrz
 */
public interface AdminUserService {

    /**
     * 分页查找
     * @param pageable 分页信息
     * @param username 查询条件
     * @return 搜索结果
     */
    Page<AdminUser> findAll(Pageable pageable, String username);

}
