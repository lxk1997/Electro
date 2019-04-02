package com.clxk.model;

import java.io.Serializable;

/**
 * @Description 商品实体类
 * @Author Clxk
 * @Date 2019/4/1 22:32
 * @Version 1.0
 */
public class Product implements Serializable {

    private int id;
    private String pname;
    private int ptype;
    private String pdetails;
    private String pdescription;
    private double purprice;
    private double sellprice;
    private double priceoff;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public int getPtype() {
        return ptype;
    }

    public void setPtype(int ptype) {
        this.ptype = ptype;
    }

    public String getPdetails() {
        return pdetails;
    }

    public void setPdetails(String pdetails) {
        this.pdetails = pdetails;
    }

    public String getPdescription() {
        return pdescription;
    }

    public void setPdescription(String pdescription) {
        this.pdescription = pdescription;
    }

    public double getPriceoff() {
        return priceoff;
    }

    public void setPriceoff(double priceoff) {
        this.priceoff = priceoff;
    }

    public double getPurprice() {
        return purprice;
    }

    public void setPurprice(double purprice) {
        this.purprice = purprice;
    }

    public double getSellprice() {
        return sellprice;
    }

    public void setSellprice(double sellprice) {
        this.sellprice = sellprice;
    }

    public Product() {

    }

    public Product(String pname, int ptype, double purprice, double sellprice) {
        this.pname = pname;
        this.ptype = ptype;
        this.purprice = purprice;
        this.sellprice = sellprice;
    }
}
