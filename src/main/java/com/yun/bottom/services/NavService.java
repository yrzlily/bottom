package com.yun.bottom.services;

import com.yun.bottom.dto.LayTree;
import com.yun.bottom.dto.NavInfo;
import com.yun.bottom.entity.Nav;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * @author yrz
 */
public interface NavService {

    /**
     * 子栏目递归
     * @param id 栏目id
     * @param nav 全部数据
     * @return List
     */
    List<NavInfo> findChild(Integer id , List<NavInfo> nav);

    /**
     * Lay树节点
     * @param id 栏目id
     * @param nav 全部数据
     * @return List
     */
    List<LayTree> findTree(Integer id , List<LayTree> nav);

    /**
     * 分页查询
     * @param pageable
     * @param nav
     * @return
     */
    Page<Nav> findAll(Pageable pageable , Nav nav);
}
