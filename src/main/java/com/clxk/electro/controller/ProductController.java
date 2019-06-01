package com.clxk.electro.controller;

import com.clxk.electro.common.Utils;
import com.clxk.electro.model.Product;
import com.clxk.electro.model.ProductDetails;
import com.clxk.electro.service.ProductDetailsService;
import com.clxk.electro.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;

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
    private ProductDetailsService productDetailsService;

    @RequestMapping("/table/getProductTable.do")
    public String getProductTable(HttpServletRequest request) {

        String queryString = request.getQueryString();
        String url = "/WEB-INF/views/manager/table-product";
        if(queryString != null && queryString.contains("editable")) {
            url = "/WEB-INF/views/manager/editable-table-product";
        }
        if(queryString == null || queryString.contains("all")) {
            request.setAttribute("productTable", productService.findAll());
        } else if(queryString.contains("1")) {
            request.setAttribute("productTable", productService.findByCategory("1"));
        } else if(queryString.contains("2")) {
            request.setAttribute("productTable", productService.findByCategory("2"));
        } else if(queryString.contains("3")) {
            request.setAttribute("productTable", productService.findByCategory("3"));
        } else if(queryString.contains("4")) {
            request.setAttribute("productTable", productService.findByCategory("4"));
        }
        return url;
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
        ProductDetails pd = new ProductDetails(uuid,Utils.saveFile(path,avatar1),Utils.saveFile(path,avatar2),
                Utils.saveFile(path,avatar3),Utils.saveFile(path,avatar4),description,details,"0,0,0,0,0");
        productService.insert(product);
        productDetailsService.insert(pd);
        return "/WEB-INF/views/product";
    }
}
