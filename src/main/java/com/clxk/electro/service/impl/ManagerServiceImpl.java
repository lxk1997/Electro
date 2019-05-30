package com.clxk.electro.service.impl;

import com.clxk.electro.dao.ManagerDao;
import com.clxk.electro.model.Manager;
import com.clxk.electro.service.ManagerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description Manager服务层实现
 * @Author Clxk
 * @Date 2019/5/30 23:33
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
    public List<Manager> findAll() {
        return managerDao.findAll();
    }

    @Override
    public Manager findByMname(String mname) {
        return managerDao.findByMname(mname);
    }

    @Override
    public Manager findByMid(String mid) {
        return managerDao.findByMid(mid);
    }
}
