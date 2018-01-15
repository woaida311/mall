package com.hwua.ssm.controller;

import com.alibaba.fastjson.JSON;
import com.hwua.ssm.po.Address;
import com.hwua.ssm.po.Brand;
import com.hwua.ssm.po.Product;
import com.hwua.ssm.service.AddressService;
import com.hwua.ssm.service.CBService;
import com.hwua.ssm.service.ProductService;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Set;

@Controller
public class ProductController {
    @Autowired
    private ProductService productService;
    @Autowired
    private CBService cbService;
    @Autowired
    private AddressService addressService;
    //根据pid查询商品
    @RequestMapping(value = "/showByPid",produces = "application/json;charset=UTF-8")
    public String showByPid(Integer id, Integer mid, HttpServletRequest request, HttpSession session){
        System.out.println("id = " + id);
        System.out.println("mid = " + mid);
        Address address = new Address();
        if(mid == null ){
            address = null;
        }else {
            address = addressService.show(mid);

        }
        session.setAttribute("address",address);
        Product product = productService.gerById(id);
        request.setAttribute("product",product);
        return "introduction";
    }
    //根据bid查询商品
    @RequestMapping(value = "/showByBid",produces = "application/json;charset=UTF-8")
    public String showByBid(Integer bid,Integer page,Integer pageSize,HttpServletRequest request){
        Set<Product> products = productService.getByBid(bid, page, pageSize);
        request.setAttribute("products",products);
        return "Product";
    }
    //根据cid查询商品
    @RequestMapping(value = "/showByCid",produces = "application/json;charset=UTF-8")
    public String showByCid(Integer cid,Integer page,Integer pageSize,HttpServletRequest request){
        System.out.println(cid);
        Set<Product> productsC = productService.getByCid(cid, page, pageSize);
        String products = JSON.toJSONString(productsC);
        System.out.println("products = " + products);
        request.setAttribute("products",productsC);
        return "Product";
}
    //根据cid和bid查询商品
    @RequestMapping(value = "/showByCidAndBid",produces = "application/json;charset=UTF-8")
    public String showByCidAndBid(Integer cid,Integer bid,Integer page,Integer pageSize,HttpServletRequest request){
        Set<Product> products = productService.getByCidAndBid(cid, bid, page, pageSize);
        request.setAttribute("products",products);
        return "Product";
    }
    //根据关键字查询商品信息
    @RequestMapping(value = "/showByKeyWord",produces = "application/json;charset=UTF-8")
    public String showByKeyWord(String keyWord,Integer page,Integer pageSize,HttpServletRequest request){
        Set<Product> products = productService.search(keyWord, page, pageSize);
        request.setAttribute("products",products);
        return "Product";
    }
}
