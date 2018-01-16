package com.hwua.front.service;

import com.hwua.common.po.Cart;

import java.util.Set;

public interface CartService {
    //根据用户id查询购物车信息
    public Set<Cart> showCart(Integer mid);
    //购物车添加记录
    public int addOrUpdateCart(Cart cart);
    //下单后，购物车中count减少
    public int updateCount(Cart cart);
    //count=0的记录应该被清除
    public int delCart(Integer mid);
    //清空某用户的所有购物车
    public int delAllCart(Integer mid);

}
