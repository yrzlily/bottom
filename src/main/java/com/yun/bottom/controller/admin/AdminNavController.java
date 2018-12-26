package com.yun.bottom.controller.admin;

import com.yun.bottom.dto.LayTree;
import com.yun.bottom.entity.Nav;
import com.yun.bottom.enums.Result;
import com.yun.bottom.repository.NavRepository;
import com.yun.bottom.services.NavService;
import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping("/admin/nav")
public class AdminNavController {

    @Autowired
    private NavRepository navRepository;

    @Autowired
    private NavService navService;

    private LinkedHashMap<String, String> map = new LinkedHashMap<>();

    @GetMapping("/index")
    public ModelAndView index(ModelAndView view){

        view.setViewName("/admin/nav/index");
        return view;
    }

    @ResponseBody
    @PostMapping("/list")
    public List<LayTree> findChild(){

        List<LayTree> navInfo = navRepository.findAllTree();

        return navService.findTree(0,navInfo);

    }

    @PostMapping("/edit")
    public ModelAndView edit(@Valid Nav nav , BindingResult result){

        String url = "/common/success";
        map.put("url","/admin/nav/index");
        if(result.hasErrors()){
            url = "/common/error";
            map.put("msg", Objects.requireNonNull(result.getFieldError()).toString());
        }else{
            if(nav.getId() != null){
                navRepository.update(nav.getNavName(),nav.getUrl(),nav.getIcon(),nav.getSort(),nav.getId());
                map.put("msg", "更新成功");
            }else{
                navRepository.save(nav);
                map.put("msg", "添加成功");
            }
        }

        return new ModelAndView(url,map);
    }

    @ResponseBody
    @PostMapping("/del")
    public LinkedHashMap<String, String> del(@RequestParam("id")Integer id){


        try {

            navRepository.deleteById(id);

            map.put("code", Result.RESULT_SUCCESS.getCode().toString());
            map.put("msg",Result.RESULT_SUCCESS.getMsg());
        }catch (Exception e){
            map.put("code","0");
            map.put("msg",e.getMessage());
        }

        return map;
    }

}
