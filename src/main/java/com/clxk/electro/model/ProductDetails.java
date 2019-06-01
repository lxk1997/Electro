package com.clxk.electro.model;

/**
 * @Description 商品详情类
 * @Author Clxk
 * @Date 2019/5/31 0:14
 * @Version 1.0
 */
public class ProductDetails {
    private String pdid;
    private String avatar1;
    private String avatar2;
    private String avatar3;
    private String avatar4;
    private String description;
    private String details;
    private String rating;

    public String getPdid() {
        return pdid;
    }

    public void setPdid(String pdid) {
        this.pdid = pdid;
    }

    public String getAvatar1() {
        return avatar1;
    }

    public void setAvatar1(String avatar1) {
        this.avatar1 = avatar1;
    }

    public String getAvatar2() {
        return avatar2;
    }

    public void setAvatar2(String avatar2) {
        this.avatar2 = avatar2;
    }

    public String getAvatar3() {
        return avatar3;
    }

    public ProductDetails(String pdid, String avatar1, String avatar2, String avatar3, String avatar4, String description, String details, String rating) {
        this.pdid = pdid;
        this.avatar1 = avatar1;
        this.avatar2 = avatar2;
        this.avatar3 = avatar3;
        this.avatar4 = avatar4;
        this.description = description;
        this.details = details;
        this.rating = rating;
    }

    public ProductDetails() {
    }

    public void setAvatar3(String avatar3) {
        this.avatar3 = avatar3;
    }

    public String getAvatar4() {
        return avatar4;
    }

    public void setAvatar4(String avatar4) {
        this.avatar4 = avatar4;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    @Override
    public String toString() {
        return "ProductDetails{" +
                "pdid='" + pdid + '\'' +
                ", avatar1='" + avatar1 + '\'' +
                ", avatar2='" + avatar2 + '\'' +
                ", avatar3='" + avatar3 + '\'' +
                ", avatar4='" + avatar4 + '\'' +
                ", description='" + description + '\'' +
                ", details='" + details + '\'' +
                ", rating='" + rating + '\'' +
                '}';
    }
}
