package com.hwua.ssm.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.hwua.ssm.po.Role;
import com.hwua.ssm.service.AuthService;
import com.hwua.ssm.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService roleService;
    @Autowired
    private AuthService authService;
    @RequestMapping("/toRole")
    public String main(){
        return "role";
    }
    @RequestMapping(value = "/getAllRole",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getRoles(String roleName,String roleCode,String valid,Integer page,Integer rows){

        Map<String,Object> param = new HashMap<>();
       /* if("".equals(roleName)){
            roleName = null;
        }
        if("".equals(roleCode)){
            roleCode = null;
        }*/
        /*roleName = "".equals(roleName) ? null: roleName;*/
        //通过返回boolean类型说明一个字符串是否为空，这里的为空包含两种，null和空串
        param.put("roleName", StringUtils.isEmpty(roleName)?null:roleName);
        param.put("roleCode",StringUtils.isEmpty(roleCode)?null:roleCode);
        param.put("valid",valid);
        param.put("start",(page-1)*rows);
        param.put("rows",rows);
        System.out.println("param = " + param);
        Map<String, Object> query = roleService.query(param);
        System.out.println("query = " + query);
        //加了ResponseBody不会再去找页面 而是直接返回字符串
        return JSON.toJSONString(query);
    }
    @RequestMapping(value = "/update",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String update(Role role){
        System.out.println("role = " + role);
        JSONObject jsonObject = new JSONObject();
        Integer dbid = role.getDbid();
        System.out.println("dbid = " + dbid);
            int j = roleService.doAddRole(role);
            if(j==1){
                jsonObject.put("msg",true);
            }else {
                jsonObject.put("msg",false);
            }
        return jsonObject.toJSONString();
    }
    @RequestMapping(value = "/getAuthName",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getAuth(Integer roleId){
        //查询角色对应的权限
        List<Map<String, Object>> auths = roleService.queryName(roleId);
        return JSON.toJSONString(auths);
    }
    @RequestMapping(value = "/grantAuth",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String grantAuth(Integer roleId,Integer[] authIds){
        System.out.println("roleId = " + roleId);
        System.out.println("authIds = " +authIds);
        int i = roleService.grantAuth(roleId, authIds);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg",i>0);
        return jsonObject.toJSONString();
    }
}
