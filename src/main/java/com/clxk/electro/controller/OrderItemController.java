package com.clxk.electro.controller;

import com.clxk.electro.common.Utils;
import com.clxk.electro.model.Address;
import com.clxk.electro.model.CartItem;
import com.clxk.electro.model.OrderItem;
import com.clxk.electro.model.User;
import com.clxk.electro.service.AddressService;
import com.clxk.electro.service.OrderItemService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
            session.setAttribute("cart", new ArrayList<CartItem>());
            session.setAttribute("cartTotal", 0);
            session.setAttribute("cartCnt", 0);
            return "SUCCESS";
        }
    }

}
