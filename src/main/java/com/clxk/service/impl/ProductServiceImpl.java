package com.clxk.service.impl;

import com.clxk.model.Product;
import com.clxk.service.ProductService;
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
    private ProductService productService;

    @Override
    public int insert(Product product) {
        return productService.insert(product);
    }

    @Override
    public int delete(Product product) {
        return productService.delete(product);
    }

    @Override
    public int update(Product product) {
        return productService.update(product);
    }

    @Override
    public List<Product> findAll() {
        return productService.findAll();
    }

    @Override
    public Product findById(int id) {
        return productService.findById(id);
    }
}
