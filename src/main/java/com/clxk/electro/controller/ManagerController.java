package com.clxk.electro.controller;

import com.clxk.electro.service.ManagerService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @Description Manager控制层
 * @Author Clxk
 * @Date 2019/5/30 23:35
 * @Version 1.0
 */
@Controller
@RequestMapping("/manager")
public class ManagerController {

    @Resource
    private ManagerService managerService;

    @RequestMapping("/table/getManagerTable.do")
    public String getManagerTable(HttpServletRequest request) {
        String url = "manager/table-manager";
        if(request.getQueryString() != null && request.getQueryString().contains("editable")) {
            url = "manager/editable-table-manager";
        }
        request.setAttribute("managerTable", managerService.findAll());
        return url;
    }
}
