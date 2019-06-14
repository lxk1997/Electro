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
    public List<Category> findAll() {
        return categoryDao.findAll();
    }

}
