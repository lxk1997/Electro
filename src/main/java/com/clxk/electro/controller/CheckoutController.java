package com.clxk.electro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Description 支付控制层
 * @Author Clxk
 * @Date 2019/6/2 19:56
 * @Version 1.0
 */
@Controller
@RequestMapping("/checkout")
public class CheckoutController {

    @RequestMapping("toCheckout.do")
    public String toCheckout() {
        return "/WEB-INF/views/checkout";
    }

}
