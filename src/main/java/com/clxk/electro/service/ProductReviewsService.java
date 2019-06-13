package com.clxk.electro.service;

import com.clxk.electro.model.ProductReviews;

import java.util.List;

/**
 * @Description 评论模块业务层
 * @Author Clxk
 * @Date 2019/6/13 23:22
 * @Version 1.0
 */
public interface ProductReviewsService {

    List<ProductReviews> getReviews(String pid);

    int getStarCnt(int cnt, String pid);

    void addReview(ProductReviews reviews, String uid, String pid);
}
