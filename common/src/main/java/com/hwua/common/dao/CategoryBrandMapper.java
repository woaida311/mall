package com.hwua.common.dao;

import com.hwua.common.po.Brand;
import com.hwua.common.po.Category;
import com.hwua.common.po.CategoryBrand;

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
