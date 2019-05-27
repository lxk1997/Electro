package com.clxk.electro.service;

import com.clxk.electro.model.Product;

import java.util.List;

/**
 * @Description 商品服务层接口
 * @Author Clxk
 * @Date 2019/4/1 22:53
 * @Version 1.0
 */
public interface ProductService {

    int insert(Product product);

    int delete(Product product);

    int update(Product product);

    List<Product> findAll();

    Product findById(int id);
}
