package com.hwua.ssm.dao;

import com.hwua.ssm.po.Role;

import java.util.List;
import java.util.Map;

public interface RoleMapper {
    //获取所有权限，及权限的数目
    public List<Role> query(Map<String, Object> param);
    public int getCount(Map<String, Object> param);
    //添加
    public int doInsert(Role role);
    //双击编辑
    public int doUpdate(Role role);
    //删除旧的权限
    public int deleteByRoleId(Integer roleId);
    //添加新的权限
    public  int insertAuth(List<Map<String, Integer>> param);
}
