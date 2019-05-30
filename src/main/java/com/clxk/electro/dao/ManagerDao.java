package com.clxk.electro.dao;

import com.clxk.electro.model.Manager;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Description Manager持久层
 * @Author Clxk
 * @Date 2019/5/30 23:31
 * @Version 1.0
 */
@Repository
public interface ManagerDao {

    int insert(Manager manager);

    int update(Manager manager);

    List<Manager> findAll();

    Manager findByMname(String mname);

    Manager findByMid(String mid);
}
