package com.clxk.electro.model;

/**
 * @Description 地址实体类
 * @Author Clxk
 * @Date 2019/6/2 22:58
 * @Version 1.0
 */
public class Address {

    private String aid;
    private String uid;
    private String firstname;
    private String lastname;
    private String email;
    private String address;
    private String city;
    private String country;
    private String zipcode;
    private String telphone;

    @Override
    public String toString() {
        return "Address{" +
                "aid='" + aid + '\'' +
                ", uid='" + uid + '\'' +
                ", firstname='" + firstname + '\'' +
                ", lastname='" + lastname + '\'' +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                ", city='" + city + '\'' +
                ", country='" + country + '\'' +
                ", zipcode='" + zipcode + '\'' +
                ", telphone='" + telphone + '\'' +
                '}';
    }

    public Address(String aid, String uid, String firstname, String lastname, String email, String address, String city, String country, String zipcode, String telphone) {
        this.aid = aid;
        this.uid = uid;
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.address = address;
        this.city = city;
        this.country = country;
        this.zipcode = zipcode;
        this.telphone = telphone;
    }

    public Address() {
    }

    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone;
    }
}
