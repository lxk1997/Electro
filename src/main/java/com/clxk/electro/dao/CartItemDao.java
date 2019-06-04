package com.clxk.electro.dao;

import com.clxk.electro.model.CartItem;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Description 购物车条目持久层
 * @Author Clxk
 * @Date 2019/6/2 11:22
 * @Version 1.0
 */
@Repository
public interface CartItemDao {

    int insert(CartItem cartItem);

    int delete(CartItem cartItem);

    int update(CartItem cartItem);

    CartItem findByCiid(String ciid);

    List<CartItem> findByUid(String uid);

    CartItem findByPid(String pid);

    int changeCount(@Param("ciid") String ciid, @Param("count") int count);
}
