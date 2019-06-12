package com.clxk.electro.controller;

import com.clxk.electro.model.User;
import com.clxk.electro.service.AddressService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * @Description 地址控制层
 * @Author Clxk
 * @Date 2019/6/2 23:15
 * @Version 1.0
 */
@Controller
@RequestMapping("/address")
public class AddressController {

    @Resource
    private AddressService addressService;

    @RequestMapping("/getAddressByUid.do")
    @ResponseBody
    public String getAddressByUid(HttpSession session) {
        User user = (User) session.getAttribute("user");
        return addressService.getAddressByUid(user.getUid());
    }
}
