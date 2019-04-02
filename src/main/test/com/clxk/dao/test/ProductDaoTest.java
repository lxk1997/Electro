package com.clxk.dao.test;

import com.clxk.base.test.BaseJunit4Test;
import com.clxk.dao.ProductDao;
import com.clxk.model.Product;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description 商品dao层测试
 * @Author Clxk
 * @Date 2019/4/1 23:33
 * @Version 1.0
 */
public class ProductDaoTest extends BaseJunit4Test {

    @Resource
    private ProductDao productDao;

    @Test
    public void testInsert() {
        Product product = new Product("相机",1,25.2,15.6);
        int count = productDao.insert(product);
        System.out.println(count);
    }

    @Test
    public void testDelete() {
        Product product = new Product("相机",1,25.2,15.6);
        product.setId(1);
        int count = productDao.delete(product);
        System.out.println(count);
    }

    @Test
    public void testUpdate() {
        Product product = new Product("啦啦啦",1,12.4,512);
        product.setId(2);
        int count = productDao.update(product);
        System.out.println(count);
    }

    @Test
    public void testFindAll() {
        List<Product> products = productDao.findAll();
        System.out.println(products);
    }

    @Test
    public void testFindById() {
        Product product = productDao.findById(2);
        System.out.println(product);
    }
}
