<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head lang="en">
    <meta charset="UTF-8">
    <title>登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="stylesheet" href="static/css/amazeui.css" />
    <link href="static/css/dlstyle.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="login-boxtitle">
    <a href="home.jsp"><img alt="logo" src="static/img/logobig.png" /></a>
</div>
<div class="login-banner">
    <div class="login-main">
        <div class="login-banner-bg"><span></span><img src="static/img/big.jpg" /></div>
        <div class="login-box">
            <h3 class="title">登录商城</h3>
            <div class="clear"></div>
            <div class="login-form">
                <form action="login" method="post">
                    <div class="user-name">
                        <label for="user"><i class="am-icon-user"></i></label>
                        <input type="text" name="username" id="user" placeholder="用户名">
                    </div>
                    <div class="user-pass">
                        <label for="password"><i class="am-icon-lock"></i></label>
                        <input type="password" name="password" id="password" placeholder="请输入密码">
                    </div>
                    <div class="am-cf">
                        <input type="submit"  value="登 录" class="am-btn am-btn-primary am-btn-sm">
                    </div>
                </form>
            </div>
            <div class="login-links">
               <%-- <label for="remember-me"><input id="remember-me" type="checkbox">记住密码</label>
                <a href="#" class="am-fr">忘记密码</a>--%>
                <a href="register.jsp" class="zcnext am-fr am-btn-default">注册</a>
                <br />
            </div>

        </div>
    </div>
</div>
</body>

</html>
