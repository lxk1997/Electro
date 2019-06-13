package com.clxk.electro.service;

import com.clxk.electro.model.Product;
import org.json.JSONException;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * @Description Productservice层
 * @Author Clxk
 * @Date 2019/5/30 21:09
 * @Version 1.0
 */
public interface ProductService {
    int insert(Product product);

    int delete(Product product);

    int update(Product product);

    int deleteByPid(String pid);

    List<Product> findAll();

    List<Product> findHotDealProduct();

    List<Product> findByCategory(String catogoryId);

    Product findByPid(String pid);

    List<Product> findByDateOrderAndCategory(String category);

    List<Product> toStore(String categoryId);

    String showCategory(List<Product> products, String categoryId);

    List<Product> searchProduct(String name, String categoryId);

    String loadDataToGrad(String categoryId) throws JSONException;

    Product checkAndCreate(String pname, String description, String details, String rating,
                           MultipartFile avatar1, MultipartFile avatar2, MultipartFile avatar3,
                           MultipartFile avatar4, String categoryId, String price,
                           String firstcost, String discount, String stock, String path);

    int getProductsCount(String categoryId, List<Product> products);

    int getProductsCountByBrand(String brand, List<Product> products);

    List<Product> productFilter(String category1, String category2, String category3, String category4,
                                String brandsony, String brandsamsung, String brandhuawei, String brandxiaomi,
                                String pricemin, String pricemax, List<Product> store);
}
