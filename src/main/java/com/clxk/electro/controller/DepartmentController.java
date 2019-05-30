package com.clxk.electro.controller;

import com.clxk.electro.service.DepartmentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @Description Department控制层
 * @Author Clxk
 * @Date 2019/5/30 22:19
 * @Version 1.0
 */
@Controller
@RequestMapping("/department")
public class DepartmentController {

    @Resource
    private DepartmentService departmentService;

    @RequestMapping("/table/getDepartment.do")
    public String getDepartmentTable(HttpServletRequest request) {
        String url = "manager/table-department";
        if(request.getQueryString() != null && request.getQueryString().contains("editable")) {
            url = "manager/editable-table-department";
        }
        request.setAttribute("departmentTable", departmentService.findAll());
        return url;
    }
}
