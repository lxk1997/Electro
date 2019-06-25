package com.clxk.electro.dao.cache;

import com.clxk.electro.model.Product;
import com.dyuproject.protostuff.LinkedBuffer;
import com.dyuproject.protostuff.ProtostuffIOUtil;
import com.dyuproject.protostuff.runtime.RuntimeSchema;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.List;

/**
 * @Description Product Redis数据访问对象
 * @Author Clxk
 * @Date 2019/6/24 11:17
 * @Version 1.0
 */
public class ProductRedisDao {

    private final JedisPool jedisPool;
    public ProductRedisDao(String ip, int port) {
        jedisPool = new JedisPool(ip, port);
    }

    private RuntimeSchema<Product> schema = RuntimeSchema.createFrom(Product.class);
    public Product getProduct(String pid) {

        try {
            Jedis jedis = jedisPool.getResource();
            try {
                String key = "product:" + pid;
                byte[] bytes = jedis.get(key.getBytes());
                if(bytes != null) {
                    Product product = schema.newMessage();
                    ProtostuffIOUtil.mergeFrom(bytes, product, schema);
                    return product;
                }
            }finally {
                jedis.close();
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public String putProduct(Product product) {
        try {
            Jedis jedis = jedisPool.getResource();
            try{
                String key = "product:" + product.getPid();
                byte[] bytes = ProtostuffIOUtil.toByteArray(product, schema,
                        LinkedBuffer.allocate(LinkedBuffer.DEFAULT_BUFFER_SIZE));
                int timeout = 60 * 60;
                String result = jedis.setex(key.getBytes(), timeout, bytes);
                return result;
            } finally {
                jedis.close();
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Product> getProductList(String key) {
        try {
            Jedis jedis = jedisPool.getResource();
            try {
                byte[] bytes = jedis.get(key.getBytes());
                List<Product> products = ProtostuffIOUtil.parseListFrom(new ByteArrayInputStream(bytes), schema);
                return products;
            }finally {
                jedis.close();
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public String putProductList(List<Product> products, String key) {
        try {
            Jedis jedis = jedisPool.getResource();
            ByteArrayOutputStream os = new ByteArrayOutputStream();
            try {
                ProtostuffIOUtil.writeListTo(os, products,schema, LinkedBuffer.allocate(LinkedBuffer.DEFAULT_BUFFER_SIZE));
                int timeout = 60 * 60;
                String result = jedis.setex(key.getBytes(), timeout, os.toByteArray());
                return result;
            }finally {
                os.close();
                jedis.close();
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
