package com.hwua.ssm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.hwua.ssm.po.Auth;
import com.hwua.ssm.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/auth")
public class AuthController {
    @Autowired
    private AuthService authService;
    @RequestMapping("/toMain")
    public String main(){
        return "auth";
    }
    @RequestMapping(value = "/getAllAuth",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getAuths(){
        List<Auth> auth = authService.queryAll();
        //加了ResponseBody不会再去找页面 而是直接返回字符串
        return JSON.toJSONString(auth);
    }
    @RequestMapping(value = "/update",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String update(Auth auth){
        System.out.println("auth = " + auth);
        JSONObject jsonObject = new JSONObject();
        Integer dbid = auth.getDbid();
        System.out.println("dbid = " + dbid);
        if(dbid == 0){
            int j = authService.doInsert(auth);
            if(j==1){
                jsonObject.put("msg",true);
            }else {
                jsonObject.put("msg",false);
            }
        }else {
            int i = authService.doUpdate(auth);
            if (i==1){
                jsonObject.put("msg",true);
            }else {
                jsonObject.put("msg",false);
            }
        }

        return jsonObject.toJSONString();
    }
}
