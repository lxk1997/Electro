package com.clxk.electro.controller;

import com.clxk.electro.service.ManagerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

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
    public String getManagerTable(String type, Model model) {
        model.addAttribute("managerTable", managerService.findAll());
        return "/WEB-INF/views/manager/" + (type != null && type.equals("editable") ? "editable-table-manager" : "table-manager");
    }
}
