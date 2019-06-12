package com.clxk.electro.service;

import com.clxk.electro.model.Address;
import com.clxk.electro.model.OrderItem;
import org.aspectj.weaver.ast.Or;
import org.json.JSONException;

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

    int deleteByOiid(String oiid);

    OrderItem findByOiid(String oiid);

    List<OrderItem> findAll();

    List<OrderItem> findByUid(String uid);

    List<OrderItem> findByCategoryId(String categoryId);

    List<OrderItem>findTopSellingByCategory(String categoryId);

    List<OrderItem> findByStatus(int status);

    String palceOrder(String uid, Address address, String addressType);

    List<OrderItem> getOrderByStatus(String status);

    String loadDataToGrad(String status) throws JSONException;

    List<OrderItem> deleteOrder(String oiid, String type, String uid);

    List<OrderItem> confirmReceipt(String oiid, String uid);
}
