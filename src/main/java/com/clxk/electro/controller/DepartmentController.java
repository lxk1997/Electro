package com.clxk.electro.controller;

import com.clxk.electro.service.DepartmentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * @Description Department控制层
 * @Author Clxk
 * @Date 2019/5/30 22:19
 * @Version 1.0
 */
@Controller
@RequestMapping("/department")
public class DepartmentController {

    @Resource private DepartmentService departmentService;

    @RequestMapping("/table/getDepartment.do")
    public String getDepartmentTable(String type, Model model) {
        model.addAttribute("departmentTable", departmentService.findAll());
        return "/WEB-INF/views/manager/" + (type != null && type.equals("editable") ? "editable-table-department" : "table-department");
    }
}
