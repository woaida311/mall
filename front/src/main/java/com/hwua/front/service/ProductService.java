package com.hwua.front.service;

import com.hwua.common.po.Product;

import java.util.Set;

public interface ProductService {
    public Product gerById(Integer id);
    public Set<Product> getByCid(Integer cid, Integer page, Integer pageSize);
    public Set<Product> getByBid(Integer bid, Integer page, Integer pageSize);
    public Set<Product> getByCidAndBid(Integer cid, Integer bid, Integer page, Integer pageSize);
    public Set<Product> search(String keyWord, Integer page, Integer pageSize);
}
