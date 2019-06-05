package com.clxk.electro.service.impl;

import com.clxk.electro.dao.CartItemDao;
import com.clxk.electro.model.CartItem;
import com.clxk.electro.service.CartItemService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description 购物车服务层实现
 * @Author Clxk
 * @Date 2019/6/2 12:02
 * @Version 1.0
 */
@Service
public class CartItemServiceImpl implements CartItemService {

    @Resource
    private CartItemDao cartItemDao;

    @Override
    public int insert(CartItem cartItem) {
        return cartItemDao.insert(cartItem);
    }

    @Override
    public int delete(CartItem cartItem) {
        return cartItemDao.delete(cartItem);
    }

    @Override
    public int deleteByUid(String uid) {
        return cartItemDao.deleteByUid(uid);
    }

    @Override
    public int changeCount(String ciid, int count) {
        return cartItemDao.changeCount(ciid, count);
    }

    @Override
    public CartItem findByPid(String pid) {
        return cartItemDao.findByPid(pid);
    }

    @Override
    public int update(CartItem cartItem) {
        return cartItemDao.update(cartItem);
    }

    @Override
    public CartItem findByCiid(String ciid) {
        return cartItemDao.findByCiid(ciid);
    }

    @Override
    public List<CartItem> findByUid(String uid) {
        return cartItemDao.findByUid(uid);
    }
}
