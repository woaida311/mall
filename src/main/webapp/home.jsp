<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.hwua.shop.biz.impl.GoodsBizImpl" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>首页</title>

    <link href="static/css/amazeui.css" rel="stylesheet" type="text/css" />
    <link href="static/css/admin.css" rel="stylesheet" type="text/css" />

    <link href="static/css/demo.css" rel="stylesheet" type="text/css" />

    <link href="static/css/hmstyle.css" rel="stylesheet" type="text/css" />
    <script src="static/js/jquery.min.js"></script>
    <script src="static/js/amazeui.min.js"></script>

</head>

<body>
<div class="hmtop">
    <!--顶部导航条 -->
    <div class="am-container header">
        <ul class="message-l">
            <div class="topMessage">
                <div class="menu-hd">
                    <%
                        String username = (String)session.getAttribute("username");
                        if(username==null){
                    %>
                    <a href="login.jsp" target="_top" class="h">亲，请登录</a>
                    <a href="register.jsp" target="_top">免费注册</a>
                    <%
                        }else{
                    %>
                    <a href="#" target="_top" class="h">欢迎<%=username%></a>
                    <a href="loginout" target="_top">注销</a>
                    <%
                        }
                    %>
                </div>
            </div>
        </ul>
        <ul class="message-r">
            <div class="topMessage home">
                <div class="menu-hd"><a href="#" target="_top" class="h">商城首页</a></div>
            </div>
            <div class="topMessage my-shangcheng">
          <%--      <div class="menu-hd MyShangcheng"><a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
           --%> </div>
            <div class="topMessage mini-cart">
                <div class="menu-hd"><a id="mc-menu-hd" href="pay.jsp" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>去结算</span><strong id="J_MiniCartNum" class="h"></strong></a></div>
            </div>
            <div class="topMessage favorite">
                <div class="menu-hd"><a href="#" target="_top">
                    <i class="am-icon-heart am-icon-fw"></i>
                    <span>收藏夹</span>
                </a></div>
            </div></ul>
    </div>

    <!--悬浮搜索框-->

    <div class="nav white">
        <div class="logo"><img src="static/img/logo.png" /></div>
        <div class="logoBig">
            <li><img src="static/img/logobig.png" /></li>
        </div>

        <div class="search-bar pr">
            <a name="index_none_header_sysc" href="#"></a>
            <form>
                <input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
                <input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
            </form>
        </div>
    </div>

    <div class="clear"></div>
</div>


<div class="banner">
    <!--轮播 -->
    <div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
        <ul class="am-slides">
            <li class="banner1"><a href="goods?goodsId=1"><img src="static/img/ad1.jpg" /></a></li>
            <li class="banner2"><a href="goods?goodsId=2"><img src="static/img/ad2.jpg" /></a></li>
            <li class="banner3"><a href="goods?goodsId=3"><img src="static/img/ad3.jpg" /></a></li>
            <li class="banner4"><a href="goods?goodsId=4"><img src="static/img/ad4.jpg" /></a></li>

        </ul>
    </div>
    <div class="clear"></div>
</div>

