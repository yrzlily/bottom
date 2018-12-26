package com.yun.bottom.repository;

import com.yun.bottom.dto.CateInfo;
import com.yun.bottom.entity.Category;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 * @author yrz
 */
@Repository
public interface CategoryRepository extends JpaRepository<Category , Integer> {

    /**
     * 数据获取
     * @param specification
     * @param pageable
     * @return
     */
    Page<Category> findAll(Specification<Category> specification ,  Pageable pageable);

    /**
     * 导航寻找
     * @param id
     * @return
     */
    @Query("select new com.yun.bottom.dto.CateInfo(c.id , c.name , c.parentId) from Category c where c.id = ?1")
    CateInfo findPar(Integer id);
}
