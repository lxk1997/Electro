package com.clxk.electro.listener;

import com.clxk.electro.model.CartItem;
import com.clxk.electro.model.OrderItem;
import com.clxk.electro.model.User;
import com.clxk.electro.service.CartItemService;
import com.clxk.electro.service.OrderItemService;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import java.util.List;

@Service
public class MySessionAttributeListener implements HttpSessionAttributeListener {

    @Override
    public void attributeAdded(HttpSessionBindingEvent event) {

    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent event) {
        if(event.getName().equals("user")) {
            System.out.println("========================session(user) removed========================");
            List<CartItem> items = (List<CartItem>) event.getSession().getAttribute("cart");
            List<OrderItem> orderItems = (List<OrderItem>) event.getSession().getAttribute("orders");
            User user = (User) event.getValue();
            System.out.println(user);
            System.out.println("orderItems.length : " + orderItems + orderItems.size());
            if(user != null) {
                CartItemService cartItemService = (CartItemService) getBean(event.getSession().getServletContext(), "cartItemServiceImpl");
                cartItemService.deleteByUid(user.getUid());
                for(CartItem item : items) {
                    cartItemService.insert(item);
                }
                OrderItemService orderItemService = (OrderItemService) getBean(event.getSession().getServletContext(),"orderItemServiceImpl");
                orderItemService.deleteByUid(user.getUid());
                for(OrderItem item: orderItems) {
                    orderItemService.insert(item);
                }
            }
            event.getSession().removeAttribute("cart");
            event.getSession().removeAttribute("cartCnt");
            event.getSession().removeAttribute("cartTotal");
            event.getSession().removeAttribute("haveCart");
            event.getSession().removeAttribute("orders");
        }
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent event) {

    }

    private Object getBean(ServletContext servletContext, String beanName) {
        ApplicationContext application = WebApplicationContextUtils.getWebApplicationContext(servletContext);

        return application.getBean(beanName);
    }
}
