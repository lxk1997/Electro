package com.clxk.electro.controller;

import com.clxk.electro.model.Address;
import com.clxk.electro.model.OrderItem;
import com.clxk.electro.model.User;
import com.clxk.electro.service.OrderItemService;
import org.json.JSONException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * @Description 订单条目控制器
 * @Author Clxk
 * @Date 2019/6/2 22:34
 * @Version 1.0
 */
@Controller
@RequestMapping("/orderItem")
public class OrderItemController {

    @Resource
    private OrderItemService orderItemService;

    @RequestMapping("/placeOrder.do")
    @ResponseBody
    public String placeOrder(Address address, String addressType, HttpSession session) {
        User user = (User) session.getAttribute("user");
        return orderItemService.palceOrder(user.getUid(), address, addressType);
    }

    @RequestMapping("/table/getOrderTable.do")
    public String getOrderTable(Model model, String type, String status) {
        model.addAttribute("ordersTable", orderItemService.getOrderByStatus(status));
        model.addAttribute("status", status);
        return "/WEB-INF/views/manager/" + (type.equals("editable") ? "editable-table-order" : "table-order");
    }

    @RequestMapping("/table/loadDataToGrad.do")
    @ResponseBody
    public String loadDataToGrad(String status) throws JSONException {
        return orderItemService.loadDataToGrad(status);
    }

    @RequestMapping("/deleteOrder.do")
    @ResponseBody
    public String deleteOrder(HttpSession session, String oiid, String type) {
        User user = (User) session.getAttribute("user");
        session.setAttribute("orders", orderItemService.deleteOrder(oiid, type, user.getUid()));
        return "SUCCESS";
    }

    @RequestMapping("/updateOrder.do")
    @ResponseBody
    public String updateOrder(OrderItem item) {
        orderItemService.update(item);
        return "SUCCESS";
    }

    @RequestMapping("/confirmReceipt.do")
    @ResponseBody
    public String confirmReceipt(HttpSession session, String oiid) {
        User user = (User) session.getAttribute("user");
        session.setAttribute("orders", orderItemService.confirmReceipt(oiid, user.getUid()));
        return "SUCCESS";
    }


}