<div class="shopNav">
    <div class="slideall">

        <div class="long-title"><span class="all-goods">全部分类</span></div>
        <div class="nav-cont">
            <ul>
                <li class="index"><a href="#">首页</a></li>
                <li class="qc"><a href="#">闪购</a></li>
                <li class="qc"><a href="#">限时抢</a></li>
                <li class="qc"><a href="#">团购</a></li>
                <li class="qc last"><a href="#">大包装</a></li>
            </ul>
            <%--<div class="nav-extra">
                <i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
                <i class="am-icon-angle-right" style="padding-left: 10px;"></i>
            </div>--%>
        </div>

        <!--侧边导航 -->
        <div id="nav" class="navfull">
            <div class="area clearfix">
                <div class="category-content" id="guide_2">

                    <div class="category">
                        <ul class="category-list" id="js_climit_li">
                            <c:forEach items="${requestScope.brandgoods}" var="bg">
                            <li class="appliance js_toggle relative first">
                                <div class="category-info">
                                    <h3 class="category-name b-category-name"><i><img src="static/img/cake.png"></i><a class="ml-22" title="点心">${bg.brand.name}</a></h3>
                                    <em>&gt;</em></div>
                                <div class="menu-item menu-in top">
                                    <div class="area-in">
                                        <div class="area-bg">
                                            <div class="menu-srot">
                                                <div class="sort-side">
                                                    <dl class="dl-sort">
                                                        <dt><span title="${bg.brand.name}">${bg.brand.name}</span></dt>
                                                        <c:forEach  items="${bg.goods}" var="good">
                                                            <dd><a title="${good.name}" href="goods?goodsId=${good.id}"><span>${good.name}</span></a></dd>
                                                        </c:forEach>
                                                    </dl>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <b class="arrow"></b>
                                </div>
                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
        <!--轮播 -->
        <script type="text/javascript">
            (function() {
                $('.am-slider').flexslider();
            });
            $(document).ready(function() {
                $("li").hover(function() {
                    $(".category-content .category-list li.first .menu-in").css("display", "none");
                    $(".category-content .category-list li.first").removeClass("hover");
                    $(this).addClass("hover");
                    $(this).children("div.menu-in").css("display", "block")
                }, function() {
                    $(this).removeClass("hover")
                    $(this).children("div.menu-in").css("display", "none")
                });
            })
        </script>
        <!--小导航 -->
        <div class="am-g am-g-fixed smallnav">
            <div class="am-u-sm-3">
                <a href="sort.html"><img src="static/img/navsmall.jpg" />
                    <div class="title">商品分类</div>
                </a>
            </div>
            <div class="am-u-sm-3">
                <a href="#"><img src="static/img/huismall.jpg" />
                    <div class="title">大聚惠</div>
                </a>
            </div>
            <div class="am-u-sm-3">
                <a href="#"><img src="static/img/mansmall.jpg" />
                    <div class="title">个人中心</div>
                </a>
            </div>
            <div class="am-u-sm-3">
                <a href="#"><img src="static/img/moneysmall.jpg" />
                    <div class="title">投资理财</div>
                </a>
            </div>
        </div>

        <!--走马灯 -->

        <div class="marqueen">
            <%--<span class="marqueen-title">商城头条</span>--%>
            <div class="demo">
                    <div class="mod-vip">
                        <div class="m-baseinfo">
                                <img src="static/img/getAvatar.do.jpg">
                            </a>
                        </div>
                        <div class="member-logout">
                            <a class="am-btn-warning btn" href="login.jsp">登录</a>
                            <a class="am-btn-warning btn" href="register.jsp">注册</a>
                        </div>
                        <div class="member-login">
                            <a href="#"><strong>0</strong>待收货</a>
                            <a href="#"><strong>0</strong>待发货</a>
                            <a href="#"><strong>0</strong>待付款</a>
                            <a href="#"><strong>0</strong>待评价</a>
                        </div>
                        <div class="clear"></div>
                    </div>
                </ul>
                <div class="advTip"><img src="static/img/advTip.jpg"/></div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <script type="text/javascript">
        if ($(window).width() < 640) {
            function autoScroll(obj) {
                $(obj).find("ul").animate({
                    marginTop: "-39px"
                }, 500, function() {
                    $(this).css({
                        marginTop: "0px"
                    }).find("li:first").appendTo(this);
                })
            }
            $(function() {
                setInterval('autoScroll(".demo")', 3000);
            })
        }
    </script>
