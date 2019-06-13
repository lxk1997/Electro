package com.clxk.electro.dao;

import com.clxk.electro.model.ProductReviews;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Description 评论模块数据层
 * @Author Clxk
 * @Date 2019/6/13 21:40
 * @Version 1.0
 */
@Repository
public interface ProductReviewsDao {

    int insert(ProductReviews reviews);

    int delete(ProductReviews reviews);

    List<ProductReviews> findByPid(String pid);
}
