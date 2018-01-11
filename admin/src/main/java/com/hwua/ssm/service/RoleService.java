package com.hwua.ssm.service;

import com.hwua.ssm.po.Role;

import java.util.List;
import java.util.Map;

public interface RoleService {
    public Map<String,Object> query(Map<String, Object> param);
    //添加
    public int doAddRole(Role role);
    //修改role
    public int doUpdate(Role role);

    public List<Map<String,Object>> queryName(Integer roleId);

    public int grantAuth(Integer roleId, Integer[] authIds);
}
