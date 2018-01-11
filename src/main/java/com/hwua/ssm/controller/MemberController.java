package com.hwua.ssm.controller;

import com.alibaba.fastjson.JSONObject;
import com.hwua.ssm.po.Member;
import com.hwua.ssm.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;
    @RequestMapping("toMember")
    public String main(){
        return "member";
    }
    @RequestMapping(value = "/register",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String register(Member member){
        System.out.println("member = " + member);
        JSONObject jsonObject = new JSONObject();
            //会员注册
            int i = memberService.addMember(member);
            if (i == 1) {
                jsonObject.put("msg", true);//注册成功
            } else {
                jsonObject.put("msg", false);
            }

        return jsonObject.toJSONString();
    }
    @RequestMapping(value = "/login",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String login(String name, String password, HttpSession session){
        System.out.println("name = " + name);
        System.out.println("password = " + password);
     //   password = DigestUtils.md5DigestAsHex(password.getBytes());
        Map<String,String> memberMap = new HashMap<String,String>();
        memberMap.put("name",name);
        memberMap.put("password",password);
        Member member = memberService.login(memberMap);
        if(member != null){
            session.setAttribute("member",member);
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg",member != null);
        return jsonObject.toJSONString();
    }

}
