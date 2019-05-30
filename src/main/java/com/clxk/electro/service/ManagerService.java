package com.clxk.electro.service;

import com.clxk.electro.model.Manager;

import java.util.List;

/**
 * @Description Manager 服务层接口
 * @Author Clxk
 * @Date 2019/5/30 23:32
 * @Version 1.0
 */
public interface ManagerService {

    int insert(Manager manager);

    int update(Manager manager);

    List<Manager> findAll();

    Manager findByMname(String mname);

    Manager findByMid(String mid);
}
