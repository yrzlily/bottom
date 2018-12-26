package com.yun.bottom.controller.admin;

import com.yun.bottom.bean.Layer;
import com.yun.bottom.entity.AdminUser;
import com.yun.bottom.repository.AdminUserRepository;
import com.yun.bottom.services.AdminUserService;
import com.yun.bottom.utils.ResultUtils;
import com.yun.bottom.utils.TimeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Objects;

/**
 * @author yrz
 */
@RequestMapping("/admin/user")
@Controller
public class AdminUserController {

    @Autowired
    private AdminUserRepository adminUserRepository;

    @Autowired
    private AdminUserService adminUserService;

    private LinkedHashMap<String, String> map = new LinkedHashMap<>();

    @GetMapping("/index")
    public ModelAndView index(ModelAndView view){

        view.setViewName("/admin/user/index");
        return view;
    }

    /**
     * 用户列表
     * @param pageable
     * @param username
     * @return
     */
    @ResponseBody
    @PostMapping("/index")
    public Layer index(Pageable pageable , @RequestParam(name = "username" , required = false)String username){
        pageable = PageRequest.of(pageable.getPageNumber()-1 , pageable.getPageSize());
        Page<AdminUser> users = adminUserService.findAll(pageable , username);

        return ResultUtils.layer(users.getTotalPages() , users.getContent());
    }

    /**
     * 添加用户
     * @return
     */
    @GetMapping("/add")
    public ModelAndView add(){
        return new ModelAndView("/admin/user/add");
    }

    @PostMapping("/add")
    public ModelAndView addUser(@Valid AdminUser adminUser){
        adminUser.setCreateTime(TimeUtils.timeChangeDate(TimeUtils.getTime() , "yyyy-MM-dd HH:mm:ss"));
        adminUser.setPassword(DigestUtils.md5DigestAsHex(adminUser.getPassword().getBytes()));
        adminUserRepository.save(adminUser);
        map.put("msg","添加成功");
        map.put("url","/adminUser/add");
        return new ModelAndView("/common/success",map);
    }

    /**
     * 编辑用户
     * @param id
     * @param view
     * @return
     */
    @GetMapping("/edit/{id}")
    public ModelAndView edit(@PathVariable("id")Integer id , ModelAndView view){
        view.addObject("adminUser", adminUserRepository.findById(id).get());
        view.setViewName("/admin/user/edit");
        return view;
    }

    @PostMapping("/edit")
    public ModelAndView editUser(@Valid AdminUser adminUser, BindingResult result ){

        AdminUser users = adminUserRepository.findById(adminUser.getId()).get();

        if("".equals(adminUser.getPassword())){
            adminUser.setPassword(users.getPassword());
        }else {
            adminUser.setPassword(DigestUtils.md5DigestAsHex(adminUser.getPassword().getBytes()));
        }

        map.put("url","/adminUser/edit/"+ adminUser.getId());
        String url = "";

        if(result.hasErrors()){
            url = "/common/error";
            map.put("msg", Objects.requireNonNull(result.getFieldError()).toString());
        }else{

            adminUserRepository.edit(adminUser.getUsername() , adminUser.getPassword() , adminUser.getId() , adminUser.getAvatar());
            url = "/common/success";
            map.put("msg", "修改成功");
        }

        return new ModelAndView(url , map);
    }

    /**
     * 删除用户
     * @param id
     */
    @PostMapping("/del/{id}")
    public void del(@PathVariable("id")Integer id){
        adminUserRepository.deleteById(id);
    }

    @GetMapping("/role")
    public ModelAndView role(ModelAndView view){

        view.setViewName("/user/role");
        return view;
    }



}
