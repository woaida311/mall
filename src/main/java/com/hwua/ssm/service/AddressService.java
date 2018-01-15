package com.hwua.ssm.service;

import com.hwua.ssm.po.Address;

import java.util.List;


public interface AddressService {
    //添加之前先查询地址是否超过5个
    public int addAddr(Address address);
    //删除收货地址
public int delAddr(Integer id);
    //设置默认地址
public int updateAddr(Integer mid,Integer id);
    //查询默认地址
public Address show(Integer mid);
//查询所有的收货地址
    public List<Address> showAll(Integer mid);
}

