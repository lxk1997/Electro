package com.clxk.electro.service.impl;

import com.clxk.electro.common.Utils;
import com.clxk.electro.dao.CategoryDao;
import com.clxk.electro.dao.ProductDao;
import com.clxk.electro.dao.cache.ProductRedisDao;
import com.clxk.electro.model.Product;
import com.clxk.electro.model.ProductDetails;
import com.clxk.electro.service.ProductService;
import com.dyuproject.protostuff.ProtostuffIOUtil;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * @Description ProductService实现层
 * @Author Clxk
 * @Date 2019/5/30 21:10
 * @Version 1.0
 */
@Service
public class ProductServiceImpl implements ProductService {

    @Resource
    private ProductDao productDao;
    @Resource
    private CategoryDao categoryDao;
    @Resource
    private ProductRedisDao productRedisDao;

    @Override
    public int update(Product product) {
        return productDao.update(product);
    }

    @Override
    public int deleteByPid(String pid) {
        return productDao.deleteByPid(pid);
    }

    @Override
    public List<Product> findHotDealProduct() {
        List<Product> products = productRedisDao.getProductList("hotDeal");
        if(products == null) {
            products = productDao.findHotDealProduct();
            productRedisDao.putProductList(products,"hotDeal");
        }
        return products;
    }

    @Override
    public List<Product> findByCategory(String categoryId) {
        List<Product> products;
        if (categoryId == null || categoryId.equals("0")) {
            products = productDao.findAll();
        }
        else {
            products = productRedisDao.getProductList("categoryId:" + categoryId);
            if(products == null) {
                products = productDao.findByCategory(categoryId);
                productRedisDao.putProductList(products,"categoryId:" + categoryId);
            }
        }
        return products;
    }

    @Override
    public Product findByPid(String pid) {
        Product product = productRedisDao.getProduct(pid);
        if(product == null) {
            product = productDao.findByPid(pid);
            productRedisDao.putProduct(product);
        }
        return product;
    }

    @Override
    public List<Product> findByDateOrderAndCategory(String categoryId) {
        List<Product> products = productRedisDao.getProductList("dateOrderAndCategoryId:" + categoryId);
        if(products == null) {
            products = productDao.findByDateOrderAndCategory(categoryId);
            productRedisDao.putProductList(products, "dateOrderAndCategoryId:" + categoryId);
        }
        return products;
    }

    @Override
    public List<Product> toStore(String categoryId) {
        if (categoryId == null || categoryId.equals("0")) {
            return productDao.findAll();
        } else if (categoryId.equals("-1")) {
            return productDao.findHotDealProduct();
        } else {
            return productDao.findByDateOrderAndCategory(categoryId);
        }
    }

    @Override
    public String showCategory(List<Product> products, String categoryId) {
        if (products == null) products = new ArrayList<>();
        if (categoryId == null || categoryId.equals("0")) {
            return "Categories（" + products.size() + "RESULTS)";
        } else if (categoryId.equals("-1")) {
            return "Hot deals (" + products.size() + "RESULTS)";
        } else {
            return categoryDao.findByCid(categoryId).getCname() + "(" + products.size() + "RESULTS)";
        }
    }

    @Override
    public List<Product> searchProduct(String name, String categoryId) {
        List<Product> ansList = new ArrayList<>();
        if (categoryId == null || categoryId.equals("0")) {
            List<Product> productList = productDao.findAll();
            for (Product product : productList) {
                if (product.getPname().toLowerCase().contains(name.toLowerCase())) {
                    ansList.add(product);
                }
            }
        } else {
            List<Product> productList = productDao.findByDateOrderAndCategory(categoryId);
            for (Product product : productList) {
                if (product.getPname().toLowerCase().contains(name.toLowerCase())) {
                    ansList.add(product);
                }
            }
        }
        return ansList;
    }

    @Override
    public String loadDataToGrad(String categoryId) throws JSONException {
        List<Product> products = productDao.findByCategory(categoryId);
        JSONArray data = new JSONArray();
        for (Product p : products) {
            JSONObject product = new JSONObject();
            product.put("Product Id", p.getPid());
            product.put("Product Name", p.getPname());
            product.put("Category Id", p.getCategoryId());
            product.put("Price", p.getPrice());
            product.put("Firstcost", p.getFirstcost());
            product.put("Discount", p.getDiscount());
            product.put("Stock", p.getStock());
            product.put("Date", p.getDate().toString());
            data.put(product);
        }
        return data.toString();
    }

