package com.clxk.electro.service.impl;

import com.clxk.electro.common.Utils;
import com.clxk.electro.dao.ProductReviewsDao;
import com.clxk.electro.model.ProductReviews;
import com.clxk.electro.service.ProductReviewsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * @Description 评价模块业务层实现
 * @Author Clxk
 * @Date 2019/6/13 23:34
 * @Version 1.0
 */
@Service
public class ProductReviewsServiceImpl implements ProductReviewsService {

    @Resource
    private ProductReviewsDao productReviewsDao;

    @Override
    public List<ProductReviews> getReviews(String pid) {
        return productReviewsDao.findByPid(pid);
    }

    @Override
    public int getStarCnt(int cnt, String pid) {
        List<ProductReviews> reviews = productReviewsDao.findByPid(pid);
        int count = 0;
        for(ProductReviews review : reviews) {
            if(review.getRating() / 20 == cnt) count++;
        }
        return cnt;
    }

    @Override
    public void addReview(ProductReviews reviews, String uid, String pid) {
        ProductReviews review = new ProductReviews(Utils.uuid(), pid, uid, Utils.escapeXml(reviews.getName()), Utils.escapeXml(reviews.getEmail()), new Date(), reviews.getRating(), Utils.escapeXml(reviews.getContext()));
        System.out.println(review);
        productReviewsDao.insert(review);
    }
}
