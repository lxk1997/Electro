package com.clxk.electro.model;

/**
 * @Description 购物车单个条目
 * @Author Clxk
 * @Date 2019/6/2 11:19
 * @Version 1.0
 */
public class CartItem {

    private String ciid;
    private String uid;
    private Product product;
    private int count;

    public String getCiid() {
        return ciid;
    }

    public void setCiid(String ciid) {
        this.ciid = ciid;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public CartItem() {
    }

    public CartItem(String ciid, String uid, Product product, int count) {
        this.ciid = ciid;
        this.uid = uid;
        this.product = product;
        this.count = count;
    }
}
