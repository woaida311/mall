<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <%@ include file="/WEB-INF/views/common.jsp"%>
<%--    <link rel="stylesheet" type="text/css" href="${path}/static/css/style.css">--%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="Flat Dark Web Login Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />
    <link href="${path}/static/css/style.css" rel='stylesheet' type='text/css' />
    <script type="text/javascript">
        function loginSys() {
            //获取输入框中的用户名和密码
          var userName =   $("#userName").val();
            var password = $("#password").val();
            var formData = {
                userName:userName,
                password:password
            };
            $.ajax({
                url:path+"/user/login",
                method:"post",
                data:formData,
                success:function (res) {
                    if(res.msg){
                        location = path+"/main";
                    }else {
                        $.messager.alert('登陆失败','帐号密码不一致','error');
                    }
                }
            });
        }
    </script>
</head>
<body>
<h1>欢迎登陆</h1>
<div class="login-form">
    <div class="avtar">
        <img title="点击记住密码" src="static/imgs/avtar.png" />
    </div>
    <form method="post">
        <span style="color: white">用户名：</span><input id="userName" type="text" name="userName" value="" />
        <br/>
        <span style="color: white">密&nbsp;&nbsp;&nbsp;&nbsp;码：</span><input id="password" name="password" type="password" value=""/>
    </form>
    <div class="signin">
        <input type="button"  onclick="loginSys()" value="Login"/>
    </div>
</div>
</body>
</html>