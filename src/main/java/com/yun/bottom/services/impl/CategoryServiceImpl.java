package com.yun.bottom.services.impl;

import com.yun.bottom.dto.CateInfo;
import com.yun.bottom.entity.Category;
import com.yun.bottom.repository.CategoryRepository;
import com.yun.bottom.services.CategoryService;
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
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    @Override
    public Page<Category> findAll(Pageable pageable, String name , Integer parentId) {

        return categoryRepository.findAll(new Specification<Category>() {
            @Override
            public Predicate toPredicate(Root<Category> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                List<Predicate> predicate = new ArrayList<>();
                //名称模糊查询
                if(name != null){
                    predicate.add(criteriaBuilder.like(root.get("name").as(String.class),"%"+ name +"%"));
                }

                if(parentId != null){
                    predicate.add(criteriaBuilder.equal(root.get("parentId").as(String.class),parentId));
                }

                Predicate[] predicates = new Predicate[predicate.size()];
                criteriaQuery.where(criteriaBuilder.and(predicate.toArray(predicates)));
                criteriaQuery.orderBy(criteriaBuilder.asc(root.get("sort").as(Integer.class)));
                criteriaQuery.distinct(true);
                return criteriaQuery.getRestriction();
            }
        },pageable);

    }

    @Override
    public List<CateInfo> breadcrumb(Integer id) {

        List<CateInfo> list = new ArrayList<>();

        if(id != 0){
            CateInfo category = categoryRepository.findPar(id);
            if(category.getParentId() != 0){
                list.addAll(breadcrumb(category.getParentId()));
            }
            list.add(category);
        }

        return list;
    }
}
