package com.hwua.ssm.dao;

import com.hwua.ssm.po.Auth;
import com.hwua.ssm.po.User;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    //查询所有用户
    public List<User> query(Map<String, Object> userMap);
//查询用户数据的条数
    public int getCount(Map<String, Object> userMap);
//添加用户
    public int doInsert(User user);
    //编辑用户信息
    public int doUpdate(User user);
    //查询有效的角色

    //查询所有有效的角色名和角色编码
    public List<Map<String,Object>> queryValidRole(Integer userId);
    //
   public List<Integer> getRoles(Integer userId);
    int delete(Integer userId);
    //授予新的角色
    public  int insertRole(List<Map<String, Integer>> param);

    //判断帐号密码是否正确,帐号密码正确则查询出该用户的用户信息
    public User doLogin(Map<String, String> userMap);
    //根据用户id查询用户所拥有的权限
   public List<Auth> queryAuthByUserId(Integer userId);

   //根据用户id查询用户的权限
    public List<Auth>queryAuth2ByUserId(Integer userId);

   //修改用户的密码
    public int resetPassword(User user);
}
