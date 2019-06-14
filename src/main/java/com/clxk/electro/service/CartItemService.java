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


    int deleteByUid(String uid);

    List<CartItem> findByUid(String uid);

    double getSubTotalByUid(String uid);

    int getCartItemCount(String uid);

    List<CartItem> addCartItem(String pid, String uid);

    List<CartItem> deleteCartItem(String ciid, String uid, boolean all);
}
