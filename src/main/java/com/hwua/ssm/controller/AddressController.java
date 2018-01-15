package com.hwua.ssm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.hwua.ssm.po.Address;
import com.hwua.ssm.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/address")
public class AddressController {
    @Autowired
    private AddressService addressService;
    @RequestMapping("toAddress")
    public String main(){
        return "address";
    }
    //添加收货地址
    @RequestMapping(value = "/add",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String addAddr(Address address){
        System.out.println("address = " + address);
        JSONObject jsonObject = new JSONObject();
        int i = addressService.addAddr(address);
        if (i == 1) {
            jsonObject.put("msg", true);//添加成功
        } else {
            jsonObject.put("msg", false);
        }

        return jsonObject.toJSONString();
    }
    //显示用户的默认收货地址
    @RequestMapping(value = "/show",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String showAddr(Integer mid, HttpSession session){
        Address address = addressService.show(mid);
        System.out.println("address = " + address);
        session.setAttribute("address",address);
        JSONObject jsonObject = new JSONObject();
        return jsonObject.toJSONString();
    }
    //显示用户所有的收货地址
    @RequestMapping(value = "/showAll",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String showAllAddr(Integer mid,HttpSession session){
        List<Address> addresses = addressService.showAll(mid);
        session.setAttribute("addresses",addresses);
        return JSON.toJSONString(addresses);
    }
    //修改默认地址
    @RequestMapping(value = "/update",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String updateAddr(Integer mid,Integer id){
        System.out.println("mid = " + mid);
        System.out.println("id = " + id);
        int i = addressService.updateAddr(mid, id);
        JSONObject jsonObject = new JSONObject();
        if (i > 0) {
            jsonObject.put("msg", true);//修改成功
        } else {
            jsonObject.put("msg", false);
        }
        return "";
    }
}
