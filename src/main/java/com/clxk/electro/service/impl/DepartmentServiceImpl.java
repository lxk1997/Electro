package com.clxk.electro.service.impl;

import com.clxk.electro.dao.DepartmentDao;
import com.clxk.electro.model.Department;
import com.clxk.electro.service.DepartmentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description Department接口实现层
 * @Author Clxk
 * @Date 2019/5/30 22:17
 * @Version 1.0
 */
@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Resource
    private DepartmentDao departmentDao;

    @Override
    public List<Department> findAll() {
        return departmentDao.findAll();
    }

}
