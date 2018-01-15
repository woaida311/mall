package com.hwua.ssm.service.impl;

import com.hwua.ssm.dao.ProductMapper;
import com.hwua.ssm.po.Product;
import com.hwua.ssm.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;
@SuppressWarnings("ALL")
@Service("productService")
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductMapper productMapper;

    @Override
    public Product gerById(Integer id) {
        return productMapper.queryByPid(id);
    }

    @Override
    public Set<Product> getByCid(Integer cid, Integer page, Integer pageSize) {
        Map<String,Object> param = new HashMap<>();
        param.put("cid",cid);
        param.put("page",page);
        param.put("pageSize",pageSize);
        return productMapper.query(param);
    }

    @Override
    public Set<Product> getByBid(Integer bid, Integer page, Integer pageSize) {
        Map<String,Object> param = new HashMap<>();
        param.put("bid",bid);
        param.put("page",page);
        param.put("pageSize",pageSize);
        return productMapper.query(param);
    }

    @Override
    public Set<Product> getByCidAndBid(Integer cid, Integer bid, Integer page, Integer pageSize) {
        Map<String,Object> param = new HashMap<>();
        param.put("cid",cid);
        param.put("bid",bid);
        param.put("page",page);
        param.put("pageSize",pageSize);
        return productMapper.query(param);
    }

    @Override
    public Set<Product> search(String keyWord, Integer page, Integer pageSize) {
        Map<String,Object> param = new HashMap<>();
        param.put("keyWord",keyWord);
        param.put("page",page);
        param.put("pageSize",pageSize);
        return productMapper.query(param);
    }
}
