package com.clxk.electro.service.impl;

import com.clxk.electro.dao.CategoryDao;
import com.clxk.electro.dao.ProductDao;
import com.clxk.electro.model.Product;
import com.clxk.electro.service.ProductService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
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
    @Resource
    private CategoryDao categoryDao;

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
    public int deleteByPid(String pid) {
        return productDao.deleteByPid(pid);
    }

    @Override
    public List<Product> findAll() {
        return productDao.findAll();
    }

    @Override
    public List<Product> findHotDealProduct() {
        return productDao.findHotDealProduct();
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
    public List<Product> findByDateOrderAndCategory(String categoryId) {
        return productDao.findByDateOrderAndCategory(categoryId);
    }

    @Override
    public List<Product> toStore(String categoryId) {
        if(categoryId == null || categoryId.equals("0")) {
            return productDao.findAll();
        } else if(categoryId.equals("-1")) {
            return productDao.findHotDealProduct();
        }
        else {
           return productDao.findByDateOrderAndCategory(categoryId);
        }
    }

    @Override
    public String showCategory(List<Product> products, String categoryId) {
        if(categoryId == null || categoryId.equals("0")) {
            return "Categories（" + products.size() + "RESULTS)";
        } else if(categoryId.equals("-1")) {
            return "Hot deals (" + products.size() + "RESULTS)";
        }
        else {
            return categoryDao.findByCid(categoryId).getCname() + "(" + products.size() + "RESULTS)";
        }
    }

    @Override
    public List<Product> searchProduct(String name, String categoryId) {
        List<Product> ansList = new ArrayList<>();
        if(categoryId == null || categoryId.equals("0")) {
            List<Product> productList = productDao.findAll();
            for(Product product : productList) {
                if(product.getPname().toLowerCase().contains(name.toLowerCase())) {
                    ansList.add(product);
                }
            }
        }
        else {
            List<Product> productList = productDao.findByDateOrderAndCategory(categoryId);
            for(Product product : productList) {
                if(product.getPname().toLowerCase().contains(name.toLowerCase())) {
                    ansList.add(product);
                }
            }
        }
        return ansList;
    }


}