</div>
<div class="shopMainbg">
    <div class="shopMain" id="shopmain">

        <!--今日推荐 -->

        <div class="am-g am-g-fixed recommendation">
            <div class="clock am-u-sm-3" ">
            <img src="static/img/2016.png "></img>
            <p>今日<br>推荐</p>
        </div>
        <div class="am-u-sm-4 am-u-lg-3 ">
            <div class="info ">
                <h3>真的有鱼</h3>
                <h4>开年福利篇</h4>
            </div>
            <div class="recommendationMain ">
                <img src="static/img/tj.png "></img>
            </div>
        </div>
        <div class="am-u-sm-4 am-u-lg-3 ">
            <div class="info ">
                <h3>囤货过冬</h3>
                <h4>让爱早回家</h4>
            </div>
            <div class="recommendationMain ">
                <img src="static/img/tj1.png "></img>
            </div>
        </div>
        <div class="am-u-sm-4 am-u-lg-3 ">
            <div class="info ">
                <h3>浪漫情人节</h3>
                <h4>甜甜蜜蜜</h4>
            </div>
            <div class="recommendationMain ">
                <img src="static/img/tj2.png "></img>
            </div>
        </div>

    </div>
    <div class="clear "></div>
    <!--热门活动 -->

    <div class="am-container activity ">
        <div class="shopTitle ">
            <h4>活动</h4>
            <h3>每期活动 优惠享不停 </h3>
            <span class="more ">
                              <a class="more-link " href="# ">全部活动</a>
                            </span>
        </div>

        <div class="am-g am-g-fixed ">
            <div class="am-u-sm-3 ">
                <div class="icon-sale one "></div>
                <h4>秒杀</h4>
                <div class="activityMain ">
                    <img src="static/img/activity1.jpg "></img>
                </div>
                <div class="info ">
                    <h3>春节送礼优选</h3>
                </div>
            </div>

            <div class="am-u-sm-3 ">
                <div class="icon-sale two "></div>
                <h4>特惠</h4>
                <div class="activityMain ">
                    <img src="static/img/activity2.jpg "></img>
                </div>
                <div class="info ">
                    <h3>春节送礼优选</h3>
                </div>
            </div>

            <div class="am-u-sm-3 ">
                <div class="icon-sale three "></div>
                <h4>团购</h4>
                <div class="activityMain ">
                    <img src="static/img/activity3.jpg "></img>
                </div>
                <div class="info ">
                    <h3>春节送礼优选</h3>
                </div>
            </div>

            <div class="am-u-sm-3 last ">
                <div class="icon-sale "></div>
                <h4>超值</h4>
                <div class="activityMain ">
                    <img src="static/img/activity.jpg "></img>
                </div>
                <div class="info ">
                    <h3>春节送礼优选</h3>
                </div>
            </div>

        </div>
    </div>
    <div class="clear "></div>

    <!--甜点-->

    <div class="am-container ">
        <div class="shopTitle ">
            <h4>甜品</h4>
            <h3>每一道甜品都有一个故事</h3>
        </div>
    </div>

    <div class="am-g am-g-fixed floodOne ">
        <div class="am-u-sm-5 am-u-md-3 am-u-lg-4 text-one ">
            <a href="# ">
                <div class="outer-con ">
                    <div class="title ">
                        零食大礼包开抢啦
                    </div>
                    <div class="sub-title ">
                        当小鱼儿恋上软豆腐
                    </div>
                </div>
                <img src="static/img/act1.png " />
            </a>
        </div>
        <div class="am-u-sm-7 am-u-md-5 am-u-lg-4">
            <div class="text-two">
                <div class="outer-con ">
                    <div class="title ">
                        雪之恋和风大福
                    </div>
                    <div class="sub-title ">
                        仅售：¥13.8
                    </div>

                </div>
                <a href="# "><img src="static/img/act2.png " /></a>
            </div>
            <div class="text-two last">
                <div class="outer-con ">
                    <div class="title ">
                        雪之恋和风大福
                    </div>
                    <div class="sub-title ">
                        仅售：¥13.8
                    </div>

                </div>
                <a href="# "><img src="static/img/act2.png " /></a>
            </div>
        </div>
        <div class="am-u-sm-12 am-u-md-4 ">
            <div class="am-u-sm-3 am-u-md-6 text-three">
                <div class="outer-con ">
                    <div class="title ">
                        小优布丁
                    </div>

                    <div class="sub-title ">
                        尝鲜价：¥4.8
                    </div>
                </div>
                <a href="# "><img src="static/img/act3.png " /></a>
            </div>

            <div class="am-u-sm-3 am-u-md-6 text-three">
                <div class="outer-con ">
                    <div class="title ">
                        小优布丁
                    </div>

                    <div class="sub-title ">
                        尝鲜价：¥4.8
                    </div>
                </div>
                <a href="# "><img src="static/img/act3.png " /></a>
            </div>

            <div class="am-u-sm-3 am-u-md-6 text-three">
                <div class="outer-con ">
                    <div class="title ">
                        小优布丁
                    </div>

                    <div class="sub-title ">
                        尝鲜价：¥4.8
                    </div>
                </div>
                <a href="# "><img src="static/img/act3.png " /></a>
            </div>

            <div class="am-u-sm-3 am-u-md-6 text-three last ">
                <div class="outer-con ">
                    <div class="title ">
                        小优布丁
                    </div>

                    <div class="sub-title ">
                        尝鲜价：¥4.8
                    </div>
                </div>
                <a href="# "><img src="static/img/act3.png " /></a>
            </div>
        </div>

    </div>
    <div class="clear "></div>
    <!--坚果-->
    <div class="am-container ">
        <div class="shopTitle ">
            <h4>坚果</h4>
            <h3>酥酥脆脆，回味无穷</h3>
        </div>
    </div>
    <div class="am-g am-g-fixed floodTwo ">


        <div class="am-u-sm-5 am-u-md-4 text-one ">
            <a href="# ">
                <img src="static/img/act1.png " />
                <div class="outer-con ">
                    <div class="title ">
                        零食大礼包开抢啦
                    </div>
                    <div class="sub-title ">
                        当小鱼儿恋上软豆腐
                    </div>

                </div>
            </a>
        </div>
        <div class="am-u-sm-7 am-u-md-4 am-u-lg-2 text-two">
            <div class="outer-con ">
                <div class="title ">
                    雪之恋和风大福
                </div>

                <div class="sub-title ">
                    仅售：¥13.8
                </div>
            </div>
            <a href="# "><img src="static/img/5.jpg " /></a>
        </div>

        <div class="am-u-md-4 am-u-lg-2 text-three">
            <div class="outer-con ">
                <div class="title ">
                    小优布丁
                </div>

                <div class="sub-title ">
                    尝鲜价：¥4.8
                </div>
            </div>
            <a href="# "><img src="static/img/act3.png " /></a>
        </div>
        <div class="am-u-md-4 am-u-lg-2 text-three">
            <div class="outer-con ">
                <div class="title ">
                    小优布丁
                </div>

                <div class="sub-title ">
                    尝鲜价：¥4.8
                </div>
            </div>
            <a href="# "><img src="static/img/act3.png " /></a>
        </div>
        <div class="am-u-sm-6 am-u-md-4 am-u-lg-2 text-two ">
            <div class="outer-con ">
                <div class="title ">
                    雪之恋和风大福
                </div>

                <div class="sub-title ">
                    仅售：¥13.8
                </div>
            </div>
            <a href="# "><img src="static/img/5.jpg " /></a>
        </div>
        <div class="am-u-sm-6 am-u-md-3 am-u-lg-2 text-four ">
            <div class="outer-con ">
                <div class="title ">
                    雪之恋和风大福
                </div>

                <div class="sub-title ">
                    仅售：¥13.8
                </div>
            </div>
            <a href="# "><img src="static/img/5.jpg " /></a>
        </div>
        <div class="am-u-sm-4 am-u-md-3 am-u-lg-4 text-five">
            <div class="outer-con ">
                <div class="title ">
                    小优布丁
                </div>
                <div class="sub-title ">
                    尝鲜价：¥4.8
                </div>

            </div>
            <a href="# "><img src="static/img/act2.png " /></a>
        </div>
        <div class="am-u-sm-4 am-u-md-3 am-u-lg-2 text-six">
            <div class="outer-con ">
                <div class="title ">
                    小优布丁
                </div>

                <div class="sub-title ">
                    尝鲜价：¥4.8
                </div>
            </div>
            <a href="# "><img src="static/img/act3.png " /></a>
        </div>
        <div class="am-u-sm-4 am-u-md-3 am-u-lg-4 text-five">
            <div class="outer-con ">
                <div class="title ">
                    小优布丁
                </div>
                <div class="sub-title ">
                    尝鲜价：¥4.8
                </div>

            </div>
            <a href="# "><img src="static/img/act2.png " /></a>
        </div>
    </div>

    <div class="clear "></div>



    <div class="am-container ">
        <div class="shopTitle ">
            <h4>新品/首发</h4>
            <h3>新品爆款首发</h3>
        </div>
    </div>
    <div class="am-g am-g-fixed flood method3 ">
        <ul class="am-thumbnails ">
            <c:forEach items="${requestScope.tengoods}" var="tg">
            <li>
                <div class="list ">
                    <a href="goods?goodsId=${tg.id}">
                        <img src="${tg.img_src}" />
                        <div class="pro-title ">${tg.name}</div>
                        <span class="e-price ">￥${tg.price}</span>
                    </a>
                </div>
            </li>
            </c:forEach>
        </ul>
    </div>

    <div class="footer ">
        <div class="footer-hd ">
            <p>
                <a href="# ">恒望科技</a>
                <b>|</b>
                <a href="# ">商城首页</a>
                <b>|</b>
                <a href="# ">支付宝</a>
                <b>|</b>
                <a href="# ">物流</a>
            </p>
        </div>
    </div>
