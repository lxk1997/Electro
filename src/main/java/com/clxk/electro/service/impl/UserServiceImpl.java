package com.clxk.electro.service.impl;

import com.clxk.electro.common.Utils;
import com.clxk.electro.dao.UserDao;
import com.clxk.electro.model.OrderItem;
import com.clxk.electro.model.User;
import com.clxk.electro.service.UserService;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description User服务层实现类
 * @Author Clxk
 * @Date 2019/3/31 18:48
 * @Version 1.0
 */
@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;


    @Override
    public int insert(User user) {
        return userDao.insert(user);
    }

    @Override
    public int update(User user) {
        return userDao.update(user);
    }

    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Override
    public User findByUname(String uname) {
        return userDao.findByUname(uname);
    }

    @Override
    public User findByUid(String uid) {
        return userDao.findByUid(uid);
    }

    @Override
    public User restoryPassword(User user, String oldP, String newP) {
        if(!user.getPassword().equals(oldP)) {
            return null;
        } else {
            user.setPassword(Utils.escapeXml(newP));
            userDao.update(user);
            return user;
        }
    }

    @Override
    public String login(String uname, String password, String code, String vcode) {
        if(uname == null || uname.trim().isEmpty()) return "Null Username!";
        if(password == null || password.trim().isEmpty()) return "Null Password!";
        if(code == null || code.trim().isEmpty()) return "Null VerifyCode!";
        User u = userDao.findByUname(uname);
        if(!code.toLowerCase().equals(vcode.toLowerCase())) {
            return "VerifyCode Error!";
        } else if(u == null) {
            return "Not Exist Username!";
        } else if(!u.getPassword().equals(password)) {
            return "Password Error!";
        } else {
            return "SUCCESS";
        }
    }

    @Override
    public String registe(User user, String confirmpass, String code, String vcode) {
        if(user.getUname() == null || user.getUname().trim().isEmpty()) return "Null Username!";
        if(user.getPassword() == null || user.getPassword().trim().isEmpty()) return "Null Password!";
        if(confirmpass == null || confirmpass.trim().isEmpty()) return "Null Confirm Password!";
        if(code == null || code.trim().isEmpty()) return "Null VerifyCode!";
        if(!code.toLowerCase().equals(vcode.toLowerCase())) {
            return "VerifyCode Error!";
        } else if(!confirmpass.equals(user.getPassword())) {
            return "Inconsistent Password!";
        } else if(user.getEmail() != null && !Utils.matchEmail(user.getEmail())) {
            return "Email Format Error!";
        } else if(userDao.findByUname(user.getUname()) != null) {
            return "User Name Already Exists!";
        } else {
            if(user.getUname() != null && !user.getUname().trim().isEmpty())user.setUname(Utils.escapeXml(user.getUname()));
            if(user.getPassword() != null && !user.getPassword().trim().isEmpty())user.setPassword(Utils.escapeXml(user.getPassword()));
            if(user.getEmail() != null && !user.getEmail().trim().isEmpty())user.setEmail(Utils.escapeXml(user.getEmail()));
            if(user.getPhone() != null && !user.getPhone().trim().isEmpty())user.setPhone(Utils.escapeXml(user.getPhone()));
            user.setUid(Utils.uuid());
            userDao.insert(user);
            return "SUCCESS";
        }
    }

    @Override
    public String loadDataToGrad() throws JSONException {
        List<User> users = userDao.findAll();
        JSONArray data = new JSONArray();
        for(User u : users) {
            JSONObject user = new JSONObject();
            user.put("User Id", u.getUid());
            user.put("User Name", u.getUname());
            user.put("Password", u.getPassword());
            user.put("Email",u.getEmail());
            user.put("Telphone", u.getPhone());
            data.put(user);
        }
        return data.toString();
    }

    @Override
    public String updateAccount(User user, String email, String phone) {
        if(!Utils.matchEmail(email)) {
            return "Error Email!!!";
        }
        user.setEmail(email);
        user.setPhone(phone);
        userDao.update(user);
        return "SUCCESS";
    }
}
