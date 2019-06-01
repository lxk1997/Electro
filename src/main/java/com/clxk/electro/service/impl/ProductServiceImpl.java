package com.clxk.electro.service.impl;

import com.clxk.electro.dao.ProductDao;
import com.clxk.electro.model.Product;
import com.clxk.electro.service.ProductService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description ProductService实现层
 * @Author Clxk
 * @Date 2019/5/30 21:10
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
    public List<Product> findByCategory(String catogoryId) {
        return productDao.findByCategory(catogoryId);
    }

    @Override
    public Product findByPid(String pid) {
        return productDao.findByPid(pid);
    }

    @Override
    public List<Product> findByDateOrderAndCategory(String category) {
        return productDao.findByDateOrderAndCategory(category);
    }


}
