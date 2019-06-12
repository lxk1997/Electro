package com.clxk.electro.controller;

import com.clxk.electro.service.OrderItemService;
import com.clxk.electro.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * @Description 初始化控制器
 * @Author Clxk
 * @Date 2019/6/1 0:15
 * @Version 1.0
 */
@Controller
@RequestMapping("init")
public class InitController {

    @Resource
    private ProductService productService;
    @Resource
    private OrderItemService orderItemService;

    @RequestMapping("toIndex.do")
    public String toIndex(HttpSession session) {
        session.setAttribute("laptops", productService.findByDateOrderAndCategory("1"));
        session.setAttribute("smartphones", productService.findByDateOrderAndCategory("2"));
        session.setAttribute("cameras", productService.findByDateOrderAndCategory("3"));
        session.setAttribute("accessories", productService.findByDateOrderAndCategory("4"));
        session.setAttribute("topLaptops", orderItemService.findTopSellingByCategory("1"));
        session.setAttribute("topSmartphones", orderItemService.findTopSellingByCategory("2"));
        session.setAttribute("topCameras", orderItemService.findTopSellingByCategory("3"));
        session.setAttribute("topAccessories", orderItemService.findTopSellingByCategory("4"));
        session.setAttribute("np", session.getAttribute("laptops"));
        session.setAttribute("ts", session.getAttribute("topLaptops"));
        session.setAttribute("hotDeal", productService.findHotDealProduct());
        return "/index";
    }

    @RequestMapping("newProductRefresh.do")
    @ResponseBody
    public String newProductRefresh(HttpSession session, int number, String type) {
        String s = type;
        switch (number) {
            case 1:
                session.setAttribute(s, session.getAttribute((type.equals("np") ? "laptops" : "topLaptops")));
                break;
            case 2:
                session.setAttribute(s, session.getAttribute((type.equals("np") ? "smartphones" : "topSmartphones")));
                break;
            case 3:
                session.setAttribute(s, session.getAttribute((type.equals("np") ? "cameras" : "topCameras")));
                break;
            case 4:
                session.setAttribute(s, session.getAttribute((type.equals("np") ? "accessories" : "topAccessories")));
                break;
        }
        return "success";
    }
}
