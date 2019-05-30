package com.clxk.electro.dao.test;

import com.clxk.base.test.BaseJunit4Test;
import com.clxk.electro.dao.UserDao;
import com.clxk.electro.model.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description 用户dao层测试
 * @Author Clxk
 * @Date 2019/3/31 20:27
 * @Version 1.0
 */
public class UserDaoTest extends BaseJunit4Test {

    @Resource
    private UserDao userDao;

    @Test
    public void testInsert() {

    }

    @Test
    public void testUpdate() {

    }

    @Test
    public void testFindAll() {
        PageHelper.startPage(1,3);
        List<User> users = userDao.findAll();
        PageInfo pageInfo = new PageInfo(users);
        System.out.println(pageInfo);
    }

    @Test
    public void testFindByUsername() {
    }
}

