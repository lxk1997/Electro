package com.clxk.electro.controller;

import com.clxk.electro.common.Utils;
import com.clxk.electro.model.OrderItem;
import com.clxk.electro.model.Product;
import com.clxk.electro.model.ProductDetails;
import com.clxk.electro.service.CategoryService;
import com.clxk.electro.service.ProductService;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Description Product控制层
 * @Author Clxk
 * @Date 2019/5/30 21:12
 * @Version 1.0
 */
@Controller
@RequestMapping("/product")
public class ProductController {

    @Resource
    private ProductService productService;
    @Resource
    private CategoryService categoryService;

    @RequestMapping("/toProductDetails.do")
    public String toProductDetails(HttpSession session, HttpServletRequest request) {
        String pid = request.getParameter("pid");
        Product product = productService.findByPid(pid);
        request.setAttribute("productDetails", product);
        return "/WEB-INF/views/product";
    }


    @RequestMapping("/toStore.do")
    public String toStore(String categoryId, HttpSession session, HttpServletRequest request) {
        if(categoryId == null || categoryId.equals("0")) {
            List<Product> productList = productService.findAll();
            session.setAttribute("store",productList);
            request.setAttribute("category","Categories（" + productList.size() + "RESULTS)");
        } else if(categoryId.equals("-1")) {
            List<Product> productList = productService.findHotDealProduct();
            session.setAttribute("store",productList);
            request.setAttribute("category", "Hot deals (" + productList.size() + "RESULTS)");
        }
        else {
            List<Product> productList = productService.findByDateOrderAndCategory(categoryId);
            session.setAttribute("store",productList);
            request.setAttribute("category", categoryService.findByCid(categoryId).getCname() + "(" + productList.size() + "RESULTS)");
        }
        return "/WEB-INF/views/store";
    }

    @RequestMapping("/searchProduct.do")
    public String searchProduct(String name, String categoryId, HttpSession session, HttpServletRequest request) {
        List<Product> ansList = new ArrayList<>();
        if(categoryId == null || categoryId.equals("0")) {
            List<Product> productList = productService.findAll();
            for(Product product : productList) {
                if(product.getPname().toLowerCase().contains(name.toLowerCase())) {
                    ansList.add(product);
                }
            }
            session.setAttribute("store",ansList);
            request.setAttribute("category","Categories（" + ansList.size() + "RESULTS)");
        }
        else {
            List<Product> productList = productService.findByDateOrderAndCategory(categoryId);
            for(Product product : productList) {
                if(product.getPname().toLowerCase().contains(name.toLowerCase())) {
                    ansList.add(product);
                }
            }
            System.out.println(ansList.size());
            session.setAttribute("store",ansList);
            request.setAttribute("category", categoryService.findByCid(categoryId).getCname() + "(" + ansList.size() + "RESULTS)");
        }

        return "/WEB-INF/views/store";
    }

    @RequestMapping("/table/getProductTable.do")
    public String getProductTable(HttpServletRequest request, String categoryId, String type) {

        String url = "/WEB-INF/views/manager/table-product";
        if(type != null && type.equals("editable")) {
            url = "/WEB-INF/views/manager/editable-table-product";
        }
        if(categoryId == null || categoryId.equals("all")) {
            request.setAttribute("productTable", productService.findAll());
        } else {
            request.setAttribute("productTable", productService.findByCategory(categoryId));
        }
        request.setAttribute("categoryId", request.getParameter("categoryId"));
        return url;
    }

    @RequestMapping("/table/loadDataToGrad.do")
    @ResponseBody
    public String loadDataToGrad(HttpServletRequest request) throws JSONException {
        List<Product> products = null;
        String categoryId = request.getParameter("categoryId");
        if(categoryId == null || categoryId == "" || categoryId.equals("0")) products = productService.findAll();
        else products = productService.findByCategory(categoryId);
        JSONArray data = new JSONArray();
        for(Product p : products) {
            JSONObject product = new JSONObject();
            product.put("Product Id",p.getPid());
            product.put("Product Name", p.getPname());
            product.put("Category Id", p.getCategoryId());
            product.put("Price", p.getPrice());
            product.put("Firstcost", p.getFirstcost());
            product.put("Discount",p.getDiscount());
            product.put("Stock", p.getStock());
            product.put("Date", p.getDate().toString());
            data.put(product);
        }
        return data.toString();
    }

    @RequestMapping("/deleteProduct.do")
    @ResponseBody
    public String deleteProduct(HttpSession session, String pid, String type) {
        if(type != null && type.equals("editable")) {
            productService.deleteByPid(pid);
        }
        return "SUCCESS";
    }

    @RequestMapping("/updateProduct.do")
    @ResponseBody
    public String updateProduct(Product product) {
        productService.update(product);
        return "SUCCESS";
    }

    @RequestMapping("/toAdd.do")
    public String toAdd() {
        return "/WEB-INF/views/manager/add_product";
    }

    @RequestMapping("/upload.do")
    public String upload(HttpServletRequest request, String pname, String categoryId
            , String price, String firstcost, String discount, String stock
            , @RequestParam("img1") MultipartFile avatar1, @RequestParam("img2") MultipartFile avatar2
            , @RequestParam("img3") MultipartFile avatar3, @RequestParam("img4") MultipartFile avatar4
            ,  String description,  String details,  String rating) {
        String uuid = Utils.uuid();
        pname = Utils.escapeXml(pname);
        description = Utils.escapeXml(description);
        details = Utils.escapeXml(details);
        rating = Utils.escapeXml(rating);
        request.setAttribute("pname",pname);
        request.setAttribute("description",description);
        request.setAttribute("details",details);
        request.setAttribute("rating",rating);
        request.setAttribute("price",price);
        request.setAttribute("firstcost",firstcost);
        request.setAttribute("discount",discount);
        request.setAttribute("stock",stock);
        request.setAttribute("categoryId",categoryId);
        if(!avatar1.getContentType().contains("image")) {
            request.setAttribute("msg", "Avatar Error!");
        } else if(!avatar2.getContentType().contains("image")) {
            request.setAttribute("msg", "Avatar Error!");
        } else if(!avatar3.getContentType().contains("image")) {
            request.setAttribute("msg", "Avatar Error!");
        } else if(!avatar4.getContentType().contains("image")) {
            request.setAttribute("msg", "Avatar Error!");
        }
        if(request.getAttribute("msg") != null) {
            return "/WEB-INF/views/manager/add_product";
        }
        Product product = new Product(uuid,pname,categoryId,Double.valueOf(price),Double.valueOf(firstcost),
                Double.valueOf(discount), Integer.valueOf(stock), new Date());
        String path = request.getServletContext().getRealPath("/WEB-INF/imgs/");
        ProductDetails pd = new ProductDetails(uuid,Utils.saveFile(avatar1),Utils.saveFile(avatar2),
                Utils.saveFile(avatar3),Utils.saveFile(avatar4),description,details,100);
        product.setProductDetails(pd);
        productService.insert(product);
        return getProductTable(request,null, null);
    }
}
