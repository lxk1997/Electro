package com.clxk.electro.controller;

import com.clxk.electro.common.Utils;
import com.clxk.electro.model.User;
import com.clxk.electro.service.UserService;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

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
        return "/login";
    }

    @RequestMapping("/toRegiste.do")
    public String toRegiste() {
        return "/register";
    }

    @RequestMapping("/login.do")
    @ResponseBody
    public String login(HttpSession session, @RequestParam("uname") String uname, @RequestParam("password") String password, @RequestParam("vcode") String code) {
        if(uname == null || uname.trim().isEmpty()) return "Null Username!";
        if(password == null || password.trim().isEmpty()) return "Null Password!";
        if(code == null || code.trim().isEmpty()) return "Null VerifyCode!";
        User u = userService.findByUname(uname);
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
        if(user.getUname() == null || user.getUname().trim().isEmpty()) return "Null Username!";
        if(user.getPassword() == null || user.getPassword().trim().isEmpty()) return "Null Password!";
        if(confirmpass == null || confirmpass.trim().isEmpty()) return "Null Confirm Password!";
        if(code == null || code.trim().isEmpty()) return "Null VerifyCode!";
        if(!code.toLowerCase().equals(session.getAttribute("vcode").toString().toLowerCase())) {
            return "VerifyCode Error!";

        } else
        if(!confirmpass.equals(user.getPassword())) {
            return "Inconsistent Password!";
        } else if(userService.findByUname(user.getUname()) != null) {
            return "User Name Already Exists!";
        } else {
            if(user.getUname() != null && !user.getUname().trim().isEmpty())user.setUname(Utils.escapeXml(user.getUname()));
            if(user.getPassword() != null && !user.getPassword().trim().isEmpty())user.setPassword(Utils.escapeXml(user.getPassword()));
            if(user.getEmail() != null && !user.getEmail().trim().isEmpty())user.setEmail(Utils.escapeXml(user.getEmail()));
            if(user.getPhone() != null && !user.getPhone().trim().isEmpty())user.setPhone(Utils.escapeXml(user.getPhone()));
            user.setUid(Utils.uuid());
            userService.insert(user);
            return "SUCCESS";
        }
    }

    @RequestMapping("/table/getUserTable.do")
    public String getUserTable(HttpServletRequest request) {
        List<User> all = userService.findAll();
        request.setAttribute("userTable", all);
        String queryString = request.getQueryString();
        System.out.println(queryString);
        if(queryString != null && queryString.contains("editable")) {
            return "manager/editable-table-user";
        }
        return "manager/table-user";
    }

}
