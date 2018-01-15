package com.hwua.ssm.service;

import com.hwua.ssm.po.Brand;
import com.hwua.ssm.po.Category;
import com.hwua.ssm.po.CategoryBrand;

import java.util.List;
import java.util.Set;

public interface CBService {
    /**
     * 获取分类及分类对应的品牌
     */
    public Set<CategoryBrand> getCBs();
    //获取品牌
    public List<Brand> getBrand();
    //获取品牌名
    public String getBname(Integer bid);
    //获取种类
    public List<Category> getCategory();
    //获取种类名
    public String getCname(Integer cid);
}
