package com.clxk.electro.listener;

import com.clxk.electro.model.CartItem;
import com.clxk.electro.model.OrderItem;
import com.clxk.electro.model.User;
import com.clxk.electro.service.CartItemService;
import com.clxk.electro.service.OrderItemService;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.servlet.http.HttpSessionBindingEvent;
import java.util.List;

@Service
public class MySessionListener implements HttpSessionListener {


    @Override
    public void sessionCreated(HttpSessionEvent se) {
        System.out.println("session created.....");
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        System.out.println("session destroyed.....");
        List<CartItem> items = (List<CartItem>) se.getSession().getAttribute("cart");
        List<OrderItem> orderItems = (List<OrderItem>) se.getSession().getAttribute("orders");
        User user = (User) se.getSession().getAttribute("user");
        if(user != null) {
            CartItemService cartItemService = (CartItemService) getBean(se.getSession().getServletContext(), "cartItemServiceImpl");
            cartItemService.deleteByUid(user.getUid());
            for(CartItem item : items) {
                cartItemService.insert(item);
            }
            OrderItemService orderItemService = (OrderItemService) getBean(se.getSession().getServletContext(),"orderItemServiceImpl");
            orderItemService.deleteByUid(user.getUid());
            for(OrderItem item: orderItems) {
                orderItemService.insert(item);
            }
        }

    }

    private Object getBean(ServletContext servletContext, String beanName) {
        ApplicationContext application = WebApplicationContextUtils.getWebApplicationContext(servletContext);

        return application.getBean(beanName);
    }
}
