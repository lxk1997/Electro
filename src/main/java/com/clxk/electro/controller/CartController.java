package com.clxk.electro.controller;

import com.clxk.electro.dao.CartItemDao;
import com.clxk.electro.model.CartItem;
import com.clxk.electro.model.Product;
import com.clxk.electro.model.User;
import com.clxk.electro.service.CartItemService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.List;

/**
 * @Description 购物车控制层
 * @Author Clxk
 * @Date 2019/6/2 12:11
 * @Version 1.0
 */
@Controller
@RequestMapping("/cart")
public class CartController {

    @Resource
    private CartItemService cartItemService;
    @Resource
    private CartItemDao cartItemDao;

    @RequestMapping("/addCartInit.do")
    public String addCartInit(HttpSession session, HttpServletRequest request) {
        if(session.getAttribute("cart") == null) {
            User user = (User) session.getAttribute("user");
            if(user != null) {
                System.out.println(user.getUid());
                List<CartItem> cart = cartItemDao.findByUid(user.getUid());
                session.setAttribute("cart", cart);
                BigDecimal subTotal = new BigDecimal("0");
                BigDecimal price = null;
                BigDecimal count = null;
                BigDecimal discount = null;
                BigDecimal newPrice = null;
                int itemCount = 0;
                for(CartItem item : cart) {
                    itemCount += item.getCount();
                    count = new BigDecimal(item.getCount() + "");
                    price = new BigDecimal(item.getProduct().getPrice() + "");
                    discount = new BigDecimal(item.getProduct().getDiscount()+"");
                    newPrice = discount.multiply(price);
                    subTotal = subTotal.add(newPrice.multiply(count));
                }
                session.setAttribute("cartTotal", subTotal.doubleValue());
                session.setAttribute("cartCnt", itemCount);
            }
        }
        return request.getParameter("url");
    }

}
