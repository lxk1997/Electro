package com.clxk.electro.controller;

import com.clxk.electro.common.Utils;
import com.clxk.electro.model.Address;
import com.clxk.electro.model.CartItem;
import com.clxk.electro.model.OrderItem;
import com.clxk.electro.model.User;
import com.clxk.electro.service.AddressService;
import com.clxk.electro.service.OrderItemService;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

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
    @Resource
    private AddressService addressService;

    @RequestMapping("/placeOrder.do")
    @ResponseBody
    public String placeOrder(Address address, String addressType, HttpSession session, HttpServletRequest request) {
        User user = (User) session.getAttribute("user");
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cart");
        if(cartItems == null || cartItems.size() == 0) {
            return "No Product!!!";
        }
        if(!address.getEmail().matches("^[a-z0-9A-Z]+[- | a-z0-9A-Z . _]+@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-z]{2,}$")) {
            return "Error Email";
        } else {
            address.setUid(user.getUid());
            address.setAid(Utils.uuid());
            if(addressType.equals("new")) {
                addressService.insert(address);
            }
            for(CartItem item : cartItems) {
                OrderItem oi = new OrderItem(Utils.uuid(), user.getUid(), item.getProduct(), item.getCount(),address, new Date(), OrderItem.UN_PAID);
                orderItemService.insert(oi);
            }
            return "SUCCESS";
        }
    }

    @RequestMapping("/table/getOrderTable.do")
    public String getOrderTable(HttpServletRequest request) {
        String url = "/WEB-INF/views/manager/";
        List<OrderItem> orders = null;
        if(request.getParameter("type").equals("editable")) {
            url += "editable-";
        }
        String status = request.getParameter("status");
        if(status == "" || status.equals("0")) orders = orderItemService.findAll();
        else orders = orderItemService.findByStatus(Integer.valueOf(status));
        request.setAttribute("ordersTable", orders);
        request.setAttribute("status", status);
        url += "table-order";
        return url;
    }

    @RequestMapping("/table/loadDataToGrad.do")
    @ResponseBody
    public String loadDataToGrad(HttpServletRequest request) throws JSONException {
        List<OrderItem> orders = null;
        String status = request.getParameter("status");
        if(status == null || status == "" || status.equals("0")) orders = orderItemService.findAll();
        else orders = orderItemService.findByStatus(Integer.valueOf(status));
        JSONArray data = new JSONArray();
        for(OrderItem item : orders) {
            JSONObject order = new JSONObject();
            order.put("Order Id",item.getOiid());
            order.put("Product Id", item.getProduct().getPid());
            order.put("User Id", item.getUid());
            order.put("Product Name", item.getProduct().getPname());
            order.put("Count", item.getCount());
            order.put("Date",item.getDate().toString());
            order.put("Notes", item.getNotes());
            order.put("Address Id", item.getAddress().getAid());
            order.put("Status", item.getStatus());
            data.put(order);
        }
        return data.toString();
    }

    @RequestMapping("/deleteOrder.do")
    @ResponseBody
    public String deleteOrder(HttpSession session, String oiid, String type) {
        if(type != null && type.equals("editable")) {
            orderItemService.deleteByOiid(oiid);
            return "SUCCESS";
        }
        List<OrderItem> orders = (List<OrderItem>) session.getAttribute("orders");
        for(OrderItem item : orders) {
            if(item.getOiid().equals(oiid)) {
                orders.remove(item);
                break;
            }
        }
        session.setAttribute("orders", orders);
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
        List<OrderItem> orders = (List<OrderItem>) session.getAttribute("orders");
        for(OrderItem item : orders) {
            if(item.getOiid().equals(oiid)) {
                item.setStatus(OrderItem.CONFIRMED);
                break;
            }
        }
        session.setAttribute("orders", orders);
        return "SUCCESS";
    }


}
