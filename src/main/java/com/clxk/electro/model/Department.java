package com.clxk.electro.model;

import org.springframework.stereotype.Repository;

/**
 * @Description 部门实体类
 * @Author Clxk
 * @Date 2019/5/30 22:11
 * @Version 1.0
 */
@Repository
public class Department {

    private String did;
    private String dname;

    public String getDid() {
        return did;
    }

    public void setDid(String did) {
        this.did = did;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public Department() {
    }

    public Department(String did, String dname) {
        this.did = did;
        this.dname = dname;
    }

    @Override
    public String toString() {
        return "Department{" +
                "did='" + did + '\'' +
                ", dname='" + dname + '\'' +
                '}';
    }
}
