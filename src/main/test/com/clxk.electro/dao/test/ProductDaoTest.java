package com.clxk.electro.dao.test;

import com.clxk.base.test.BaseJunit4Test;
import com.clxk.electro.common.Utils;
import com.clxk.electro.dao.ProductDao;
import com.clxk.electro.model.Product;
import com.clxk.electro.model.ProductDetails;
import org.junit.Test;

import javax.annotation.Resource;
import java.io.*;
import java.util.Date;
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
    @Resource
    private ProductDetailsDao productDetailsDao;

    @Test
    public void testInsert() {
        String uuid = Utils.uuid();
        String url = "D:\\Electro\\src\\main\\webapp\\WEB-INF\\imgs\\a.jpg";
        File file = new File(url);
        System.out.println(file.exists());
        Product product = new Product(uuid,
                "【新品上市】索尼（SONY）Xperia 1 骁龙855 三摄手机 6GB+128GB 6.5英寸屏 夜黑",
                "2",6299.00,4789.60,0.83, 12000000, new Date());
        ProductDetails productDetails = new ProductDetails(uuid,url,url,url,url,
                "新品上市】索尼（SONY）Xperia 1 骁龙855 三摄手机 6GB+128GB 6.5英寸屏 夜黑",
                "新品上市】索尼（SONY）Xperia 1 骁龙855 三摄手机 6GB+128GB 6.5英寸屏 夜黑",
                "0,0,0,0,0");
        productDao.insert(product);
        productDetailsDao.insert(productDetails);

    }

    @Test
    public void testDelete() {

    }

    @Test
    public void testUpdate() {

    }

    @Test
    public void testFindAll() {
        List<Product> products = productDao.findAll();
        for(Product p : products) {
            System.out.println(p.getProductDetails().getAvatar1());
        }
    }

    @Test
    public void testFindById() {

    }
}
