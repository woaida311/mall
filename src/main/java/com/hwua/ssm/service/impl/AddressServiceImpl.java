package com.hwua.ssm.service.impl;

import com.hwua.ssm.dao.AddressMapper;
import com.hwua.ssm.po.Address;
import com.hwua.ssm.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SuppressWarnings("ALL")
@Service("addressService")
public class AddressServiceImpl implements AddressService {
    @Autowired
    private AddressMapper addressMapper;
    public int addAddr(Address address) {
        //添加之前先计数
        int count = addressMapper.getCount(address.getMid());
        System.out.println("count = " + count);
        if (count > 4){
            return -1;
        }else {
            int i = addressMapper.addAddress(address);
            return i;
        }
    }

    public int delAddr(Integer id) {
        return addressMapper.delAddress(id);
    }
    //当一个业务操作包含多个增删改的数据操作时，一定要进行事务控制
    @Transactional
    public int updateAddr(Integer mid, Integer id) {
        int i = addressMapper.updateAddressTo0(mid);
        System.out.println("将该用户的所有地址设置为非默认状态 = " + i);
        Map<String,Integer> idMap = new HashMap<String, Integer>();
        idMap.put("id",id);
        idMap.put("mid",mid);
        int j = addressMapper.updateAddressTo1(idMap);
        if(j == 0){
            throw new RuntimeException("用户与地址不匹配");
        }
        System.out.println("将id为id的地址设置为默认地址 = " + j);
        return i+j;
    }

    public Address show(Integer mid) {
        return addressMapper.showAddress(mid);
    }

    public List<Address> showAll(Integer mid) {
        return addressMapper.queryAll(mid);
    }
}
