package com.clxk.electro.dao;

import com.clxk.electro.model.Department;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Description department dao层
 * @Author Clxk
 * @Date 2019/5/30 22:12
 * @Version 1.0
 */
@Repository
public interface DepartmentDao {

    int insert(Department department);

    int delete(Department department);

    int update(Department department);

    List<Department> findAll();

    Department findByDid(String did);
}
