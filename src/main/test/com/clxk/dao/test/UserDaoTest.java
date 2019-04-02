package com.clxk.dao.test;

import com.clxk.base.test.BaseJunit4Test;
import com.clxk.dao.UserDao;
import com.clxk.model.User;
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
        User user = new User("admin","123");
        user.setPhonenum("123");
        user.setAge(13);
        user.setAvatar("123");
        user.setEmail("123");
        user.setNick("123");
        int count = userDao.insert(user);
        System.out.println(count);
    }

    @Test
    public void testUpdate() {
        User user = new User("admin","qqqq");
        int count = userDao.update(user);
        System.out.println(count);
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
        User user = userDao.findByUsername("admin");
        System.out.println(user);
    }
}

