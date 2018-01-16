package com.hwua.front.controller;

import com.hwua.common.po.Member;
import com.hwua.front.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
@SuppressWarnings("ALL")
@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;
    /*@RequestMapping("toMember")
    public String main(){
        return "member";
    }*/
    @RequestMapping(value = "/register",produces = "application/json;charset=UTF-8")
    public String register(Member member){
        System.out.println("member = " + member);
            //会员注册
            int i = memberService.addMember(member);
            if (i == 1) {
                // 注册成功 跳转到login.jsp
                return "redirect:login.jsp";
            } else {
                //注册失败跳转到 error.jsp
                return "error";
            }
    }
    @RequestMapping(value = "/login",produces = "application/json;charset=UTF-8")
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
        return "redirect:home.jsp";
    }

}
