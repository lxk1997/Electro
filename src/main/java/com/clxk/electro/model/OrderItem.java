package com.clxk.electro.model;

import java.util.Date;

/**
 * @Description 订单条目实体类
 * @Author Clxk
 * @Date 2019/6/2 20:40
 * @Version 1.0
 */
public class OrderItem {

    public static final int UN_PAID = 1;
    public static final int NO_SHIPPED = 2;
    public static final int SHIPPED = 3;
    public static final int UN_CONFIRMED = 4;

    private String oiid;
    private String uid;
    private Product product;
    private int count;
    private Date date;
    private int status;
    private String notes;
    private Address address;

    public String getOiid() {
        return oiid;
    }

    public void setOiid(String oiid) {
        this.oiid = oiid;
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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public OrderItem() {
    }

    public OrderItem(String oiid, String uid, Product product, int count,Address address, Date date, int status) {
        this.oiid = oiid;
        this.uid = uid;
        this.product = product;
        this.count = count;
        this.date = date;
        this.status = status;
        this.address = address;
    }

    @Override
    public String toString() {
        return "OrderItem{" +
                "oiid='" + oiid + '\'' +
                ", uid='" + uid + '\'' +
                ", product=" + product +
                ", count=" + count +
                ", date=" + date +
                ", status=" + status +
                '}';
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }
}
