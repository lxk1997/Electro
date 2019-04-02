package com.clxk.service;

import com.clxk.model.Manager;

import java.util.List;

/**
 * @Description 管理员服务层接口
 * @Author Clxk
 * @Date 2019/4/2 15:40
 * @Version 1.0
 */
public interface ManagerService {

    int insert(Manager manager);

    int update(Manager manager);

    int delete(Manager manager);

    List<Manager> findAll();

    List<Manager> findByLevel(int level);

    Manager findByUsername(String username);
}
