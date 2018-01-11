package com.hwua.ssm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.hwua.ssm.po.Auth;
import com.hwua.ssm.po.User;
import com.hwua.ssm.service.RoleService;
import com.hwua.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @RequestMapping("/toUser")
    public String main(){
        return "user";
    }
    @RequestMapping(value = "/getAllUser",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getRoles(String userName,String realName,String valid,Integer page,Integer rows){
        Map<String,Object> param = new HashMap<>();
        param.put("userName", StringUtils.isEmpty(userName)?null:userName);
        param.put("realName",StringUtils.isEmpty(realName)?null:realName);
        param.put("valid",StringUtils.isEmpty(valid)?null:valid);
        param.put("start",(page-1)*rows);
        param.put("rows",rows);
        System.out.println("param = " + param);
        Map<String, Object> query = userService.query(param);
        System.out.println("query = " + query);
        //加了ResponseBody不会再去找页面 而是直接返回字符串
        return JSON.toJSONString(query);
    }
    @RequestMapping(value = "/update",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String update(User user){
        System.out.println("user = " + user);
        JSONObject jsonObject = new JSONObject();
        Integer dbid = user.getDbid();
        System.out.println("dbid = " + dbid);
        if(dbid == 0){
            //添加用户
            int i = userService.doAddUser(user);
            if(i==1){
                jsonObject.put("msg",true);
            }else {
                jsonObject.put("msg",false);
            }
        }else {
            //修改用户信息
            int j = userService.doResetUser(user);
            if(j==1){
                jsonObject.put("msg",true);
            }else {
                jsonObject.put("msg",false);
            }
        }
            return jsonObject.toJSONString();
    }
    @RequestMapping(value = "/getAllRole",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getRole(Integer userId){
        List<Map<String, Object>> allRole = userService.getAllRole(userId);
        System.out.println("allRole = " + allRole);
        return JSON.toJSONString(allRole);
    }
    @RequestMapping(value = "/grantRole",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String grantRole(Integer userId, Integer[] roleIds){
        int i = userService.grantRole(userId, roleIds);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg",i>0);
        return jsonObject.toJSONString();
    }
    @RequestMapping(value = "/login",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String login(String userName, String password, HttpSession session){
        System.out.println("userName = " + userName);
        System.out.println("password = " + password);
        password = DigestUtils.md5DigestAsHex(password.getBytes());
        Map<String,String> userMap = new HashMap<>();
        userMap.put("userName",userName);
        userMap.put("password",password);
        User user = userService.login(userMap);
        if(user != null){
            Integer userId = user.getDbid();
            List<Auth> auths = userService.queryAuth(userId);
            List<Auth> auths2 = userService.queryAuth2(userId);
            String auth = JSON.toJSONString(auths);
            String auth2 = JSON.toJSONString(auths2);
            System.out.println("auth = " + auth);
            session.setAttribute("auths2",auth2);
            System.out.println("auths2 = " + auth2);
            session.setAttribute("auths",auths);
            session.setAttribute("user",user);
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg",user != null);
        
        return jsonObject.toJSONString();
    }
    @RequestMapping(value = "/logout",produces = "application/json;charset=UTF-8")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/login.jsp";
    }
    @RequestMapping(value = "/resetPassword",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String resetPw(String password,User user){
        System.out.println("password = " + password);
        password = DigestUtils.md5DigestAsHex(password.getBytes());
        user.setPassword(password);
        JSONObject jsonObject = new JSONObject();
        int i = userService.updateUserPassword(user);
        if(i==1){
            jsonObject.put("msg",true);
        }else {
            jsonObject.put("msg",false);
        }
        return jsonObject.toJSONString();
    }
}
