<%--
  Created by IntelliJ IDEA.
  User: hu
  Date: 2017/12/25
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common.jsp"%>
<script type="text/javascript" src="${path}/static/js/user.js"></script>
<html>
<head>
    <title>User.jsp</title>
</head>
<body class="easyui-layout">
<%--<c:forEach items="${sessionScope.auths2}" var="auth">
    <c:if test="${auth.authURL} == '/user/toUser'">--%>
<div data-options="region:'north',border:false" style="height:60px;padding:10px">
    <input class="easyui-textbox"  id="userName" style="width:20%" data-options="prompt:'用户名'">&nbsp;&nbsp;&nbsp;&nbsp;
    <input class="easyui-textbox" id="realName" style="width:20%" data-options="prompt:'真实姓名'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <select class="easyui-combobox" id="valid" label="是否有效:" labelPosition="left" name="state" data-options="panelHeight:'70px',editable:false" style="width:20%">&nbsp;&nbsp;&nbsp;
        <option value="">全部</option>
        <option value="1">正常</option>
        <option value="0">冻结</option>
    </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <%--  <c:if test="${auth.authCode} == 'user_query'">--%>
        <a href="javascript:void(0)" data-options="iconCls:'icon-search',width:80" class="easyui-linkbutton" onclick="searchRole()" >搜索</a>
<%--    </c:if>--%>
        <a href="javascript:void(0)" data-options="iconCls:'icon-add',width:80" class="easyui-linkbutton" onclick="add('添加')" >添加</a>
</div>

<div data-options="region:'center'" >
    <table id="user-datagrid"> </table>
     <div id="userWindow"  style="padding:10px;display: none">
             <form id="userForm" method="post">
                 <input type="hidden" id="dbid" name="dbid"/>
                 <div style="margin-bottom:20px">
                     <input class="easyui-textbox" id="name" name="userName" style="width:100%" data-options="label:'用户名:'">
                 </div>
                 <div style="margin-bottom:20px">
                     <input class="easyui-textbox"  id="real" name="realName"  style="width:100%" data-options="label:'真实姓名:'">
                 </div>
                 <div style="margin-bottom:20px">
                     <input class="easyui-passwordbox" id="pass" id="password"  name="password" style="width:100%" data-options="label:'密码:'">
                 </div>
                 <div style="margin-bottom:20px">
                     <input class="easyui-passwordbox" id="pass2" id="password2"  name="password2" style="width:100%" data-options="label:'确认密码:'">
                 </div>
                 <div style="margin-bottom:20px">
                     <select class="easyui-combobox" data-options="panelHeight:'50px',editable:false"id="val" name="valid" label="是否有效" style="width:100%">
                         <option value="1" >正常</option>
                         <option value="2" >冻结</option>
                     </select>
                 </div>
             </form>
        <br><br>
        <div style="text-align:center;padding:5px 0">
            <a href="javascript:void(0)" data-options="iconCls:'icon-ok'" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">提交</a>
            <a href="javascript:void(0)" data-options="iconCls:'icon-cancel'" class="easyui-linkbutton" onclick="closeForm()" style="width:80px">关闭</a>
        </div>
    </div>
    <div id="grantWindow"  style="padding:10px;display: none">
        <input type="hidden" id="userId" name="userId">
        <ul id="grantuser2role" class="easyui-datagrid"></ul>
        <br><br>
        <div style="text-align:center;padding:5px 0">
            <a href="javascript:void(0)" data-options="iconCls:'icon-ok'" class="easyui-linkbutton" onclick="submitGrantForm()" style="width:80px">提交</a>
            <a href="javascript:void(0)" data-options="iconCls:'icon-cancel'" class="easyui-linkbutton" onclick="closeGrantForm()" style="width:80px">关闭</a>
        </div>
    </div>
</div>
<div style="margin:20px 0;">
    <a href="#" class="easyui-linkbutton" onclick="alert5()">Warning</a>
</div>
<%--    </c:if>
</c:forEach>--%>
</body>
</html>