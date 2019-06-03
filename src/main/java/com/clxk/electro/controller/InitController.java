package com.clxk.electro.controller;

import com.clxk.electro.model.OrderItem;
import com.clxk.electro.model.Product;
import com.clxk.electro.service.OrderItemService;
import com.clxk.electro.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.FileWriter;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;

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
    public String toIndex(HttpSession session, HttpServletRequest request) {
        session.setAttribute("laptops", productService.findByDateOrderAndCategory("1"));
        session.setAttribute("smartphones", productService.findByDateOrderAndCategory("2"));
        session.setAttribute("cameras", productService.findByDateOrderAndCategory("3"));
        session.setAttribute("accessories", productService.findByDateOrderAndCategory("4"));
        session.setAttribute("topLaptops", orderItemService.findTopSellingByCategory("1"));
        session.setAttribute("topSmartphones", orderItemService.findTopSellingByCategory("2"));
        session.setAttribute("topCameras", orderItemService.findTopSellingByCategory("3"));
        session.setAttribute("topAccessories", orderItemService.findTopSellingByCategory("4"));
        session.setAttribute("np", session.getAttribute("laptops"));
        return "/index";
    }

    @RequestMapping("newProductRefresh.do")
    @ResponseBody
    public String newProductRefresh(HttpServletRequest request, HttpSession session, int number) {
        switch (number) {
            case 1:
                session.setAttribute("np", session.getAttribute("laptops"));
                break;
            case 2:
                session.setAttribute("np", session.getAttribute("smartphones"));
                break;
            case 3:
                session.setAttribute("np", session.getAttribute("cameras"));
                break;
            case 4:
                session.setAttribute("np", session.getAttribute("accessories"));
                break;
        }
        return "success";
    }
}
