package com.clxk.controller;

import com.clxk.model.Manager;
import com.clxk.service.ManagerService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.sql.SQLOutput;

/**
 * @Description 管理员控制层
 * @Author Clxk
 * @Date 2019/4/2 16:55
 * @Version 1.0
 */
@Controller
@RequestMapping("/manager")
public class ManagerController {

    @Resource
    private ManagerService managerService;

    @RequestMapping("/toLogin")
    public String toLogin() {
        return "backstage/login";
    }

    @RequestMapping("login")
    @ResponseBody
    public String login(Manager manager) {
        System.out.println(manager.getUsername() + " " + manager.getPassword());
        Manager man = managerService.findByUsername(manager.getUsername());
        if (man == null) {
            return "Not exist username!";
        } else if (!man.getPassword().equals(manager.getPassword())) {
            return "Password error!";
        } else {
            return "SUCCESS";
        }
    }
}
