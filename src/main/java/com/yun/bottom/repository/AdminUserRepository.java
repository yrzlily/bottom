package com.yun.bottom.repository;

import com.yun.bottom.entity.AdminUser;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;

/**
 * @author yrz
 */
public interface AdminUserRepository extends JpaRepository<AdminUser, Integer> {

    /**
     * 用户列表
     * @param specification 查询条件
     * @param pageable 分页信息
     * @return 用户结果
     */
    Page<AdminUser> findAll(Specification<AdminUser> specification, Pageable pageable);

    /**
     * 登录
     * @param username
     * @param password
     * @return
     */
    AdminUser findByUsernameAndPassword(String username , String password);

    /**
     * 修改用户
     * @param username
     * @param password
     * @param avatar
     * @param id
     */
    @Transactional(rollbackOn = Exception.class)
    @Modifying
    @Query("update AdminUser u set u.username = ?1 , u.password = ?2 , u.avatar = ?4 where u.id =  ?3")
    void edit(String username , String password , Integer id , String avatar);

}
