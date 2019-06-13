package com.clxk.electro.controller;

import com.clxk.electro.model.ProductReviews;
import com.clxk.electro.model.User;
import com.clxk.electro.service.ProductReviewsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * @Description 评论模块控制层
 * @Author Clxk
 * @Date 2019/6/14 0:13
 * @Version 1.0
 */
@Controller
@RequestMapping("/productReviews")
public class ProductReviewsController {

    @Resource private ProductReviewsService productReviewsService;

    @RequestMapping("/addReviews.do")
    @ResponseBody
    public String addReviews(HttpSession session, ProductReviews reviews, String pid) {
        User user = (User) session.getAttribute("user");
        productReviewsService.addReview(reviews, user.getUid(), pid);
        return "SUCCESS";
    }
}
