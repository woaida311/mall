package com.hwua.ssm.service.impl;

import com.hwua.ssm.dao.AuthMapper;
import com.hwua.ssm.dao.RoleMapper;
import com.hwua.ssm.po.Role;
import com.hwua.ssm.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service("roleService")
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private AuthMapper authMapper;
    public Map<String, Object> query(Map<String, Object> param) {
        int count = roleMapper.getCount(param);
        List<Role> roles = roleMapper.query(param);
        HashMap<String,Object> map = new HashMap<>();
        map.put("total",count);
        map.put("rows",roles);
        return map;
    }

    @Override
    public int doAddRole(Role role) {
        return roleMapper.doInsert(role);
    }

    @Override
    public int doUpdate(Role role) {
        return roleMapper.doUpdate(role);
    }

    @Override
    public List<Map<String, Object>> queryName(Integer roleId) {
        System.out.println("roleId = " + roleId);
       //查询所有有效的权限
        List<Map<String, Object>> validAuth = authMapper.queryNameByDbid(-1);
        System.out.println("validAuth = " + validAuth);
        List<Integer> auths = authMapper.queryByRoleId(roleId);
        System.out.println("auths = " + auths);
        //打钩
        parseAuth(validAuth,auths);
        return validAuth;
    }
//需要事务控制
    @Transactional
    @Override
    public int grantAuth(Integer roleId, Integer[] authIds) {
        int i = roleMapper.deleteByRoleId(roleId);
        List<Map<String,Integer>> param = new ArrayList<>();
        for (Integer authId: authIds) {
            Map<String,Integer> map = new HashMap<>();
            map.put("roleId",roleId);
            map.put("authId",authId);
            param.add(map);
        }
        i += roleMapper.insertAuth(param);
        return i;
    }

    private void parseAuth(List<Map<String, Object>> validAuth,List<Integer> auths){
        for (Map<String, Object> auth:validAuth) {
            if(auths.contains(auth.get("id"))){
                auth.put("checked",true);
            }
            List<Map<String, Object>> children =(List<Map<String, Object>>) auth.get("children");
            parseAuth(children,auths);
        }
    }
}
