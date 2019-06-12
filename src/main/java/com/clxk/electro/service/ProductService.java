package com.clxk.electro.service;

import com.clxk.electro.model.Product;

import java.util.List;

/**
 * @Description Productservice层
 * @Author Clxk
 * @Date 2019/5/30 21:09
 * @Version 1.0
 */
public interface ProductService {
    int insert(Product product);

    int delete(Product product);

    int update(Product product);

    int deleteByPid(String pid);

    List<Product> findAll();

    List<Product> findHotDealProduct();

    List<Product> findByCategory(String catogoryId);

    Product findByPid(String pid);

    List<Product> findByDateOrderAndCategory(String category);

    List<Product> toStore(String categoryId);

    String showCategory(List<Product> products, String categoryId);

    List<Product> searchProduct(String name, String categoryId);
}
