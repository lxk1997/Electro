package com.clxk.electro.service;

import com.clxk.electro.model.CartItem;

import java.util.List;

/**
 * @Description 购物车条目服务层接口
 * @Author Clxk
 * @Date 2019/6/2 12:01
 * @Version 1.0
 */
public interface CartItemService {

    int insert(CartItem cartItem);

    int delete(CartItem cartItem);

    int changeCount(String ciid, int count);

    CartItem findByPid(String pid);

    int update(CartItem cartItem);

    CartItem findByCiid(String ciid);

    List<CartItem> findByUid(String uid);
}
