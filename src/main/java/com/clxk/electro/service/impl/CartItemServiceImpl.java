package com.clxk.electro.service.impl;

import com.clxk.electro.common.Utils;
import com.clxk.electro.dao.CartItemDao;
import com.clxk.electro.dao.ProductDao;
import com.clxk.electro.model.CartItem;
import com.clxk.electro.service.CartItemService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.List;

/**
 * @Description 购物车业务逻辑层实现
 * @Author Clxk
 * @Date 2019/6/2 12:02
 * @Version 1.0
 */
@Service
public class CartItemServiceImpl implements CartItemService {

    @Resource
    private CartItemDao cartItemDao;
    @Resource
    private ProductDao productDao;

    @Override
    public int deleteByUid(String uid) {
        return cartItemDao.deleteByUid(uid);
    }

    @Override
    public List<CartItem> findByUid(String uid) {
        return cartItemDao.findByUid(uid);
    }

    @Override
    public double getSubTotalByUid(String uid) {
        List<CartItem> cart = cartItemDao.findByUid(uid);
        BigDecimal subTotal = new BigDecimal("0");
        for (CartItem item : cart) {
            subTotal = subTotal.add(new BigDecimal(item.getSubTotal()));
        }
        return subTotal.doubleValue();
    }

    @Override
    public int getCartItemCount(String uid) {
        List<CartItem> cart = cartItemDao.findByUid(uid);
        int cnt = 0;
        for (CartItem item : cart) {
            cnt += item.getCount();
        }
        return cnt;
    }

    @Override
    public List<CartItem> addCartItem(String pid, String uid) {
        List<CartItem> carts = cartItemDao.findByUid(uid);
        boolean have = false;
        for (CartItem item : carts) {
            if (item.getProduct().getPid().equals(pid)) {
                have = true;
                item.setCount(item.getCount() + 1);
                cartItemDao.changeCount(item.getCiid(), 1);
                break;
            }
        }
        if (!have) {
            CartItem item = new CartItem(Utils.uuid(), uid, productDao.findByPid(pid), 1);
            cartItemDao.insert(item);
            carts.add(item);
        }
        return carts;
    }

    @Override
    public List<CartItem> deleteCartItem(String ciid, String uid, boolean all) {
        List<CartItem> carts = cartItemDao.findByUid(uid);
        for (CartItem item : carts) {
            if (item.getCiid().equals(ciid)) {
                if (all || item.getCount() == 1) {
                    cartItemDao.delete(item);
                    carts.remove(item);
                    break;
                } else {
                    item.setCount(item.getCount() - 1);
                    cartItemDao.changeCount(ciid, -1);
                    break;
                }
            }
        }
        return carts;
    }
}
