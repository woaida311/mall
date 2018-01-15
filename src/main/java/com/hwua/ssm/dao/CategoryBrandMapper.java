package com.hwua.ssm.dao;

import com.hwua.ssm.po.Brand;
import com.hwua.ssm.po.Category;
import com.hwua.ssm.po.CategoryBrand;

import java.util.List;
import java.util.Set;

public interface CategoryBrandMapper {
    //首页查到的商品分类  放在application
    /**
     * 获取导航栏需要显示的分类以及分类对应的品牌
     * @return
     */
    public Set<CategoryBrand> getCBs();
    //获取所有的brand
    public List<Brand> getBrands();
    //获取所有的category
    public List<Category> getCategory();
    //根据cid查cname
    public String getCname(Integer cid);
    //根据bid查banme
    public String getBname(Integer bid);
}
