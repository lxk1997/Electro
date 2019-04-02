package com.clxk.controller;

import com.clxk.model.User;
import com.clxk.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

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

    @RequestMapping("/toLogin")
    public String toLogin() {
        return "frontdesk/login";
    }

    @RequestMapping("/toRegiste")
    public String toRegiste() {
        return "frontdesk/register";
    }

    @RequestMapping("/login")
    @ResponseBody
    public String login(@RequestParam("username") String username, @RequestParam("password") String password) {
        User u = userService.findByUsername(username);
        if(u == null) {
            return "Not exist username!";
        } else if(!u.getPassword().equals(password)) {
            return "Password error!";
        } else {
            return "SUCCESS";
        }
    }

    @RequestMapping("/registe")
    @ResponseBody
    public String registe(User user, @RequestParam("confirmpass") String confirmpass) {
        if(!confirmpass.equals(user.getPassword())) {
            return "Inconsistent password!";
        } else if(userService.findByUsername(user.getUsername()) != null) {
            return "User name already exists!";
        } else {
            userService.insert(user);
            return "SUCCESS";
        }
    }
}
