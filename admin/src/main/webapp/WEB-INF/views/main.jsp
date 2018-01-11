<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="com.hwua.ssm.po.Auth" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2017/12/19
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
  <%@include file="common.jsp"%>
    <script type="text/javascript">
        function alert5(){
            $.messager.alert('修改失败','两次密码不一致','warning');
        }
        function alert6(){
            $.messager.alert('修改失败','原始密码不正确','warning');
        }
        function resetPassword() {
            $("#password-Window").window({
                modal: true,//灰色的隔层
                closed: true,//是否可以关闭
                iconCls: 'icon-edit',//图标
                width: 300,
                height: 400,
                title: '密码修改窗口',
                collapsible: false,//折叠
                minimizable: false,//最小化
                maximizable: false,//最大化
                resizable: false,//拉伸
                //关闭窗口时重置表单
                onBeforeClose: function () {
                    //清空表单
                    $("#userForm").form("reset");

                },
                onBeforeOpen:function () {
                    $(this).show()
                }
            }).window("open");
        }
        function submitForm(){
            //ajax提交表单
            //1.准备请求参数
            //3个密码都需要提交
            var ps = $("#ps").val();
            var password1 = $("#pass").val();
            var password = $("#newpass").val();
            var password2 = $("#pass2").val();
            console.log(ps+password1+password+password2);
            if(ps != password1){
                alert6();
            }else {
                if (password != password2) {
                    alert5();
                } else {
                    var formData = $("#userForm").form().serialize();
                    console.log(formData);
                    $.ajax({
                        url: path + '/user/resetPassword',
                        method: 'post',
                        data: formData,
                        success: function (res) {
                            if (res.msg) {
                                //成功
                                $("#userWindow").window("close");
                                $("#user-datagrid").datagrid("reload");
                            }
                        },
                        error: function (res) {

                        }
                    });
                }
            }
        }

     /*   $(function () {
//            来自数据库的数据
            var treeData=[{
                "id":1,
                "text":"权限管理",
                "children":[{
                    "id":11,
                    "text":"权限管理",
                    "url":"auth/toMain"
                },{
                    "id":12,
                    "text":"角色管理",
                    "url":"role/toRole",
                    },{
                        "id":13,
                        "text":"用户管理",
                        "url":"user/toUser"
                    }]
                }]*/
/*
            $("#my-tree").tree({
                data:treeData
            })*/

    </script>
</head>
<%

%>
<body class="easyui-layout">
    <div data-options="region:'north',border:false" style="height:69px;padding:2px;overflow: hidden">
        <h1 style="float: left">PACTERA 人力资源管理系统</h1>
        <div style="float:right;">
            <h3 style="float: left">&nbsp;欢迎您&nbsp;</h3>
            <h3 style="float: left;"><a href="#" onclick="resetPassword()" style="text-decoration: none">&nbsp;${sessionScope.user.userName}&nbsp;</a></h3>
            <h3 style="float: left"><a href="user/logout" style="text-decoration: none">&nbsp;退出登录&nbsp;</a></h3>
        </div>
        <div id="password-Window"  style="padding:10px;display: none">
            <form id="userForm" method="post">

                <input type="hidden" id="dbid" name="dbid" value="${sessionScope.user.dbid}"/>
                <input type="hidden" id="ps" name="ps" value="${sessionScope.user.password}"/>
                <div style="margin-bottom:20px">
                    <input class="easyui-passwordbox" id="pass"  name="password1"  style="width:100%" data-options="label:'原始密码:'">
                </div>
                <div style="margin-bottom:20px">
                    <input class="easyui-passwordbox" id="newpass"  name="password" style="width:100%" data-options="label:'新密码:'">
                </div>
                <div style="margin-bottom:20px">
                    <input class="easyui-passwordbox" id="pass2"   name="password2" style="width:100%" data-options="label:'确认密码:'">
                </div>
            </form>
            <%--</div>--%>
            <br><br>
            <div style="text-align:center;padding:5px 0">
                <a href="javascript:void(0)" data-options="iconCls:'icon-ok'" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">提交</a>
                <a href="javascript:void(0)" data-options="iconCls:'icon-cancel'" class="easyui-linkbutton" onclick="closeForm()" style="width:80px">关闭</a>
            </div>
        </div>
    </div>
    <div data-options="region:'west',split:false,title:'功能模块'" style="width:180px;padding:0px;">
        <div class="easyui-accordion" data-options="fit:true">
          <c:forEach items="${sessionScope.auths}" var="auth" >
              <c:set value="${auth}" var="auth"/>
              <div title="${auth.authName}">
                  <ul id="tree-${auth.dbid}"></ul>
                  <script type="text/javascript">
                      <%
                      Auth auth = (Auth)pageContext.getAttribute("auth");
                    String json = JSON.toJSONString(auth.getChildren());
                      pageContext.setAttribute("json",json);
                      /*
                      * 字符串-》js对象
                      * js对象-》字符串
                      * */
                      %>
                      var treeData ='${json}';
                      treeData = JSON.parse(treeData);
                      $("#tree-${auth.dbid}").tree({
                          data:treeData,
                          onClick:function(node) {
//                    console.log(!node.children)
                              if(node.children.length == 0){
                                  if($("#main-tab").tabs("exists",node.text)){
                                      //说明tab中已有此标签
                                      $("#main-tab").tabs("select",node.text);

                                  }else{
                                      //打开页面
                                      $("#main-tab").tabs("add",{
                                          title:node.text,
                                          content:"<iframe width='100%' height='100%' frameborder='0' src="+path+node.authURL+"/>",
                                          closable:true
                                      });
                                  }
                              }
                          }
                      });
                  </script>
              </div>
          </c:forEach>
        </div>
    </div>
    <div data-options="region:'center',title:'业务面板'" >
        <div id="main-tab" class="easyui-tabs" data-options="fit:true" >
    </div>
    </div>
</body>
</html>