</div>
</div>
</div>
</div>
<!--引导 -->

<div class="navCir">
    <li class="active"><a href="home3.html"><i class="am-icon-home "></i>首页</a></li>
    <li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
    <li><a href="queryCart"><i class="am-icon-shopping-basket"></i>购物车</a></li>
    <li><a href="../person/index.html"><i class="am-icon-user"></i>我的</a></li>
</div>
<!--菜单 -->
<div class=tip>
    <div id="sidebar">
        <div id="wrap">
            <div id="prof" class="item ">
                <a href="# ">
                    <span class="setting "></span>
                </a>
                <div class="ibar_login_box status_login ">
                    <div class="avatar_box ">
                        <p class="avatar_imgbox "><img src="static/img/no-img_mid_.jpg " /></p>
                        <ul class="user_info ">
                            <%
                            if(username==null){
                            %>
                            <li>用户名：游客</li>
                            <li>级&nbsp;别：游客</li>
                            <%
                            }else {
                            %>
                            <li>用户名：<%=username%></li>
                            <li>级&nbsp;别：普通会员</li>
                            <%
                            }
                            %>
                        </ul>
                    </div>
                    <div class="login_btnbox ">
                        <a href="shopcart.jsp" class="login_order ">我的订单</a>
                        <a href="shoucang.jsp" class="login_favorite ">我的收藏</a>
                    </div>
                    <i class="icon_arrow_white "></i>
                </div>

            </div>
            <div id="shopCart " class="item ">
                <a href="queryCart">
                    <span class="message "></span>
                </a>
                <p>
                    购物车
                </p>
               <%-- <%
                   List<Map<String,Object>> userCars =(List<Map<String, Object>>) request.getAttribute("userCars");
                    if(userCars==null || userCars.size()==0){
                %>--%>
             <%--   <p class="cart_num ">0</p>--%>
              <%--  <%
                    }else {
                %>
                <p class="cart_num "><%=userCars.size()%></p>
                <%
                    }
                %>--%>
            </div>
            <div id="asset " class="item ">
                <a href="# ">
                    <span class="view "></span>
                </a>
                <%--<div class="mp_tooltip ">
                    我的资产
                    <i class="icon_arrow_right_black "></i>
                </div>--%>
            </div>

            <div id="foot " class="item ">
                <a href="login.jsp">
                    <span class="zuji "></span>
                </a>
                <div class="mp_tooltip ">
                    我的足迹
                    <i class="icon_arrow_right_black "></i>
                </div>
            </div>

            <div id="brand " class="item ">
                <a href="shoucang.jsp">
                    <span class="wdsc "><img src="static/img/wdsc.png " /></span>
                </a>
                <div class="mp_tooltip ">
                    我的收藏
                    <i class="icon_arrow_right_black "></i>
                </div>
            </div>

            <div id="broadcast " class="item ">
            </div>

            <div class="quick_toggle ">
                <!--二维码 -->
                <li class="qtitem ">
                    <a href="#none "><span class="mpbtn_qrcode "></span></a>
                    <div class="mp_qrcode " style="display:none; "><img src="static/img/weixin_code_145.png " /><i class="icon_arrow_white "></i></div>
                </li>
                <li class="qtitem ">
                    <a href="#top " class="return_top "><span class="top "></span></a>
                </li>
            </div>

            <!--回到顶部 -->
            <div id="quick_links_pop " class="quick_links_pop hide "></div>

        </div>

    </div>
    <div id="prof-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>

        </div>
    </div>
    <div id="shopCart-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            购物车
        </div>
    </div>
    <div id="asset-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            资产
        </div>

        <div class="ia-head-list ">
            <a href="# " target="_blank " class="pl ">
                <div class="num ">0</div>
                <div class="text ">优惠券</div>
            </a>
            <a href="# " target="_blank " class="pl ">
                <div class="num ">0</div>
                <div class="text ">红包</div>
            </a>
            <a href="# " target="_blank " class="pl money ">
                <div class="num ">￥0</div>
                <div class="text ">余额</div>
            </a>
        </div>

    </div>
    <div id="foot-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            足迹
        </div>
    </div>
    <div id="brand-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            收藏
        </div>
    </div>
    <div id="broadcast-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            充值
        </div>
    </div>
</div>
<script type="text/javascript " src="static/js/quick_links.js "></script>
</body>

</html>
