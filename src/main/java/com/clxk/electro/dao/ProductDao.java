package com.clxk.electro.dao;

import com.clxk.electro.model.Product;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Description 商品dao层
 * @Author Clxk
 * @Date 2019/4/1 22:43
 * @Version 1.0
 */
@Repository
public interface ProductDao {

    int insert(Product product);

    int delete(Product product);

    int update(Product product);

    List<Product> findAll();

    Product findById(int id);
}
