package com.clxk.electro.controller;

import com.clxk.electro.model.Product;
import com.clxk.electro.service.ProductReviewsService;
import com.clxk.electro.service.ProductService;
import org.json.JSONException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
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
    private ProductReviewsService productReviewsService;
    @Resource
    private ServletContext servletContext;

    @RequestMapping("/toProductDetails.do")
    public String toProductDetails(String pid, Model model) {
        model.addAttribute("productDetails", productService.findByPid(pid));
        model.addAttribute("productReviews", productReviewsService.getReviews(pid));
        model.addAttribute("star5Cnt", productReviewsService.getStarCnt(5, pid));
        model.addAttribute("star4Cnt", productReviewsService.getStarCnt(4, pid));
        model.addAttribute("star3Cnt", productReviewsService.getStarCnt(3, pid));
        model.addAttribute("star2Cnt", productReviewsService.getStarCnt(2, pid));
        model.addAttribute("star1Cnt", productReviewsService.getStarCnt(1, pid));
        return "/WEB-INF/views/product";
    }


    @RequestMapping("/toStore.do")
    public String toStore(String categoryId, HttpSession session, Model model) {
        List<Product> products = productService.toStore(categoryId);
        session.setAttribute("store", products);
        model.addAttribute("category", productService.showCategory(products, categoryId));
        model .addAttribute("laptopCnt", productService.getProductsCount("1", products));
        model .addAttribute("smartphoneCnt", productService.getProductsCount("2", products));
        model .addAttribute("cameraCnt", productService.getProductsCount("3", products));
        model .addAttribute("accessoriesCnt", productService.getProductsCount("4", products));
        model.addAttribute("samsungCnt", productService.getProductsCountByBrand("sanmsung", products));
        model.addAttribute("huaweiCnt", productService.getProductsCountByBrand("huawei", products));
        model.addAttribute("miCnt", productService.getProductsCountByBrand("xiaomi", products));
        model.addAttribute("sonyCnt", productService.getProductsCountByBrand("sony", products));
        return "/WEB-INF/views/store";
    }

    @RequestMapping("/searchProduct.do")
    public String searchProduct(String name, String categoryId, HttpSession session, Model model) {
        List<Product> products = productService.searchProduct(name, categoryId);
        session.setAttribute("store", products);
        model.addAttribute("category", productService.showCategory(products, categoryId));
        return "/WEB-INF/views/store";
    }

    @RequestMapping("/table/getProductTable.do")
    public String getProductTable(Model model, String categoryId, String type) {
        model.addAttribute("productTable", productService.findByCategory(categoryId));
        model.addAttribute("categoryId", categoryId);
        return "/WEB-INF/views/manager/" + (type != null && type.equals("editable") ? "editable-table-product" : "table-product");
    }

    @RequestMapping("/table/loadDataToGrad.do")
    @ResponseBody
    public String loadDataToGrad(String categoryId) {
        try {
            return productService.loadDataToGrad(categoryId);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping("/deleteProduct.do")
    @ResponseBody
    public String deleteProduct(String pid, String type) {
        if (type != null && type.equals("editable")) {
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
    public String upload(Model model, String pname, String categoryId
            , String price, String firstcost, String discount, String stock
            , @RequestParam("img1") MultipartFile avatar1, @RequestParam("img2") MultipartFile avatar2
            , @RequestParam("img3") MultipartFile avatar3, @RequestParam("img4") MultipartFile avatar4
            , String description, String details, String rating) {
        model.addAttribute("pname", pname);
        model.addAttribute("description", description);
        model.addAttribute("details", details);
        model.addAttribute("rating", rating);
        model.addAttribute("price", price);
        model.addAttribute("firstcost", firstcost);
        model.addAttribute("discount", discount);
        model.addAttribute("stock", stock);
        model.addAttribute("categoryId", categoryId);
        String path = servletContext.getRealPath("/WEB-INF/imgs/");
        Product product = productService.checkAndCreate(pname, description, details, rating, avatar1, avatar2, avatar3, avatar4,
                categoryId, price, firstcost, discount, stock, path);
        if (product == null) {
            model.addAttribute("msg", "Avatar Error!");
            return "/WEB-INF/views/manager/add_product";
        }
        return getProductTable(model, "0", null);
    }

    @RequestMapping("/productFilter.do")
    @ResponseBody
    public String productFilter(String category1, String category2, String category3, String category4
                                , String brandsony, String brandsamsung, String brandhuawei, String brandxiaomi
                                , String pricemin, String pricemax,HttpSession session) {
        List<Product> products = productService.productFilter(category1, category2, category3, category4,
                brandsony, brandsamsung, brandhuawei, brandxiaomi, pricemin, pricemax,
                (List<Product>)session.getAttribute("store"));
        session.setAttribute("filterProducts", products);
        return "SUCCESS";
    }
}
