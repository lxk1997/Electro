package com.clxk.electro.service.impl;

import com.clxk.electro.common.Utils;
import com.clxk.electro.dao.AddressDao;
import com.clxk.electro.dao.CartItemDao;
import com.clxk.electro.dao.OrderItemDao;
import com.clxk.electro.model.Address;
import com.clxk.electro.model.CartItem;
import com.clxk.electro.model.OrderItem;
import com.clxk.electro.service.OrderItemService;
import org.aspectj.weaver.ast.Or;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/**
 * @Description 订单条目业务层实现
 * @Author Clxk
 * @Date 2019/6/2 22:32
 * @Version 1.0
 */
@Service
public class OrderItemServiceImpl implements OrderItemService {

    @Resource
    private OrderItemDao orderItemDao;
    @Resource
    private CartItemDao cartItemDao;
    @Resource
    private AddressDao addressDao;

    @Override
    public int insert(OrderItem orderItem) {
        return orderItemDao.insert(orderItem);
    }

    @Override
    public int delete(OrderItem orderItem) {
        return orderItemDao.delete(orderItem);
    }

    @Override
    public int update(OrderItem orderItem) {
        return orderItemDao.update(orderItem);
    }

    @Override
    public int updateStatus(String uid, int status) {
        return orderItemDao.updateStatus(uid, status);
    }

    @Override
    public int deleteByUid(String uid) {
        return orderItemDao.deleteByUid(uid);
    }

    @Override
    public int deleteByOiid(String oiid) {
        return orderItemDao.deleteByOiid(oiid);
    }

    @Override
    public OrderItem findByOiid(String oiid) {
        return orderItemDao.findByOiid(oiid);
    }

    @Override
    public List<OrderItem> findAll() {
        return orderItemDao.findAll();
    }

    @Override
    public List<OrderItem> findByUid(String uid) {
        return orderItemDao.findByUid(uid);
    }

    @Override
    public List<OrderItem> findByCategoryId(String categoryId) {
        return orderItemDao.findByCategoryId(categoryId);
    }

    @Override
    public List<OrderItem> findTopSellingByCategory(String categoryId) {
        return orderItemDao.findTopSellingByCategoryId(categoryId);
    }

    @Override
    public List<OrderItem> findByStatus(int status) {
        return orderItemDao.findByStatus(status);
    }

    @Override
    public String palceOrder(String uid, Address address, String addressType) {
        List<CartItem> cartItems = cartItemDao.findByUid(uid);
        if(cartItems == null || cartItems.size() == 0) {
            return "No Product!!!";
        }
        if(!Utils.matchEmail(address.getEmail())) {
            return "Error Email";
        } else {
            address.setUid(uid);
            address.setAid(Utils.uuid());
            if(addressType.equals("new")) {
                addressDao.insert(address);
            }
            for(CartItem item : cartItems) {
                OrderItem oi = new OrderItem(Utils.uuid(), uid, item.getProduct(), item.getCount(),address, new Date(), OrderItem.UN_PAID);
                orderItemDao.insert(oi);
            }
            return "SUCCESS";
        }
    }

    @Override
    public List<OrderItem> getOrderByStatus(String status) {
        List<OrderItem> orders = null;
        if(status == null || status.equals("")|| status.equals("0"))
            orders = orderItemDao.findAll();
        else orders = orderItemDao.findByStatus(Integer.valueOf(status));
        return orders;
    }

    @Override
    public String loadDataToGrad(String status) throws JSONException {
        List<OrderItem> orders = getOrderByStatus(status);
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

    @Override
    public List<OrderItem> deleteOrder(String oiid, String type, String uid) {
        List<OrderItem> orders = null;
        if(type != null && type.equals("editable")) {
            orderItemDao.deleteByOiid(oiid);
        } else {
            orders = (List<OrderItem>) orderItemDao.findByUid(uid);
            for(OrderItem item : orders) {
                if(item.getOiid().equals(oiid)) {
                    orders.remove(item);
                    orderItemDao.deleteByOiid(oiid);
                    break;
                }
            }
        }
        return orders;
    }

    @Override
    public List<OrderItem> confirmReceipt(String oiid, String uid) {
        List<OrderItem> orders = orderItemDao.findByUid(uid);
        for(OrderItem item : orders) {
            if(item.getOiid().equals(oiid)) {
                item.setStatus(OrderItem.CONFIRMED);
                orderItemDao.update(item);
                break;
            }
        }
        return orders;
    }

}
