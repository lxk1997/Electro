package com.clxk.electro.model;

/**
 * @Description 管理员实体类
 * @Author Clxk
 * @Date 2019/5/30 23:26
 * @Version 1.0
 */
public class Manager {

    private String mid;
    private String mname;
    private String password;
    private String departmentId;
    private String firstname;
    private String lastname;
    private String phone;
    private String email;
    private String avatar;

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Manager() {
    }

    public Manager(String mid, String mname, String password, String departmentId, String firstname, String lastname, String phone, String email, String avatar) {
        this.mid = mid;
        this.mname = mname;
        this.password = password;
        this.departmentId = departmentId;
        this.firstname = firstname;
        this.lastname = lastname;
        this.phone = phone;
        this.email = email;
        this.avatar = avatar;
    }
}
