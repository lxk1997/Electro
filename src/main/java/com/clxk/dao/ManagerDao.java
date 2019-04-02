package com.clxk.dao;

import com.clxk.model.Manager;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Description 管理员dao层
 * @Author Clxk
 * @Date 2019/4/2 15:37
 * @Version 1.0
 */
@Repository
public interface ManagerDao {

    int insert(Manager manager);

    int update(Manager manager);

    int delete(Manager manager);

    List<Manager> findAll();

    List<Manager> findByLevel(int level);

    Manager findByUsername(String username);
}
