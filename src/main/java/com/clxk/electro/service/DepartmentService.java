package com.clxk.electro.service;

import com.clxk.electro.model.Department;

import java.util.List;

/**
 * @Description Department service接口层
 * @Author Clxk
 * @Date 2019/5/30 22:16
 * @Version 1.0
 */
public interface DepartmentService {

    List<Department> findAll();

}
