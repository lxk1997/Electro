package com.clxk.electro.dao;

import com.clxk.electro.model.Product;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @Description Product持久层
 * @Author Clxk
 * @Date 2019/5/30 21:06
 * @Version 1.0
 */
@Repository
public interface ProductDao {

    int insert(Product product);

    int delete(Product product);

    int deleteByPid(String pid);

    int update(Product product);

    List<Product> findHotDealProduct();

    List<Product> findAll();

    List<Product> findByCategory(String categoryId);

    Product findByPid(String pid);

    List<Product> findByDateOrderAndCategory(String categoryId);

    int reduceStock(@Param("pid") String pid,@Param("count") int count);

    int executePlaceOrderProcedure(Map<String, Object> map);
}
