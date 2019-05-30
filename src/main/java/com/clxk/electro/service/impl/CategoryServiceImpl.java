package com.clxk.electro.service.impl;

import com.clxk.electro.dao.CategoryDao;
import com.clxk.electro.model.Category;
import com.clxk.electro.service.CategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description Category接口实现层
 * @Author Clxk
 * @Date 2019/5/30 22:17
 * @Version 1.0
 */
@Service
public class CategoryServiceImpl implements CategoryService {

    @Resource
    private CategoryDao categoryDao;

    @Override
    public int insert(Category category) {
        return categoryDao.insert(category);
    }

    @Override
    public int delete(Category category) {
        return categoryDao.delete(category);
    }

    @Override
    public int update(Category category) {
        return categoryDao.update(category);
    }

    @Override
    public List<Category> findAll() {
        return categoryDao.findAll();
    }

    @Override
    public Category findByCid(String cid) {
        return categoryDao.findByCid(cid);
    }
}
