package com.clxk.electro.controller;

import com.clxk.electro.model.User;
import com.clxk.electro.service.CartItemService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * @Description 购物车控制层
 * @Author Clxk
 * @Date 2019/6/2 12:11
 * @Version 1.0
 */
@Controller
@RequestMapping("/cart")
public class CartController {

    @Resource private CartItemService cartItemService;

    @RequestMapping("/toCart.do")
    public String toCart(HttpSession session) {
        return "/WEB-INF/views/" + (session.getAttribute("user") == null ? "login" : "cart");
    }

    @RequestMapping("/addCartInit.do")
    public String addCartInit(HttpSession session, String url) {
        if (session.getAttribute("cart") == null) {
            User user = (User) session.getAttribute("user");
            session.setAttribute("cart", cartItemService.findByUid(user.getUid()));
            session.setAttribute("cartTotal", cartItemService.getSubTotalByUid(user.getUid()));
            session.setAttribute("cartCnt", cartItemService.getCartItemCount(user.getUid()));
            session.setAttribute("haveCart", "1");
        }
        return url;
    }

    @RequestMapping("/addCartItem.do")
    @ResponseBody
    public String addCartItem(HttpSession session, String pid) {
        User user = (User) session.getAttribute("user");
        session.setAttribute("cart", cartItemService.addCartItem(pid, user.getUid()));
        session.setAttribute("cartTotal", cartItemService.getSubTotalByUid(user.getUid()));
        session.setAttribute("cartCnt", cartItemService.getCartItemCount(user.getUid()));
        return "success";

    }

    @RequestMapping("/deleteCartItem.do")
    @ResponseBody
    public String deleteCartItem(HttpSession session, String ciid, String is_all) {
        boolean all;
        if(is_all.equals("1")) all = true;
        else all = false;
        User user = (User) session.getAttribute("user");
        session.setAttribute("cart", cartItemService.deleteCartItem(ciid, user.getUid(), all));
        session.setAttribute("cartTotal", cartItemService.getSubTotalByUid(user.getUid()));
        session.setAttribute("cartCnt", cartItemService.getCartItemCount(user.getUid()));
        return "success";
    }

}
