package com.clxk.dao.test;

import com.clxk.base.test.BaseJunit4Test;
import com.clxk.dao.ManagerDao;
import com.clxk.model.Manager;
import org.junit.Test;
import sun.nio.cs.ext.MacArabic;

import javax.annotation.Resource;

/**
 * @Description TODO
 * @Author Clxk
 * @Date 2019/4/2 16:33
 * @Version 1.0
 */
public class ManagerDaoTest extends BaseJunit4Test {

    @Resource
    private ManagerDao managerDao;

    @Test
    public void testInsert() {
        Manager manager = new Manager("admin","123",1);
        int count = managerDao.insert(manager);
        System.out.println(count);
    }

    @Test
    public void testDelete() {
        Manager manager = new Manager("admin","123",1);
        manager.setId(1);
        int count = managerDao.delete(manager);
        System.out.println(count);
    }

}
