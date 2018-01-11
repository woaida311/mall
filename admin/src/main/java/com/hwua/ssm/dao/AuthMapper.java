package com.hwua.ssm.dao;

import com.hwua.ssm.po.Auth;

import java.util.List;
import java.util.Map;

public interface AuthMapper {
    public List<Auth> queryByDbid(Integer dbid);
    public int doUpdate(Auth auth);
    public int doInsert(Auth auth);
    public List<Integer> queryByRoleId(Integer dbid);
    //查出来的结果显示在授权窗口
    public List<Map<String,Object>> queryNameByDbid(Integer dbid);
//查询出角色对应的id
}
