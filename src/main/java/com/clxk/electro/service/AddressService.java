package com.clxk.electro.service;

import com.clxk.electro.model.Address;

import java.util.List;

/**
 * @Description 地址服务层接口
 * @Author Clxk
 * @Date 2019/6/2 23:13
 * @Version 1.0
 */
public interface AddressService {

    int insert(Address address);

    int delete(Address address);

    int update(Address address);

    Address findByAid(String aid);

    List<Address> findByUid(String uid);

    String getAddressByUid(String uid);
}
