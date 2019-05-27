package com.clxk.electro.service.impl;

import com.clxk.electro.dao.ProductDao;
import com.clxk.electro.service.ProductService;
import com.clxk.electro.model.Product;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description 商品服务层实现
 * @Author Clxk
 * @Date 2019/4/1 22:54
 * @Version 1.0
 */
@Service
public class ProductServiceImpl implements ProductService {

    @Resource
    private ProductDao productDao;

    @Override
    public int insert(Product product) {
        return productDao.insert(product);
    }

    @Override
    public int delete(Product product) {
        return productDao.delete(product);
    }

    @Override
    public int update(Product product) {
        return productDao.update(product);
    }

    @Override
    public List<Product> findAll() {
        return productDao.findAll();
    }

    @Override
    public Product findById(int id) {
        return productDao.findById(id);
    }
}
