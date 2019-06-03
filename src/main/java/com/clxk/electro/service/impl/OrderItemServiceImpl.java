package com.clxk.electro.service.impl;

import com.clxk.electro.dao.OrderItemDao;
import com.clxk.electro.model.OrderItem;
import com.clxk.electro.service.OrderItemService;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/**
 * @Description 订单条目服务层实现
 * @Author Clxk
 * @Date 2019/6/2 22:32
 * @Version 1.0
 */
@Service
public class OrderItemServiceImpl implements OrderItemService {

    @Resource
    private OrderItemDao orderItemDao;

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

}
