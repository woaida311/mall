<%--
  Created by IntelliJ IDEA.
  User: hu
  Date: 2017/11/8
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>失败页面</title>
</head>
<body>
<%
    String href="";
    String str = "";
    String st = "";
    String error = request.getParameter("error");
    if(error != null){
        switch (error){
            case "login":
                str="用户名与密码不匹配";
                st="登录";
                href="login.jsp";
                break;
            case "register":
                str="注册失败";
                st="注册";
                href="register.jsp";
                break;
            case "pay":
                str="支付失败";
                st="支付";
                href="pay.jsp";
                break;
            case "shoucang":
                str="收藏失败";
                st="收藏";
                href="shoucang.jsp";
                break;
            case "xiadan":
                str="下单失败";
                st="下单";
                href = "introduction.jsp";
                break;
            case "nullUserName":
                str="用户名不存在";
                st="登录";
                href = "login.jsp";
        }
    }
%>
<h1><%=str%></h1>
<a href="home2.jsp">返回首页</a>
<a href="<%=href%>">重新<%=st%></a>
</body>
</html>
