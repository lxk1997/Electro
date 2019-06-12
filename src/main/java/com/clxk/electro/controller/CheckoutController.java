package com.clxk.electro.controller;

import com.clxk.electro.common.PaymentUtil;
import com.clxk.electro.model.CartItem;
import com.clxk.electro.model.OrderItem;
import com.clxk.electro.model.User;
import com.clxk.electro.service.CartItemService;
import com.clxk.electro.service.OrderItemService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Description 支付控制层
 * @Author Clxk
 * @Date 2019/6/2 19:56
 * @Version 1.0
 */
@Controller
@RequestMapping("/checkout")
public class CheckoutController {

    @Resource private CartItemService cartItemService;
    @Resource private OrderItemService orderItemService;

    @RequestMapping("/toCheckout.do")
    public String toCheckout(HttpSession session) {
        return "/WEB-INF/views/" + (session.getAttribute("user") == null ? "login" : "checkout");
    }

    @RequestMapping("/pay.do")
    public String pay(HttpSession session, HttpServletResponse response) {
        List<CartItem> items = (List<CartItem>) session.getAttribute("cart");
        try {
            response.sendRedirect(PaymentUtil.getResponseUrl(items.get(0).getCiid()));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping("/back.do")
    public String back(String p1_MerId, String r0_Cmd, String r1_Code, String r2_TrxId, String r3_Amt,
                       String r4_Cur, String r5_Pid, String r6_Order, String r7_Uid, String r8_MP, String r9_BType,
                       String hmac, HttpServletResponse response, HttpSession session, Model model) throws IOException {
        User user = (User) session.getAttribute("user");
        String keyValue = PaymentUtil.getKeyValue();

        if (!PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid, r8_MP, r9_BType, keyValue)) {
            model.addAttribute("msg", "本次支付请求失败，请重试!");
        } else {
            cartItemService.deleteByUid(user.getUid());
            response.getWriter().print("success");
            session.setAttribute("cart", new ArrayList<CartItem>());
            session.setAttribute("cartCnt", 0);
            session.setAttribute("cartTotal", 0);
            orderItemService.updateStatus(user.getUid(), OrderItem.NO_SHIPPED);
            model.addAttribute("msg", "支付成功！等待卖家发货！");
        }
        return "/WEB-INF/views/pay-result";
    }


}
