package com.hwua.ssm.service;

import com.hwua.ssm.po.Member;

import java.util.Map;

public interface MemberService {
    //注册前查询用户名
public int queryMemberName(String name);
//查询电话号
    public int queryMemberTel(String tel);
    //注册
    public int addMember(Member member);

    //登录
    public Member login(Map<String,String> memberMap);

    //修改密码
    public int updateMemberPassword(Member member);
}
