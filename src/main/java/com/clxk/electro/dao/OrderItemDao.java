package com.clxk.electro.dao;

import com.clxk.electro.model.OrderItem;
import org.apache.ibatis.annotations.Param;
import org.aspectj.weaver.ast.Or;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Description 订单条目持久层
 * @Author Clxk
 * @Date 2019/6/2 20:47
 * @Version 1.0
 */
@Repository
public interface OrderItemDao {

    int insert(OrderItem orderItem);

    int delete(OrderItem orderItem);

    int deleteByOiid(String oiid);

    int update(OrderItem orderItem);

    int updateStatus(@Param("uid") String uid, @Param("status") int status);

    OrderItem findByOiid(String oiid);

    int deleteByUid(String uid);

    List<OrderItem> findAll();

    List<OrderItem> findByUid(String uid);

    List<OrderItem> findByCategoryId(String categoryId);

    List<OrderItem> findTopSellingByCategoryId(String categoryId);


    List<OrderItem> findByStatus(int status);


}
