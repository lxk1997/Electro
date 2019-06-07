package com.clxk.electro.service;

import com.clxk.electro.model.OrderItem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Description 订单条目服务层接口
 * @Author Clxk
 * @Date 2019/6/2 22:31
 * @Version 1.0
 */
public interface OrderItemService {

    int insert(OrderItem orderItem);

    int delete(OrderItem orderItem);

    int update(OrderItem orderItem);

    int updateStatus(String uid, int status);

    int deleteByUid(String uid);

    OrderItem findByOiid(String oiid);

    List<OrderItem> findAll();

    List<OrderItem> findByUid(String uid);

    List<OrderItem> findByCategoryId(String categoryId);

    List<OrderItem>findTopSellingByCategory(String categoryId);

    List<OrderItem> findByStatus(int status);
}
