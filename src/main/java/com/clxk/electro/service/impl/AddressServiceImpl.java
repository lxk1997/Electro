package com.clxk.electro.service.impl;

import com.clxk.electro.dao.AddressDao;
import com.clxk.electro.model.Address;
import com.clxk.electro.service.AddressService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Override
    public String getAddressByUid(String uid) {
        List<Address> addresses = addressDao.findByUid(uid);
        Map<String, Object> ans = new HashMap<>();
        ans.put("code", 0);
        ans.put("msg", "");
        ans.put("count", addresses == null ? 0 : addresses.size());
        ans.put("data", addresses);
        return ans.toString();
    }
}
