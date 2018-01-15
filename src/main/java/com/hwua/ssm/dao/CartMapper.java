package com.hwua.ssm.dao;

import com.hwua.ssm.po.Cart;


import java.util.Map;

public interface CartMapper {
    //根据用户id查询用户购物车的信息
    public Cart getMemberCart(Integer mid);
    //用户添加商品前先判断，是否有该商品根据mid和pid判断
    //没有该商品，add一条新记录，有该商品，count=count+1
    public Cart getMemberCart(Map<Integer,Integer> idMap);
    //表中没有重复商品时增加一条新记录
    public int addCart(Cart cart);
    //表中有记录，直接修改记录
    //用户下单时，在购物车记录中-count
    public int updateCart(Cart cart);
    //如果下单-完count之后，count=0删除购物车记录一条
    public int delCart(Integer count);
    //清空所有购物车 根据mid清空
    public int delAllCart(Integer mid);
}
