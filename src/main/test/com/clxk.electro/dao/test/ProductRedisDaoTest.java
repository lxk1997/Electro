package com.clxk.electro.dao.test;

import com.clxk.electro.dao.ProductDao;
import com.clxk.electro.dao.cache.ProductRedisDao;
import com.clxk.electro.model.Product;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @Description TODO
 * @Author Clxk
 * @Date 2019/6/24 14:46
 * @Version 1.0
 */
public class ProductRedisDaoTest extends com.clxk.base.test.BaseJunit4Test {

    @Autowired
    private ProductRedisDao productRedisDao;

    @Autowired
    private ProductDao productDao;

    @Test
    public void test() {
        String pid = "01ebbeb6ed8341ff8354d60b6889686e";
        Product product = productRedisDao.getProduct(pid);
        if(product == null) {
            product = productDao.findByPid(pid);
            String result = productRedisDao.putProduct(product);
            System.out.println(result);
            product = productRedisDao.getProduct(pid);
            System.out.println(product);
        }
    }
}
