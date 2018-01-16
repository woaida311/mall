package com.hwua.common.dao;

import com.hwua.common.po.Address;

import java.util.List;
import java.util.Map;

public interface AddressMapper {
    //添加地址
public int addAddress(Address address);
//删除收货地址
    public int delAddress(Integer id);
    //地址计数(同属于一个mid的地址超过5个就不可以在添加)
    public int getCount(Integer mid);
    //显示默认地址 默认地址的状态为1
public Address showAddress(Integer mid);
//显示所有地址
    public List<Address> queryAll(Integer mid);
    //修改地址为默认地址 要执行两部操作，先判断是否已经有默认地址
    //如果有默认地址，先把原来的默认地址的状态设置为0，再把要设置为
    //默认地址的address状态设置为1
    public int updateAddressTo0(Integer mid);
    public int updateAddressTo1(Map<String, Integer> idMap);

}
