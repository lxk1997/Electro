package com.clxk.service;

import com.clxk.model.User;

import java.util.List;

/**
 * @Description User服务层接口
 * @Author Clxk
 * @Date 2019/3/31 18:45
 * @Version 1.0
 */
public interface UserService {

    int insert(User user);

    int update(User user);

    List<User> findAll();

    User findByUsername(String username);
}
