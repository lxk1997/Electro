package com.clxk.electro.service;

import com.clxk.electro.model.Category;

import java.util.List;

/**
 * @Description Categort service接口层
 * @Author Clxk
 * @Date 2019/5/30 22:16
 * @Version 1.0
 */
public interface CategoryService {

    int insert(Category category);

    int delete(Category category);

    int update(Category category);

    List<Category> findAll();

    Category findByCid(String cid);
}
