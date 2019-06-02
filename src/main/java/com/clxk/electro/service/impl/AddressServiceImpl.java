package com.clxk.electro.service.impl;

import com.clxk.electro.dao.AddressDao;
import com.clxk.electro.model.Address;
import com.clxk.electro.service.AddressService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description 地址服务层实现
 * @Author Clxk
 * @Date 2019/6/2 23:13
 * @Version 1.0
 */
@Service
public class AddressServiceImpl implements AddressService {

    @Resource
    private AddressDao addressDao;

    @Override
    public int insert(Address address) {
        return addressDao.insert(address);
    }

    @Override
    public int delete(Address address) {
        return addressDao.delete(address);
    }

    @Override
    public int update(Address address) {
        return addressDao.update(address);
    }

    @Override
    public Address findByAid(String aid) {
        return addressDao.findByAid(aid);
    }

    @Override
    public List<Address> findByUid(String uid) {
        return addressDao.findByUid(uid);
    }
}
