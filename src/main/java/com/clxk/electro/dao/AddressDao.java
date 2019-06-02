package com.clxk.electro.dao;

import com.clxk.electro.model.Address;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Description 地址持久层
 * @Author Clxk
 * @Date 2019/6/2 23:01
 * @Version 1.0
 */
@Repository
public interface AddressDao {

    int insert(Address address);

    int delete(Address address);

    int update(Address address);

    Address findByAid(String aid);

    List<Address> findByUid(String uid);
}
