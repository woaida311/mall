package com.hwua.common.dao;

import com.hwua.common.po.Member;

import java.util.Map;

public interface MemberMapper {
    /**
     * 注册时用来查询账号是否已经存在 登录时提示账户不存在
     * 用户名存在返回1 不能注册
     * 用户名不存在返回0 可以注册
     */
    public Member queryMemberName(String name);
    /**
     * 注册时用来判断手机号是否已经被使用
     * 手机号存在返回1 不能注册
     * 手机号不存在返回0 可以注册
     * */
    public Member queryTel(String tel);
    /**
     * 注册账号
     * */
    public int register(Member member);
    /**
     *登录
     */
    //判断帐号密码是否正确,帐号密码正确则查询出该用户的用户信息
    public Member doLogin(Map<String, String> memberMap);
   /* *
     * 根据用户的username获取用户的id
     *
    public Map<String,Object> queryUidByUserName(String name);*/

    //修改用户的密码
    public int resetPassword(Member member);
}
