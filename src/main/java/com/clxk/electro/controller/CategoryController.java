package com.clxk.electro.controller;

import com.clxk.electro.service.CategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

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
    public String getCategoryTable(String type, Model model) {
        model.addAttribute("categoryTable", categoryService.findAll());
        return "/WEB-INF/views/manager/" + (type != null && type.equals("editable") ? "editable-table-category" : "table-category");
    }
}
