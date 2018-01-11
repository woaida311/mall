package com.hwua.ssm.service.impl;

import com.hwua.ssm.dao.UserMapper;
import com.hwua.ssm.po.Auth;
import com.hwua.ssm.po.User;
import com.hwua.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@SuppressWarnings("ALL")
@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public Map<String, Object> query(Map<String, Object> param) {
        int count = userMapper.getCount(param);
        List<User> userList = userMapper.query(param);
        HashMap<String,Object> map = new HashMap<>();
        map.put("total",count);
        map.put("rows",userList);
        return map;
    }

    @Override
    public List<Map<String, Object>> getAllRole(Integer userId) {
        List<Map<String, Object>> allRole = userMapper.queryValidRole(userId);
        List<Integer> roles = userMapper.getRoles(userId);
        for (Map role:allRole) {
            if(roles.contains(role.get("dbid"))){
                role.put("checked",true);
            }
        }
        return allRole;
    }
    
    @Override
    public int doAddUser(User user) {
        return userMapper.doInsert(user);
    }

    @Override
    public int doResetUser(User user) {
        return userMapper.doUpdate(user);
    }
    //当一个业务操作包含多个增删改的数据操作时，一定要进行事务控制
    @Transactional
    @Override
    public int grantRole(Integer userId, Integer[] roleIds) {
        int i = userMapper.delete(userId);
        ArrayList<Map<String,Integer>> list = new ArrayList<>();
        for (Integer roleId:roleIds) {
        HashMap<String,Integer> map = new HashMap<>();
        map.put("userId",userId);
        map.put("roleId",roleId);
        list.add(map);
        }
        System.out.println("list = " + list);
        i += userMapper.insertRole(list);
        return i;
    }

    @Override
    public User login(Map<String,String> userMap) {
        return userMapper.doLogin(userMap);
    }

    @Override
    public List<Auth> queryAuth(Integer userId) {
        Auth father = null,son = null;
        List<Auth> children =null;
        List<Auth> auths = userMapper.queryAuthByUserId(userId);
        for(int i =auths.size()-1;i>=0;i--){
            //给每个权限一次当爹的机会 开始找儿子
         father =auths.get(i);
            children = new ArrayList<>();
            for (int j=auths.size()-1;j>=0;j--){
               son = auths.get(j);
                if(son.getParentId().equals(father.getDbid())){
                    //每个权限只能当一次儿子
                    children.add(son);
                    auths.remove(j);
                }
            }
            father.setChildren(children);
        }
        //检查,删除掉层级不为1的数据
        for(int i = 0;i<auths.size();i++){
            Auth auth = auths.get(i);
            if(auth.getLayer() != 1){
                auths.remove(i);
                i--;
            }
        }
        return auths;
    }

    @Override
    public List<Auth> queryAuth2(Integer userId) {
        Auth father = null,son = null;
        List<Auth> children =null;
        List<Auth> auths = userMapper.queryAuth2ByUserId(userId);
        for(int i =auths.size()-1;i>=0;i--){
            //给每个权限一次当爹的机会 开始找儿子
            father =auths.get(i);
            children = new ArrayList<>();
            for (int j=auths.size()-1;j>=0;j--){
                son = auths.get(j);
                if(son.getParentId().equals(father.getDbid())){
                    //每个权限只能当一次儿子
                    children.add(son);
                    auths.remove(j);
                }
            }
            father.setChildren(children);
        }
        return auths;
    }

    @Override
    public int updateUserPassword(User user) {
        return userMapper.resetPassword(user);
    }
}
