package com.clxk.electro.dao;

import com.clxk.electro.model.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Description 用户dao层
 * @Author Clxk
 * @Date 2019/3/31 18:30
 * @Version 1.0
 */
@Repository
public interface UserDao {

    int insert(User user);

    int update(User user);

    List<User> findAll();

    User findByUname(String uname);

    User findByUid(String uid);
}
