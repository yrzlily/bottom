package com.yun.bottom.controller.admin;

import com.yun.bottom.repository.NavRepository;
import com.yun.bottom.services.NavService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * @author yrz
 */
@RequestMapping("/admin")
@Controller
public class AdminIndexController{

    @Autowired
    private NavRepository navRepository;

    @Autowired
    private NavService navService;

    @RequestMapping(value = {"/index",""})
    public ModelAndView index(ModelAndView view){

        view.addObject("nav",navService.findChild(0,navRepository.findAllList()));

        view.setViewName("/admin/index");
        return view;
    }

}
