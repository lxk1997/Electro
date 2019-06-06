package com.clxk.electro.listener;

import com.clxk.electro.model.CartItem;
import com.clxk.electro.model.User;
import com.clxk.electro.service.CartItemService;
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
            List<CartItem> items = (List<CartItem>) event.getSession().getAttribute("cart");
            User user = (User) event.getSession().getAttribute("user");
            if(user != null) {
                CartItemService cartItemService = (CartItemService) getBean(event.getSession().getServletContext(), "cartItemServiceImpl");
                cartItemService.deleteByUid(user.getUid());
                for(CartItem item : items) {
                    cartItemService.insert(item);
                }
            }
            event.getSession().removeAttribute("cart");
            event.getSession().removeAttribute("cartCnt");
            event.getSession().removeAttribute("cartTotal");
            event.getSession().removeAttribute("haveCart");
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
