package com.clxk.electro.dao;

import com.clxk.electro.model.Category;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Description category dao层
 * @Author Clxk
 * @Date 2019/5/30 22:12
 * @Version 1.0
 */
@Repository
public interface CategoryDao {

    int insert(Category category);

    int delete(Category category);

    int update(Category category);

    List<Category> findAll();

    Category findByCid(String cid);
}
