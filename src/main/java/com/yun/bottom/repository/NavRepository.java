package com.yun.bottom.repository;


import com.yun.bottom.dto.LayTree;
import com.yun.bottom.dto.NavInfo;
import com.yun.bottom.entity.Nav;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

/**
 * @author yrz
 */
@Repository
public interface NavRepository extends JpaRepository<Nav , Integer> {

    /**
     * 过滤查找
     * @return List
     */
    @Query("select new com.yun.bottom.dto.NavInfo(n.id,n.navName,n.url,n.icon,n.navParentId) from Nav n")
    List<NavInfo> findAllList();

    /**
     * 过滤查找
     * @return List
     */
    @Query("select new com.yun.bottom.dto.LayTree(n.navName,n.url,n.id,n.navParentId,n.sort,n.icon) from Nav n")
    List<LayTree> findAllTree();
    /**
     * 分页查询
     * @param specification
     * @param pageable
     * @return
     */
    Page<Nav> findAll(Specification<Nav> specification, Pageable pageable);

    /**
     * 修改部分
     * @param navName
     * @param url
     * @param icon
     * @param sort
     * @param id
     */
    @Transactional(rollbackOn = Exception.class)
    @Modifying
    @Query("update Nav n set n.navName = ?1 , n.url = ?2, n.icon = ?3 ,n.sort = ?4 where n.id = ?5")
    void update(String navName , String url , String icon , Integer sort , Integer id);
}
