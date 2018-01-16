package com.hwua.common.dao;

import com.hwua.common.po.Product;

import java.util.Map;
import java.util.Set;

public interface ProductMapper {
    /**
     * 多条件查询，根据名称模糊查询、根据品牌查询、根据类型查询、分页查询
     * @param param 名称：name，品牌：bid，类型：cid，分页：start/pageSize
     * @return 根据条件查询出的商品
     */
    public Set<Product> query(Map<String, Object> param);

    /**
     * 根据商品的id查询商品详细信息
     * @param id 商品id
     * @return 查询出的商品
     */
    public Product queryByPid(Integer id);
    /**
     *根据商品bid和cid查询商品  bid和cid查询结果可能会有多个商品，此结果显示在
     * 商品界面(分页显示)
     * */
    /*public List<Product> queryByBidCid(Integer bid,Integer cid);*/
}
