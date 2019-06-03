package com.clxk.electro.model;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @Description 商品实体类
 * @Author Clxk
 * @Date 2019/5/30 21:02
 * @Version 1.0
 */
public class Product {

    private String pid;
    private String pname;
    private String categoryId;
    private Double price;
    private Double firstcost;
    private Double discount;
    private int stock;
    private Date date;
    private ProductDetails productDetails;

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getFirstcost() {
        return firstcost;
    }

    public void setFirstcost(Double firstcost) {
        this.firstcost = firstcost;
    }

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Product() {
    }

    public Product(String pid, String pname, String categoryId, Double price, Double firstcost, Double discount, int stock, Date date) {
        this.pid = pid;
        this.pname = pname;
        this.categoryId = categoryId;
        this.price = price;
        this.firstcost = firstcost;
        this.discount = discount;
        this.stock = stock;
        this.date = date;
    }

    @Override
    public String toString() {
        return "Product{" +
                "pid='" + pid + '\'' +
                ", pname='" + pname + '\'' +
                ", categoryId='" + categoryId + '\'' +
                ", price=" + price +
                ", firstcost=" + firstcost +
                ", discount=" + discount +
                ", stock=" + stock +
                ", date=" + date +
                ", productDetails=" + productDetails +
                '}';
    }

    public ProductDetails getProductDetails() {
        return productDetails;
    }

    public void setProductDetails(ProductDetails productDetails) {
        this.productDetails = productDetails;
    }
}
