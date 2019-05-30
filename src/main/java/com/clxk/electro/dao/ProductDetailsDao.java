package com.clxk.electro.dao;

import com.clxk.electro.model.Product;
import com.clxk.electro.model.ProductDetails;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Description ProductDetails持久层
 * @Author Clxk
 * @Date 2019/5/30 21:06
 * @Version 1.0
 */
@Repository
public interface ProductDetailsDao {

    int insert(ProductDetails productDetails);

    int delete(ProductDetails productDetails);

    int update(ProductDetails productDetails);

    List<ProductDetails> findAll();

    ProductDetails findByPdid(String pdid);
}
