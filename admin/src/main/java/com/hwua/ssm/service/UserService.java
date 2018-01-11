package com.hwua.ssm.service;

import com.hwua.ssm.po.Auth;
import com.hwua.ssm.po.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    public Map<String,Object> query(Map<String, Object> param);

    List<Map<String,Object>> getAllRole(Integer userId);

    public int doAddUser(User user);

    public int doResetUser(User user);

    int grantRole(Integer userId, Integer[] roleIds);

    //用户登录
    User login(Map<String, String> userMap);

    //查询用户权限
    public List<Auth> queryAuth(Integer userId);
    //查询用户权限2
    public List<Auth> queryAuth2(Integer userId);
    //修改密码
    public int updateUserPassword(User user);
}