    @Override
    public Product checkAndCreate(String pname, String description, String details, String rating,
                                  MultipartFile avatar1, MultipartFile avatar2, MultipartFile avatar3,
                                  MultipartFile avatar4, String categoryId, String price,
                                  String firstcost, String discount, String stock, String path) {
        boolean is_legal = true;
        String uuid = Utils.uuid();
        pname = Utils.escapeXml(pname);
        description = Utils.escapeXml(description);
        details = Utils.escapeXml(details);
        rating = Utils.escapeXml(rating);
        if (!avatar1.getContentType().contains("image")) {
            is_legal = false;
        } else if (!avatar2.getContentType().contains("image")) {
            is_legal = false;
        } else if (!avatar3.getContentType().contains("image")) {
            is_legal = false;
        } else if (!avatar4.getContentType().contains("image")) {
            is_legal = false;
        }
        if (!is_legal) return null;
        Product product = new Product(uuid, pname, categoryId, Double.valueOf(price), Double.valueOf(firstcost), Double.valueOf(discount), Integer.valueOf(stock), new Date());
        ProductDetails pd = new ProductDetails(uuid, Utils.saveFile(avatar1, path), Utils.saveFile(avatar2, path),
                Utils.saveFile(avatar3, path), Utils.saveFile(avatar4, path), description, details, 100);
        product.setProductDetails(pd);
        productDao.insert(product);
        return product;
    }

    @Override
    public int getProductsCount(String categoryId, List<Product> products) {
        int cnt = 0;
        for (Product product : products) {
            if (product.getCategoryId().equals(categoryId)) {
                cnt++;
            }
        }
        return cnt;
    }

    @Override
    public int getProductsCountByBrand(String brand, List<Product> products) {
        int cnt = 0;
        for (Product product : products) {
            if (product.getPname().toLowerCase().contains(brand)) {
                cnt++;
            }
        }
        return cnt;
    }

    @Override
    public List<Product> productFilter(String category1, String category2, String category3, String category4,
                                       String brandsony, String brandsamsung, String brandhuawei, String brandxiaomi,
                                       String pricemin, String pricemax, List<Product> store) {
        List<Product> products = new ArrayList<>(store);
        System.out.println("category-1: " + category1);
        System.out.println("category-2: " + category2);
        System.out.println("category-3: " + category3);
        System.out.println("category-4: " + category4);
        System.out.println("brandhuawei: " + brandhuawei);
        System.out.println("brandsony: " + brandsony);
        System.out.println("brandsamsung: " + brandsamsung);
        System.out.println("brandxiaomi: " + brandxiaomi);
        System.out.println("pricemin: " + pricemin);
        System.out.println("pricemax: " + pricemax);

        System.out.println("init: " + products.size());
        categoryFilter(products, category1, "1");
        categoryFilter(products, category2, "2");
        categoryFilter(products, category3, "3");
        categoryFilter(products, category4, "4");
        brandFilter(products, brandhuawei, "huawei");
        brandFilter(products, brandsony, "sony");
        brandFilter(products, brandsamsung, "samsung");
        brandFilter(products, brandxiaomi, "xiaomi");
        Iterator<Product> it = products.iterator();
        double min = Double.parseDouble(pricemin);
        double max = Double.parseDouble(pricemax);
        while (it.hasNext()) {
            Product p = it.next();
            if (p.getPrice() < min || p.getPrice() > max) {
                it.remove();
            }
        }
        System.out.println("filtered: " + products.size());
        return products;
    }

    private void brandFilter(List<Product> products, String brand, String name) {
        if(brand.equals("false")) {
            Iterator<Product> it = products.iterator();
            while (it.hasNext()) {
                Product p = it.next();
                if (p.getPname().toLowerCase().contains(name)) {
                    it.remove();
                }
            }
        }
    }

    private void categoryFilter(List<Product> products, String category, String id) {
        if (category.equals("false")) {
            System.out.println("aaaaaaa");
            Iterator<Product> it = products.iterator();
            while (it.hasNext()) {
                Product p = it.next();
                if (p.getCategoryId().equals(id)) {
                    it.remove();
                }
            }
        }
    }


}
