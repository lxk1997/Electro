package com.clxk.electro.controller;

import com.clxk.electro.common.Utils;
import com.clxk.electro.model.OrderItem;
import com.clxk.electro.model.User;
import com.clxk.electro.service.OrderItemService;
import com.clxk.electro.service.UserService;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Description 用户控制层
 * @Author Clxk
 * @Date 2019/3/31 20:04
 * @Version 1.0
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;
    @Resource
    private OrderItemService orderItemService;

    @RequestMapping("/toLogin.do")
    public String toLogin(HttpSession session) {
        return "/WEB-INF/views/" + (session.getAttribute("user") != null ? "my-account" : "login");
    }

    @RequestMapping("/toRegiste.do")
    public String toRegiste(HttpSession session) {
        return "/WEB-INF/views/" + (session.getAttribute("user") != null ? "my-account" : "register");
    }

    @RequestMapping("/restoryPassword.do")
    @ResponseBody
    public String restoryPassword(HttpSession session, String oldP, String newP) {
        User user = (User) session.getAttribute("user");
        user = userService.restoryPassword(user, oldP, newP);
        if(user == null) {
            return "Input Error Of Original Password!!!";
        } else {
            session.setAttribute("user",user);
            return "SUCCESS";
        }
    }

    @RequestMapping("/login.do")
    @ResponseBody
    public String login(HttpSession session, @RequestParam("uname") String uname,
                        @RequestParam("password") String password, @RequestParam("vcode") String code) {
        User user = (User) session.getAttribute("user");
        String msg = userService.login(uname, password, code, (String) session.getAttribute("vcode"));
        if(msg.equals("SUCCESS")) {
            session.setAttribute("user", userService.findByUname(uname));
            List<OrderItem> orders = orderItemService.findByUid(user.getUid());
            session.setAttribute("orders", orders);
        }
        return msg;
    }

    @RequestMapping("/registe.do")
    @ResponseBody
    public String registe(HttpSession session, User user, @RequestParam("confirmpass") String confirmpass,
                          @RequestParam("vcode") String code) {
        return userService.registe(user, confirmpass, code, (String)session.getAttribute("vcode"));
    }

    @RequestMapping("/table/getUserTable.do")
    public String getUserTable(Model model, String type) {
        model.addAttribute("userTable", userService.findAll());
        return "/WEB-INF/views/manager/" + (type != null && type.equals("editable") ? "editable-table-user" : "table-user");
    }

    @RequestMapping("/table/loadDataToGrad.do")
    @ResponseBody
    public String loadDataToGrad(){
        try {
            return userService.loadDataToGrad();
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping("/updateUser.do")
    @ResponseBody
    public String updateUser(User user) {
        userService.update(user);
        return "SUCCESS";
    }

    @RequestMapping("/updateAccount.do")
    @ResponseBody
    public String updateAccount(HttpSession session, String email, String phone) {
        User user = (User) session.getAttribute("user");
        String msg = userService.updateAccount(user, email, phone);
        if(msg.equals("SUCCESS")){
            session.setAttribute("user", userService.findByUid(user.getUid()));
        }
        return msg;
    }

    @RequestMapping("/logout.do")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "/index";
    }

}
