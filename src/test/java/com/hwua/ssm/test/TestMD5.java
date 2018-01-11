package com.hwua.ssm.test;

        import com.alibaba.fastjson.JSON;

        import com.hwua.ssm.dao.MemberMapper;
        import com.hwua.ssm.po.Member;
        import org.junit.Test;
        import org.springframework.context.ApplicationContext;
        import org.springframework.context.support.ClassPathXmlApplicationContext;
        import org.springframework.util.DigestUtils;

        import java.util.HashMap;
        import java.util.List;
        import java.util.Map;

public class TestMD5 {

    @Test
    public void testMD5(){
        //密码加密：MD5，MD5是不可逆的加密方式
        //为什么要对密码进行加密
        //s = e10adc3949ba59abbe56e057f20f883e
        /*
        要求：
        - 密码不允许明文存储到数据库
        - 经过MD5加密后进行存储
        - 登录时，将用户输入的密码加密后进行查询
         */
        String str = "123456";
        String s = DigestUtils.md5DigestAsHex(str.getBytes());
        System.out.println("s = " + s);
    }
    @Test
    public void testRegister(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        MemberMapper memberMapper = ctx.getBean(MemberMapper.class);
        Member member = new Member();
        member.setRealName("a");
        member.setName("a");
        member.setPassword("123");
        member.setTel("123456");
        member.setEmail("4.com");
        int register = memberMapper.register(member);
        System.out.println("register = " + register);
    }
    @Test
   public void testLogin(){
       ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
       MemberMapper memberMapper = ctx.getBean(MemberMapper.class);
       Map<String,String> memberMap = new HashMap<String, String>();
       memberMap.put("name","a");
       memberMap.put("password","123");
       Member member = memberMapper.doLogin(memberMap);
       System.out.println("member = " + member);
   }
   //测试账号或手机号已存在
   @Test
   public void testQueryMemberName(){
       ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
       MemberMapper memberMapper = ctx.getBean(MemberMapper.class);
       Member member = memberMapper.queryMemberName("a");
       Member member1 = memberMapper.queryTel("123456");
       System.out.println("member = " + member);
       System.out.println("member1 = " + member1);
   }
   //修改密码
   @Test
   public void testResetPassword(){
       ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
       MemberMapper memberMapper = ctx.getBean(MemberMapper.class);
       Member member = new Member();
       member.setMid(4);
       member.setTel("12345678");
       member.setPassword("12345678");
       int i = memberMapper.resetPassword(member);
       System.out.println("i = " + i);
   }
}
