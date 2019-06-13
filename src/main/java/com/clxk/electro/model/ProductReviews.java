package com.clxk.electro.model;

import java.util.Date;

/**
 * @Description 评价实体类
 * @Author Clxk
 * @Date 2019/6/13 21:36
 * @Version 1.0
 */
public class ProductReviews {
    private String prid;
    private String pid;
    private String uid;
    private String name;
    private String email;
    private Date date;
    private int rating;
    private String context;

    @Override
    public String toString() {
        return "ProductReviews{" +
                "prid='" + prid + '\'' +
                ", pid='" + pid + '\'' +
                ", uid='" + uid + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", date=" + date +
                ", rating=" + rating +
                ", content='" + context + '\'' +
                '}';
    }

    public String getPrid() {
        return prid;
    }

    public void setPrid(String prid) {
        this.prid = prid;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public ProductReviews(String prid, String pid, String uid, String name, String email, Date date, int rating, String context) {
        this.prid = prid;
        this.pid = pid;
        this.uid = uid;
        this.name = name;
        this.email = email;
        this.date = date;
        this.rating = rating;
        this.context = context;
    }

    public ProductReviews() {
    }
}
