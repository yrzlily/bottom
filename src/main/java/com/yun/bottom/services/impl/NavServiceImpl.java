package com.yun.bottom.services.impl;

import com.yun.bottom.dto.LayTree;
import com.yun.bottom.dto.NavInfo;
import com.yun.bottom.entity.Nav;
import com.yun.bottom.repository.NavRepository;
import com.yun.bottom.services.NavService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

/**
 * @author yrz
 */
@Service
public class NavServiceImpl implements NavService {

    @Autowired
    private NavRepository navRepository;

    @Override
    public List<NavInfo> findChild(Integer id, List<NavInfo> nav) {
        List<NavInfo> list = new ArrayList<>();

        for (NavInfo n:nav){
            if(n.getNavParentId().equals(id)){

                n.setNav(findChild(n.getId() , nav));
                list.add(n);
            }
        }

        return list;
    }

    @Override
    public List<LayTree> findTree(Integer id, List<LayTree> nav) {
        List<LayTree> list = new ArrayList<>();

        for (LayTree n:nav){
            if(n.getNavParentId().equals(id)){

                n.setChildren(findTree(n.getId() , nav));
                list.add(n);
            }
        }

        return list;
    }

    @Override
    public Page<Nav> findAll(Pageable pageable, Nav nav) {
        return navRepository.findAll(new Specification<Nav>() {
            @Override
            public Predicate toPredicate(Root<Nav> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
                return null;
            }
        },pageable);
    }
}
