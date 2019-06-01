package com.clxk.electro.service;

import com.clxk.electro.model.ProductDetails;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description ProductDetails服务层接口
 * @Author Clxk
 * @Date 2019/5/31 20:41
 * @Version 1.0
 */
public interface ProductDetailsService {

    int insert(ProductDetails productDetails);

    int delete(ProductDetails productDetails);

    int update(ProductDetails productDetails);

    List<ProductDetails> findAll();

    ProductDetails findByPdid(String pdid);
}
