package com.hwua.ssm.service.impl;

import com.hwua.ssm.dao.CategoryBrandMapper;
import com.hwua.ssm.po.Brand;
import com.hwua.ssm.po.Category;
import com.hwua.ssm.po.CategoryBrand;
import com.hwua.ssm.service.CBService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

@SuppressWarnings("ALL")
@Service("cBService")
public class CBServiceImpl implements CBService{
    @Autowired
private CategoryBrandMapper categoryBrandMapper;

    public Set<CategoryBrand> getCBs() {
        return categoryBrandMapper.getCBs();
    }

    @Override
    public List<Brand> getBrand() {
        return categoryBrandMapper.getBrands();
    }

    @Override
    public String getBname(Integer bid) {
        return categoryBrandMapper.getBname(bid);
    }

    @Override
    public List<Category> getCategory() {
        return categoryBrandMapper.getCategory();
    }

    @Override
    public String getCname(Integer cid) {
        return categoryBrandMapper.getCname(cid);
    }
}
