package com.clxk.service.impl;

import com.clxk.dao.ManagerDao;
import com.clxk.model.Manager;
import com.clxk.service.ManagerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description 管理员服务层实现
 * @Author Clxk
 * @Date 2019/4/2 15:40
 * @Version 1.0
 */
@Service
public class ManagerServiceImpl implements ManagerService {

    @Resource
    private ManagerDao managerDao;

    @Override
    public int insert(Manager manager) {
        return managerDao.insert(manager);
    }

    @Override
    public int update(Manager manager) {
        return managerDao.update(manager);
    }

    @Override
    public int delete(Manager manager) {
        return managerDao.delete(manager);
    }

    @Override
    public List<Manager> findAll() {
        return managerDao.findAll();
    }

    @Override
    public List<Manager> findByLevel(int level) {
        return managerDao.findByLevel(level);
    }

    @Override
    public Manager findByUsername(String username) {
        return managerDao.findByUsername(username);
    }
}
