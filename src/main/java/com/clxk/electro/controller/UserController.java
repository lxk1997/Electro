package com.clxk.electro.controller;

import com.clxk.electro.model.User;
import com.clxk.electro.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * @Description TODO
 * @Author Clxk
 * @Date 2019/3/31 20:04
 * @Version 1.0
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    @RequestMapping("/toLogin.do")
    public String toLogin() {
        return "frontdesk/login";
    }

    @RequestMapping("/toRegiste.do")
    public String toRegiste() {
        return "frontdesk/register";
    }

    @RequestMapping("/login.do")
    @ResponseBody
    public String login(HttpSession session, @RequestParam("username") String username, @RequestParam("password") String password, @RequestParam("vcode") String code) {
        User u = userService.findByUsername(username);
        if(!code.toLowerCase().equals(session.getAttribute("vcode").toString().toLowerCase())) {
            return "VerifyCode Error!";
        } else if(u == null) {
            return "Not Exist Username!";
        } else if(!u.getPassword().equals(password)) {
            return "Password Error!";
        } else {
            session.setAttribute("user", u);
            return "SUCCESS";
        }
    }

    @RequestMapping("/registe.do")
    @ResponseBody
    public String registe(HttpSession session, User user, @RequestParam("confirmpass") String confirmpass, @RequestParam("vcode") String code) {
        if(!code.toLowerCase().equals(session.getAttribute("vcode").toString().toLowerCase())) {
            return "VerifyCode Error!";
        } else if(!confirmpass.equals(user.getPassword())) {
            return "Inconsistent Password!";
        } else if(userService.findByUsername(user.getUsername()) != null) {
            return "User Name Already Exists!";
        } else {
            userService.insert(user);
            return "SUCCESS";
        }
    }
}
