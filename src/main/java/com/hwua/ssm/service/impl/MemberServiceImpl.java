package com.hwua.ssm.service.impl;

import com.hwua.ssm.dao.MemberMapper;
import com.hwua.ssm.po.Member;
import com.hwua.ssm.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;
@SuppressWarnings("ALL")
@Service("memberService")
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberMapper memberMapper;

    public int queryMemberName(String name) {
        Member member = memberMapper.queryMemberName(name);
        if (member != null){
            return 1;//账户名存在
        }
        return 0;
    }

    public int queryMemberTel(String tel) {
        Member member = memberMapper.queryTel(tel);
        if (member != null){
            return 1;//手机号存在存在
        }
        return 0;
    }

    public int addMember(Member member) {
        int register = memberMapper.register(member);
        if(register == 1){
            return 1;//注册成功
            }
        return 0;
    }

    public Member login(Map<String, String> memberMap) {
        return memberMapper.doLogin(memberMap);
    }

    public int updateMemberPassword(Member member) {
        return memberMapper.resetPassword(member);
    }
}
