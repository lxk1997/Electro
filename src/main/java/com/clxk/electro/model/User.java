package com.clxk.electro.model;

import java.io.Serializable;

/**
 * @Description 用户实体类
 * @Author Clxk
 * @Date 2019/3/31 17:45
 * @Version 1.0
 */
public class User implements Serializable {

    private String uid;
    private String uname;
    private String password;
    private String email;
    private String phone;

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public User() {
    }

    public User(String uid, String uname, String password) {
        this.uid = uid;
        this.uname = uname;
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid='" + uid + '\'' +
                ", uname='" + uname + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
