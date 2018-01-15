
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>注册</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="stylesheet" href="static/css/amazeui.min.css" />
    <link href="static/css/dlstyle.css" rel="stylesheet" type="text/css">
    <script src="static/js/jquery.min.js"></script>
    <script src="static/js/amazeui.min.js"></script>
    <script src="jquery-1.8.3.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("input[name='username']").blur(function () {
                //
                $.ajax({
                    //
                    url:"username",
                    //
                    type:"POST",
                    //
                    data:{
                        username:$(this).val()
                    },
                    //
                    success:function (result) {
                        console.log("success");
                        console.log(result);
                        $("span").text(result.msg)
                    },
                    //
                    error:function (result) {
                        console.log("error");
                        console.log(result);
                        $("span").text(result.msg)
                    }
                });
            });
            $("input[id='phone']").blur(function () {
                //
                $.ajax({
                    //
                    url:"tel",
                    //
                    type:"POST",
                    //
                    data:{
                        tel:$(this).val()
                    },
                    //
                    success:function (result) {
                        console.log("success");
                        console.log(result);
                        $("span").text(result.msg)
                    },
                    //
                    error:function (result) {
                        console.log("error");
                        console.log(result);
                        $("span").text(result.msg)
                    }
                });
            });
        });
    </script>

</head>

<body>

<div class="login-boxtitle">
    <a href="#"><img alt="" src="static/images/logobig.png" /></a>
</div>

<div class="res-banner">
    <div class="res-main">
        <div class="login-banner-bg"><span></span><img src="static/images/big.jpg" /></div>
        <div class="login-box">

            <div class="am-tabs" id="doc-my-tabs">
                <ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
                    <li><a href="">用户注册</a></li>
                </ul>
                <div class="am-tabs-bd">
                    <div class="am-tab-panel">
                        <form method="post" action="register">
                            <div class="user-phone">
                                <label for="phone"><i class="am-icon-mobile-phone am-icon-md"></i></label>
                                <input type="tel" name="tel" id="phone" placeholder="请输入手机号"/>
                            </div>
                            <div class="verification">
                                <label for="code"><i class="am-icon-code-fork"></i></label>
                                <input type="text" name="name" id="code" placeholder="请输入用户名"/>
                            </div>
                            <div class="user-pass">
                                <label for="password"><i class="am-icon-lock"></i></label>
                                <input type="password" name="password" id="password" placeholder="设置密码"/>
                            </div>
                            <div class="user-pass">
                                <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
                                <input type="text" name="email" id="passwordRepeat" placeholder="设置邮箱"/>
                            </div>
                            <div class="am-cf">
                                <input type="submit" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
                            </div>
                        </form>
                      <%--  <div class="login-links">
                            <label for="reader-me">
                                <input id="reader-me" type="checkbox"> 点击表示您同意商城《服务协议》
                            </label>
                        </div>--%>

                        <hr>
                    </div>

                    <script>
                        $(function() {
                            $('#doc-my-tabs').tabs();
                        })
                    </script>

                </div>
            </div>

        </div>
    </div>

</div>
</body>

</html>
