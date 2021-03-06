<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>结算页面</title>

    <link href="static/css/amazeui.css" rel="stylesheet" type="text/css" />

    <link href="static/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="static/css/cartstyle.css" rel="stylesheet" type="text/css" />

    <link href="static/css/jsstyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/address.js"></script>

</head>

<body>

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
                <a href="../../register.jsp" target="_top">免费注册</a>
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
            <div class="menu-hd"><a href="brand" target="_top" class="h">商城首页</a></div>
        </div>
        <div class="topMessage my-shangcheng">
            <div class="menu-hd MyShangcheng"><a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
        </div>
        <div class="topMessage mini-cart">
            <div class="menu-hd"><a id="mc-menu-hd" href="queryCart" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
        </div>
        <div class="topMessage favorite">
            <div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
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
<div class="concent">
    <!--地址 -->
    <div class="paycont">
        <div class="address">
            <h3>确认收货地址 </h3>
            <div class="control">
                <div class="tc-btn createAddr theme-login am-btn am-btn-danger">使用新地址</div>
            </div>
            <div class="clear"></div>
            <ul>
                <div class="per-border"></div>
                <li class="user-addresslist defaultAddr">

                    <div class="address-left">
                        <div class="user DefaultAddr">

										<span class="buy-address-detail">
                   <span class="buy-user">艾迪 </span>
										<span class="buy-phone">15871145629</span>
										</span>
                        </div>
                        <div class="default-address DefaultAddr">
                            <span class="buy-line-title buy-line-title-type">收货地址：</span>
                            <span class="buy--address-detail">
								   <span class="province">湖北</span>省
										<span class="city">武汉</span>市
										<span class="dist">洪山</span>区
										<span class="street">雄楚大道666号(中南财经政法大学)</span>
										</span>

                            </span>
                        </div>
                        <ins class="deftip">默认地址</ins>
                    </div>
                    <div class="address-right">
                        <a href="../person/address.html">
                            <span class="am-icon-angle-right am-icon-lg"></span></a>
                    </div>
                    <div class="clear"></div>

                    <div class="new-addr-btn">
                        <a href="#" class="hidden">设为默认</a>
                        <span class="new-addr-bar hidden">|</span>
                        <a href="#">编辑</a>
                        <span class="new-addr-bar">|</span>
                        <a href="javascript:void(0);" onclick="delClick(this);">删除</a>
                    </div>

                </li>
                <div class="per-border"></div>
                <li class="user-addresslist">
                    <div class="address-left">
                        <div class="user DefaultAddr">

										<span class="buy-address-detail">
                   <span class="buy-user">艾迪 </span>
										<span class="buy-phone">15871145629</span>
										</span>
                        </div>
                        <div class="default-address DefaultAddr">
                            <span class="buy-line-title buy-line-title-type">收货地址：</span>
                            <span class="buy--address-detail">
								   <span class="province">湖北</span>省
										<span class="city">武汉</span>市
										<span class="dist">武昌</span>区
										<span class="street">东湖路75号众环大厦2栋9层902</span>
										</span>

                            </span>
                        </div>
                        <ins class="deftip hidden">默认地址</ins>
                    </div>
                    <div class="address-right">
                        <span class="am-icon-angle-right am-icon-lg"></span>
                    </div>
                    <div class="clear"></div>

                    <div class="new-addr-btn">
                        <a href="#">设为默认</a>
                        <span class="new-addr-bar">|</span>
                        <a href="#">编辑</a>
                        <span class="new-addr-bar">|</span>
                        <a href="javascript:void(0);"  onclick="delClick(this);">删除</a>
                    </div>

                </li>

            </ul>

            <div class="clear"></div>
        </div>
        <!--物流 -->
        <div class="logistics">
        </div>
        <div class="clear"></div>

        <!--支付方式-->
        <div class="logistics">
            <%--<h3>选择支付方式</h3>--%>
        </div>
        <div class="clear"></div>

        <!--订单 -->
        <div class="concent">
            <div id="payTable">
                <h3>确认订单信息</h3>
                <div class="cart-table-th">
                    <div class="wp">
                        <div class="th th-item">
                            <div class="td-inner">商品信息</div>
                        </div>
                        <div class="th th-price">
                            <div class="td-inner">单价</div>
                        </div>
                        <div class="th th-amount">
                            <div class="td-inner">数量</div>
                        </div>
                        <div class="th th-sum">
                            <div class="td-inner">金额</div>
                        </div>
                        <div class="th th-oplist">
                            <div class="td-inner">
                                支付订单
                            </div>
                        </div>
                    </div>
                </div>
                <%--<tr class="item-list">
                    <div class="bundle  bundle-last">
                        <div class="bundle-main">
                            <ul class="item-content clearfix">
                                <div class="pay-phone">
                                    <c:forEach items="${requestScope.show}" var="sw">
                                    <li class="td td-item">
                                        <div class="item-pic">
                                            <a href="goods?goodsId=${sw.goods_id}" class="J_MakePoint">
                                                <img src="${sw.img_src}" class="itempic J_ItemImg"></a>
                                        </div>
                                        <div class="item-info">
                                            <div class="item-basic-info">
                                                <a href="goods?goodsId=${sw.goods_id}" class="item-title J_MakePoint" data-point="tbcart.8.11">${sw.s_comments}</a>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="td td-info">
                                        <div class="item-props">
                                        </div>
                                    </li>
                                    <li class="td td-price">
                                        <div class="item-price price-promo-promo">
                                            <div class="price-content">
                                                <em class="J_Price price-now">${sw.price}</em>
                                            </div>
                                        </div>
                                    </li>
                                <li class="td td-amount">
                                    <div class="amount-wrapper ">
                                        <div class="item-amount ">
                                            <span class="phone-title">购买数量</span>
                                            <div class="sl">
                                                <input class="text_box" name="" type="text" value="${sw.count}" style="width:30px;" />
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="td td-sum">
                                    <div class="td-inner">
                                        <em tabindex="0" class="J_ItemSum number">${sw.(price*count)}</em>
                                    </div>
                                </li>
                                <li class="td td-oplist">
                                    <div class="td-inner">
                                        <span class="phone-title">配送方式</span>
                                        <div class="pay-logis">
                                            快递<b class="sys_item_freprice">10</b>元
                                        </div>
                                    </div>
                                </li>
                                </c:forEach>
                            </ul>
                        </div></div> </tr>
                            <div class="clear"></div>--%>

                <c:forEach items="${requestScope.show}" var="sw">
                    <div class="bundle  bundle-last">
                        <div class="bundle-main">
                            <ul class="item-content clearfix">
                                <div class="pay-phone">
                                    <li class="td td-item">
                                        <div class="item-pic">
                                            <a href="goods?goodsId=${sw.goods_id}" class="J_MakePoint"> <img src="${sw.img_src}" class="itempic J_ItemImg" /></a>
                                        </div>
                                        <div class="item-info">
                                            <div class="item-basic-info">
                                                <a href="goods?goodsId=${sw.goods_id}" class="item-title J_MakePoint" data-point="tbcart.8.11">${sw.s_comments}</a>
                                            </div>
                                        </div> </li>
                                    <li class="td td-info">
                                        <div class="item-props">
                                        </div> </li>
                                    <li class="td td-price">
                                        <div class="item-price price-promo-promo">
                                            <div class="price-content">
                                                <em class="J_Price price-now">${sw.price}</em>
                                            </div>
                                        </div> </li>
                                </div>
                                <li class="td td-amount">
                                    <div class="amount-wrapper ">
                                        <div class="item-amount ">
                                            <span class="phone-title">购买数量</span>
                                            <div class="sl">
                                                <%--<input class="min am-btn" name="" type="button" value="-" />--%>
                                                <p>${sw.count}</p>
                                                <%--<input class="text_box" name="" type="text" value="3" style="width:30px;" />--%>
                                                <%--<input class="add am-btn" name="" type="button" value="+" />--%>
                                            </div>
                                        </div>
                                    </div> </li>
                                <li class="td td-sum">
                                    <div class="td-inner">
                                        <em tabindex="0" class="J_ItemSum number">${sw.pc}</em>
                                    </div> </li>
                                <li class="td td-oplist">
                                    <div class="td-inner">
                                        <span class="phone-title">支付</span>
                                        <div class="pay-logis">
                                            <a href="payone?gid=${sw.goods_id}&orderid=${sw.so.id}">支付订单</a>
                                            <%--<b class="sys_item_freprice">10</b>元--%>
                                        </div>
                                    </div> </li>
                            </ul>
                            <div class="clear"></div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </c:forEach>



                <%--<div class="clear"></div>--%>
            </div>
        </div>
        <div class="clear"></div>
        <div class="pay-total">
            <!--留言-->
            <div class="order-extra">
                <div class="order-user-info">
                    <div id="holyshit257" class="memo">
                      <div class="msg hidden J-msg">
                            <p class="error">最多输入500个字符</p>
                        </div>
                    </div>
                </div>
            </div>
            <!--优惠券 -->
            <div class="buy-agio">

                <li class="td td-bonus">

                </li>

            </div>
            <div class="clear"></div>
        </div>
        <!--信息 -->
        <div class="order-go clearfix">
            <div class="pay-confirm clearfix">
                <div class="box">
                   <%-- <div tabindex="0" id="holyshit267" class="realPay"><em class="t">实付款：</em>
                        <span class="price g_price ">
                                    <span>¥</span> <em class="style-large-bold-red " id="J_ActualFee"><%=request.getAttribute("sum")%></em>
											</span>
                    </div>--%>

                    <div id="holyshit268" class="pay-address">

                        <p class="buy-footer-address">
                            <span class="buy-line-title buy-line-title-type">寄送至：</span>
                            <span class="buy--address-detail">
								   <span class="province">湖北</span>省
												<span class="city">武汉</span>市
												<span class="dist">洪山</span>区
												<span class="street">雄楚大道666号(中南财经政法大学)</span>
												</span>
                            </span>
                        </p>
                        <p class="buy-footer-address">
                            <span class="buy-line-title">收货人：</span>
                            <span class="buy-address-detail">
                                         <span class="buy-user"><%=session.getAttribute("uname")%></span>
												<span class="buy-phone"><%=session.getAttribute("tel")%></span>
												</span>
                        </p>
                    </div>
                </div>

                <div id="holyshit269" class="submitOrder">
                    <div class="go-btn-wrap">
                        <a  href="payall" id="" href="" class="btn-go" tabindex="0" title="点击此按钮，支付所有">支付所有</a>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>

    <div class="clear"></div>
