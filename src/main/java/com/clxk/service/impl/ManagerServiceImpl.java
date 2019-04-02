package com.clxk.service.impl;

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
    private ManagerService managerService;

    @Override
    public int insert(Manager manager) {
        return managerService.insert(manager);
    }

    @Override
    public int update(Manager manager) {
        return managerService.update(manager);
    }

    @Override
    public int delete(Manager manager) {
        return managerService.delete(manager);
    }

    @Override
    public List<Manager> findAll() {
        return managerService.findAll();
    }

    @Override
    public List<Manager> findByLevel(int level) {
        return managerService.findByLevel(level);
    }

    @Override
    public Manager findByUsername(String username) {
        return null;
    }
}
