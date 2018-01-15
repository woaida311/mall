package com.hwua.ssm.service;

import com.hwua.ssm.po.Product;

import java.util.Set;

public interface ProductService {
    public Product gerById(Integer id);
    public Set<Product> getByCid(Integer cid, Integer page, Integer pageSize);
    public Set<Product> getByBid(Integer bid,Integer page,Integer pageSize);
    public Set<Product> getByCidAndBid(Integer cid, Integer bid,Integer page,Integer pageSize);
    public Set<Product> search(String keyWord,Integer page,Integer pageSize);
}
