package com.yun.bottom.controller.admin;

import com.yun.bottom.entity.AdminUser;
import com.yun.bottom.repository.AdminUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.LinkedHashMap;

/**
 * @author yrz
 */
@Controller
@RequestMapping("/admin")
public class AdminLoginController {

    @Autowired
    private AdminUserRepository adminUserRepository;

    private LinkedHashMap<String, String> map = new LinkedHashMap<>();

    @GetMapping("/login")
    public String index(HttpServletRequest request){

        HttpSession session = request.getSession();
        if(session.getAttribute("admin_user") != null){
            return "/admin/index";
        }else{
            return "/admin/login";
        }


    }

    @PostMapping("/login")
    public ModelAndView login(HttpServletRequest request , @RequestParam("username")String username,@RequestParam("password")String password){

        AdminUser adminUser = adminUserRepository.findByUsernameAndPassword(username, DigestUtils.md5DigestAsHex(password.getBytes()));

        String url = "/common/success";

        if(adminUser !=null){
            HttpSession session = request.getSession();
            session.setAttribute("admin_user", adminUser);

            map.put("msg","登录成功");
            map.put("url","/admin/index");
        }else{
            url = "/common/error";
            map.put("msg","登录失败");
            map.put("url","/admin/login");
        }



        return new ModelAndView(url,map);
    }

    @GetMapping("/logout")
    public ModelAndView logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        map.put("msg","退出成功");
        map.put("url","/admin/login");

        return new ModelAndView("/common/success",map);
    }

}
