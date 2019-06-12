package com.clxk.electro.service;

import com.clxk.electro.model.User;
import org.json.JSONException;

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

    User findByUname(String uname);

    User findByUid(String uid);

    User restoryPassword(User user, String oldP, String newP);

    String login(String uname, String password, String code, String vcode);

    String registe(User user, String confirmpass, String code, String vcode);

    String loadDataToGrad() throws JSONException;

    String updateAccount(User user, String email, String phone);
}
