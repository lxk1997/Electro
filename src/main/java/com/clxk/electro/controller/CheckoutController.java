package com.clxk.electro.controller;

import com.clxk.electro.common.PaymentUtil;
import com.clxk.electro.model.CartItem;
import com.clxk.electro.model.OrderItem;
import com.clxk.electro.model.User;
import com.clxk.electro.service.CartItemService;
import com.clxk.electro.service.OrderItemService;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

/**
 * @Description 支付控制层
 * @Author Clxk
 * @Date 2019/6/2 19:56
 * @Version 1.0
 */
@Controller
@RequestMapping("/checkout")
public class CheckoutController {

    @Resource
    private CartItemService cartItemService;
    @Resource
    private OrderItemService orderItemService;

    @RequestMapping("/toCheckout.do")
    public String toCheckout() {
        return "/WEB-INF/views/checkout";
    }

    @RequestMapping("/pay")
    public String pay(HttpSession session, HttpServletResponse response) {
        List<CartItem> items = (List<CartItem>) session.getAttribute("cart");
        Properties properties = new Properties();
        InputStream is = this.getClass().getClassLoader().getResourceAsStream("merchantInfo.properties");
        try {
            properties.load(is);
            String p0_Cmd = "Buy";
            String p1_MerId = properties.getProperty("p1_MerId");
            String p2_Order = items.get(0).getCiid();
            String p3_Amt = "0.01";
            String p4_Cur = "CNY";
            String p5_Pid = "";
            String p6_Pcat = "";
            String p7_Pdesc = "";
            String p8_Url = properties.getProperty("p8_Url");
            String p9_SAF = "";
            String pa_MP = "";
            String pd_FrpId = "ICBC-NET-B2C";
            String pr_NeedResponse = "1";
            String keyValue = properties.getProperty("keyValue");
            String hmac = PaymentUtil.buildHmac(p0_Cmd,p1_MerId,p2_Order,p3_Amt,p4_Cur,p5_Pid,p6_Pcat,p7_Pdesc,p8_Url,p9_SAF,pa_MP,pd_FrpId,pr_NeedResponse,keyValue);
            StringBuilder url = new StringBuilder(properties.getProperty("url"));
            url.append("?p0_Cmd=").append(p0_Cmd);
            url.append("&p1_MerId=").append(p1_MerId);
            url.append("&p2_Order=").append(p2_Order);
            url.append("&p3_Amt=").append(p3_Amt);
            url.append("&p4_Cur=").append(p4_Cur);
            url.append("&p5_Pid=").append(p5_Pid);
            url.append("&p6_Pcat=").append(p6_Pcat);
            url.append("&p7_Pdesc=").append(p7_Pdesc);
            url.append("&p8_Url=").append(p8_Url);
            url.append("&p9_SAF=").append(p9_SAF);
            url.append("&pa_MP=").append(pa_MP);
            url.append("&pd_FrpId=").append(pd_FrpId);
            url.append("&pr_NeedResponse=").append(pr_NeedResponse);
            url.append("&hmac=").append(hmac);
            System.out.println("url: " + url.toString());
            response.sendRedirect(url.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping("/back.do")
    public String back(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        Properties properties = new Properties();
        InputStream is = this.getClass().getClassLoader().getResourceAsStream("merchantInfo.properties");
        User user = (User) session.getAttribute("user");
        properties.load(is);
        String p1_MerId = request.getParameter("p1_MerId");
        String r0_Cmd = request.getParameter("r0_Cmd");
        String r1_Code = request.getParameter("r1_Code");
        String r2_TrxId = request.getParameter("r2_TrxId");
        String r3_Amt = request.getParameter("r3_Amt");
        String r4_Cur = request.getParameter("r4_Cur");
        String r5_Pid = request.getParameter("r5_Pid");
        String r6_Order = request.getParameter("r6_Order");
        String r7_Uid = request.getParameter("r7_Uid");
        String r8_MP = request.getParameter("r8_MP");
        String r9_BType = request.getParameter("r9_BType");
        String hmac = request.getParameter("hmac");

        String keyValue = properties.getProperty("keyValue");

        if(!PaymentUtil.verifyCallback(hmac,p1_MerId,r0_Cmd,r1_Code,r2_TrxId,r3_Amt,r4_Cur,r5_Pid,r6_Order,r7_Uid,r8_MP,r9_BType,keyValue)) {
            request.setAttribute("msg", "本次支付请求失败，请重试!");
        } else {
            response.getWriter().print("success");
            List<CartItem> items = (List<CartItem>) session.getAttribute("cart");
            session.setAttribute("cart", new ArrayList<CartItem>());
            session.setAttribute("cartCnt", 0);
            session.setAttribute("cartTotal", 0);
            cartItemService.deleteByUid(user.getUid());
            orderItemService.updateStatus(user.getUid(), OrderItem.NO_SHIPPED);
            request.setAttribute("msg", "支付成功！等待卖家发货！");
        }

        return "/WEB-INF/views/pay-result";
    }


}
