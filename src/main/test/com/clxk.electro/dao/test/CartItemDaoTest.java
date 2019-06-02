package com.clxk.electro.dao.test;

import com.clxk.electro.common.Utils;
import com.clxk.electro.dao.CartItemDao;
import com.clxk.electro.dao.ProductDao;
import com.clxk.electro.dao.UserDao;
import com.clxk.electro.model.CartItem;
import com.clxk.electro.model.Product;
import com.clxk.electro.model.User;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description TODO
 * @Author Clxk
 * @Date 2019/6/2 15:53
 * @Version 1.0
 */
public class CartItemDaoTest extends com.clxk.base.test.BaseJunit4Test {

    @Resource
    private UserDao userDao;
    @Resource
    private ProductDao productDao;
    @Resource
    private CartItemDao cartItemDao;

    @Test
    public void testInsert() {
        User user = userDao.findByUname("admin");
        Product product = productDao.findByCategory("1").get(0);
        int result = cartItemDao.insert(new CartItem(Utils.uuid(),user.getUid(),product, 3));
        System.out.println(result);
    }

    @Test
    public void testFindByUid() {
        User user = userDao.findByUname("admin");
        List<CartItem> cartItemList = cartItemDao.findByUid(user.getUid());
    }
}
