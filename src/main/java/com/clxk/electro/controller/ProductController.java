package com.clxk.electro.controller;

import com.clxk.electro.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @Description Product控制层
 * @Author Clxk
 * @Date 2019/5/30 21:12
 * @Version 1.0
 */
@Controller
@RequestMapping("/product")
public class ProductController {

    @Resource
    private ProductService productService;

    @RequestMapping("/table/getProductTable.do")
    public String getProductTable(HttpServletRequest request) {

        String queryString = request.getQueryString();
        String url = "manager/table-product";
        if(queryString != null && queryString.contains("editable")) {
            url = "manager/editable-table-product";
        }
        if(queryString == null || queryString.contains("all")) {
            request.setAttribute("productTable", productService.findAll());
        } else if(queryString.contains("1")) {
            request.setAttribute("productTable", productService.findByCategory("1"));
        } else if(queryString.contains("2")) {
            request.setAttribute("productTable", productService.findByCategory("2"));
        } else if(queryString.contains("3")) {
            request.setAttribute("productTable", productService.findByCategory("3"));
        } else if(queryString.contains("4")) {
            request.setAttribute("productTable", productService.findByCategory("4"));
        }
        return url;
    }
}
