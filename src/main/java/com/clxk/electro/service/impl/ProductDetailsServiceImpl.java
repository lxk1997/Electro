package com.clxk.electro.service.impl;

import com.clxk.electro.dao.ProductDetailsDao;
import com.clxk.electro.model.ProductDetails;
import com.clxk.electro.service.ProductDetailsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description ProductDetails服务层实现
 * @Author Clxk
 * @Date 2019/5/31 20:41
 * @Version 1.0
 */
@Service
public class ProductDetailsServiceImpl implements ProductDetailsService {

    @Resource
    private ProductDetailsDao productDetailsDao;
    @Override
    public int insert(ProductDetails productDetails) {
        return productDetailsDao.insert(productDetails);
    }

    @Override
    public int delete(ProductDetails productDetails) {
        return productDetailsDao.delete(productDetails);
    }

    @Override
    public int update(ProductDetails productDetails) {
        return productDetailsDao.update(productDetails);
    }

    @Override
    public List<ProductDetails> findAll() {
        return productDetailsDao.findAll();
    }

    @Override
    public ProductDetails findByPdid(String pdid) {
        return productDetailsDao.findByPdid(pdid);
    }
}
