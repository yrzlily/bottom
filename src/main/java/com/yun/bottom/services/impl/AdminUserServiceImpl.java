package com.yun.bottom.services.impl;

import com.yun.bottom.entity.AdminUser;
import com.yun.bottom.repository.AdminUserRepository;
import com.yun.bottom.services.AdminUserService;
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
public class AdminUserServiceImpl implements AdminUserService {

    @Autowired
    private AdminUserRepository adminUserRepository;

    @Override
    public Page<AdminUser> findAll(Pageable pageable, String username) {
        return adminUserRepository.findAll(new Specification<AdminUser>() {

            @Override
            public Specification<AdminUser> or(Specification<AdminUser> other) {
                return null;
            }

            @Override
            public Predicate toPredicate(Root<AdminUser> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                List<Predicate> predicate = new ArrayList<>();
                //名称模糊查询
                if(username != null){
                    predicate.add(criteriaBuilder.like(root.get("username").as(String.class),"%"+ username +"%"));
                }
                Predicate[] predicates = new Predicate[predicate.size()];
                criteriaQuery.where(criteriaBuilder.and(predicate.toArray(predicates)));
                criteriaQuery.orderBy(criteriaBuilder.asc(root.get("id").as(Integer.class)));
                criteriaQuery.distinct(true);
                return criteriaQuery.getRestriction();
            }
        },pageable);
    }
}
