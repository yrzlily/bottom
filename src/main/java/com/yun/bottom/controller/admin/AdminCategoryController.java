package com.yun.bottom.controller.admin;

import com.yun.bottom.bean.Layer;
import com.yun.bottom.dto.CateInfo;
import com.yun.bottom.entity.Category;
import com.yun.bottom.repository.CategoryRepository;
import com.yun.bottom.services.CategoryService;
import com.yun.bottom.utils.ResultUtils;
import lombok.var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Objects;

/**
 * @author yrz
 */
@Controller
@RequestMapping("/admin/cate")
public class AdminCategoryController {

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private CategoryService categoryService;

    private LinkedHashMap<String, String> map = new LinkedHashMap<>();

    @GetMapping("/index")
    public ModelAndView index(ModelAndView view , @RequestParam(value = "parentId" , required = false)Integer parentId){

        if(parentId == null){
            parentId = 0;
        }

        List<CateInfo> cateInfo = categoryService.breadcrumb(parentId);

        view.addObject("cateInfo" , cateInfo);
        view.addObject("parentId",parentId);

        view.setViewName("/admin/category/index");
        return view;
    }

    @ResponseBody
    @PostMapping("/index")
    public Layer index(Pageable pageable , @RequestParam(value = "name" , required = false)String name , @RequestParam(value = "parentId" , required = false)Integer parentId){
        pageable = PageRequest.of(pageable.getPageNumber()-1 , pageable.getPageSize());

        Page<Category> page = categoryService.findAll(pageable , name , parentId);
        return ResultUtils.layer(page.getTotalPages() , page.getContent());
    }

    @ResponseBody
    @PostMapping("/find")
    public List<CateInfo> cate(@RequestParam(value = "id" , required = false)Integer id){
        return categoryService.breadcrumb(id);
    }

    @GetMapping("/add")
    public ModelAndView cateAdd(ModelAndView view , @RequestParam("parentId")Integer parentId){
        view.addObject("parentId",parentId);
        view.setViewName("/admin/category/add");
        return view;
    }

    @PostMapping("/add")
    public ModelAndView cateAdd(@Valid Category category , BindingResult bindingResult){

        String url = "";
        map.put("url","/admin/category/add");
        if(bindingResult.hasErrors()){
            url = "/common/error";
            map.put("msg", Objects.requireNonNull(bindingResult.getFieldError()).toString());
        }else{
            categoryRepository.save(category);
            url = "/common/success";
            map.put("msg", "添加成功");
        }
        return new ModelAndView(url,map);
    }

    @GetMapping("/edit/{id}")
    public ModelAndView edit(@PathVariable("id")Integer id , ModelAndView view){

        Category category = categoryRepository.findById(id).get();
        view.addObject("cate",category);
        view.setViewName("/admin/category/edit");
        return view;
    }

    @PostMapping("/edit")
    public ModelAndView edit(@Valid Category category , BindingResult result){

        String url = "/common/success";

        if(result.hasErrors()){
            map.put("msg", Objects.requireNonNull(result.getFieldError()).toString());
            url = "/common/error";
        }else{
            categoryRepository.save(category);
            map.put("msg", "修改成功");
            map.put("url","edit/" + category.getId());
        }

        var x = category;
        System.out.println(x);
        return new ModelAndView(url,map);
    }

    @ResponseBody
    @GetMapping("/del/{id}")
    public void cateDel(@PathVariable("id")Integer id){

        categoryRepository.deleteById(id);
    }

}
