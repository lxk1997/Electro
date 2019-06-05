package com.clxk.electro.controller;

import com.clxk.electro.common.Utils;
import com.clxk.electro.dao.CartItemDao;
import com.clxk.electro.model.CartItem;
import com.clxk.electro.model.Product;
import com.clxk.electro.model.User;
import com.clxk.electro.service.CartItemService;
import com.clxk.electro.service.ProductService;
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
    private ProductService productService;

    @RequestMapping("/toCart.do")
    public String toCart() {
        return "/WEB-INF/views/cart";
    }

    @RequestMapping("/addCartInit.do")
    public String addCartInit(HttpSession session, HttpServletRequest request) {
        if (session.getAttribute("cart") == null) {
            User user = (User) session.getAttribute("user");
            if (user != null) {
                List<CartItem> cart = cartItemService.findByUid(user.getUid());
                session.setAttribute("cart", cart);
                BigDecimal subTotal = new BigDecimal("0");
                BigDecimal price = null;
                BigDecimal count = null;
                BigDecimal discount = null;
                BigDecimal newPrice = null;
                int itemCount = 0;
                for (CartItem item : cart) {
                    itemCount += item.getCount();
                    count = new BigDecimal(item.getCount() + "");
                    price = new BigDecimal(item.getProduct().getPrice() + "");
                    discount = new BigDecimal(item.getProduct().getDiscount() + "");
                    newPrice = discount.multiply(price);
                    subTotal = subTotal.add(newPrice.multiply(count));
                }
                session.setAttribute("cartTotal", subTotal.doubleValue());
                session.setAttribute("cartCnt", itemCount);
                session.setAttribute("haveCart", "1");
            }
        }
        System.out.println(session.getAttribute("cart"));
        return request.getParameter("url");
    }

    @RequestMapping("/addCartItem.do")
    @ResponseBody
    public String addCartItem(HttpSession session, String pid) {
        List<CartItem> items = (List<CartItem>) session.getAttribute("cart");
        User user = (User) session.getAttribute("user");
        BigDecimal cartTotal = new BigDecimal(session.getAttribute("cartTotal") + "");
        boolean if_have = false;
        for (CartItem item : items) {
            if (item.getProduct().getPid().equals(pid)) {
                item.setCount(item.getCount() + 1);
                BigDecimal price = new BigDecimal(item.getProduct().getPrice() + "");
                BigDecimal discount = new BigDecimal(item.getProduct().getDiscount() + "");
                cartTotal = cartTotal.add(discount.multiply(price));
                if_have = true;
                break;
            }
        }
        if(!if_have) {
            Product product = productService.findByPid(pid);
            items.add(new CartItem(Utils.uuid(),user.getUid(),product,1));
            BigDecimal price = new BigDecimal(product.getPrice() + "");
            BigDecimal discount = new BigDecimal(product.getDiscount() + "");
            cartTotal = cartTotal.add(discount.multiply(price));
        }
        session.setAttribute("cart", items);
        session.setAttribute("cartTotal", cartTotal.doubleValue());
        session.setAttribute("cartCnt", (int)session.getAttribute("cartCnt") + 1);
        return "success";

    }

    @RequestMapping("/deleteCartItem.do")
    @ResponseBody
    public String deleteCartItem(HttpSession session, String ciid) {
        List<CartItem> items = (List<CartItem>) session.getAttribute("cart");
        BigDecimal cartTotal = new BigDecimal(session.getAttribute("cartTotal") + "");
        for (CartItem item : items) {
            if (item.getCiid().equals(ciid)) {
                if(item.getCount() > 1) {
                    item.setCount(item.getCount() - 1);
                } else {
                    items.remove(item);
                }
                BigDecimal price = new BigDecimal(item.getProduct().getPrice() + "");
                BigDecimal discount = new BigDecimal(item.getProduct().getDiscount() + "");
                cartTotal = cartTotal.subtract(discount.multiply(price));
                break;
            }
        }
        session.setAttribute("cart", items);
        session.setAttribute("cartTotal", cartTotal.doubleValue());
        session.setAttribute("cartCnt", (int)session.getAttribute("cartCnt") - 1);
        return "success";
    }

    @RequestMapping("/deleteAllCartItem.do")
    @ResponseBody
    public String deleteAllCartItem(HttpSession session, String ciid) {
        List<CartItem> items = (List<CartItem>) session.getAttribute("cart");
        BigDecimal cartTotal = new BigDecimal(session.getAttribute("cartTotal") + "");
        for (CartItem item : items) {
            if (item.getCiid().equals(ciid)) {
                BigDecimal price = new BigDecimal(item.getProduct().getPrice() + "");
                BigDecimal discount = new BigDecimal(item.getProduct().getDiscount() + "");
                BigDecimal count = new BigDecimal(item.getCount() + "");
                cartTotal = cartTotal.subtract(discount.multiply(price).multiply(count));
                items.remove(item);
                session.setAttribute("cart", items);
                session.setAttribute("cartTotal", cartTotal.doubleValue());
                session.setAttribute("cartCnt", (int)session.getAttribute("cartCnt") - count.intValue());
                break;
            }
        }
        return "success";
    }

}