</div>
</div>
<div class="footer">
    <div class="footer-hd">
        <p>
            <a href="#">恒望科技</a>
            <b>|</b>
            <a href="brand">商城首页</a>
            <b>|</b>
            <a href="#">支付宝</a>
            <b>|</b>
            <a href="#">物流</a>
        </p>
    </div>
</div>
</div>
<div class="theme-popover-mask"></div>
<div class="theme-popover">

    <!--标题 -->
    <div class="am-cf am-padding">
        <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add address</small></div>
    </div>
    <hr/>

    <div class="am-u-md-12">
        <form class="am-form am-form-horizontal">

            <div class="am-form-group">
                <label for="user-name" class="am-form-label">收货人</label>
                <div class="am-form-content">
                    <input type="text" id="user-name" placeholder="收货人">
                </div>
            </div>

            <div class="am-form-group">
                <label for="user-phone" class="am-form-label">手机号码</label>
                <div class="am-form-content">
                    <input id="user-phone" placeholder="手机号必填" type="email">
                </div>
            </div>

            <div class="am-form-group">
                <label for="user-phone" class="am-form-label">所在地</label>
                <div class="am-form-content address">
                    <select data-am-selected>
                        <option value="a">浙江省</option>
                        <option value="b">湖北省</option>
                    </select>
                    <select data-am-selected>
                        <option value="a">温州市</option>
                        <option value="b">武汉市</option>
                    </select>
                    <select data-am-selected>
                        <option value="a">瑞安区</option>
                        <option value="b">洪山区</option>
                    </select>
                </div>
            </div>

            <div class="am-form-group">
                <label for="user-intro" class="am-form-label">详细地址</label>
                <div class="am-form-content">
                    <textarea class="" rows="3" id="user-intro" placeholder="输入详细地址"></textarea>
                    <small>100字以内写出你的详细地址...</small>
                </div>
            </div>

            <div class="am-form-group theme-poptit">
                <div class="am-u-sm-9 am-u-sm-push-3">
                    <div class="am-btn am-btn-danger">保存</div>
                    <div class="am-btn am-btn-danger close">取消</div>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="clear"></div>
</body>

</html>