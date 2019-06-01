package com.clxk.electro.controller;

import com.clxk.electro.service.CategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @Description Category控制层
 * @Author Clxk
 * @Date 2019/5/30 22:19
 * @Version 1.0
 */
@Controller
@RequestMapping("/category")
public class CategoryController {

    @Resource
    private CategoryService categoryService;

    @RequestMapping("/table/getCategory.do")
    public String getCategoryTable(HttpServletRequest request) {
        String url = "/WEB-INF/views/manager/table-category";
        if(request.getQueryString() != null && request.getQueryString().contains("editable")) {
            url = "/WEB-INF/views/manager/editable-table-category";
        }
        request.setAttribute("categoryTable", categoryService.findAll());
        return url;
    }
}
