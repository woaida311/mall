<%--
  Created by IntelliJ IDEA.
  User: hu
  Date: 2017/12/20
  Time: 9:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>auth.jsp</title>
    <%@include file="common.jsp"%>
   <script type="text/javascript" src="${path}/static/js/auth.js">
    </script>
</head>
<body>
<table id="auth-treegrid"></table>
<div id="mm" class="easyui-menu" style="width:120px;">
    <div onclick="addOrUpdate('添加')" data-options="iconCls:'icon-add'">增加子节点</div>
    <div onclick="addOrUpdate('修改')" data-options="iconCls:'icon-edit'">编辑</div>
    <div onclick="refreshAuth()" data-options="iconCls:'icon-reload'">刷新</div>
</div>
<div id="authWindow"  style="padding:10px;">
    <form id="authForm" method="post">
        <input type="hidden" id="dbid" name="dbid"/>
       <input type="hidden" id="parentId" name="parentId"/>
        <div style="margin-bottom:5px">
            <input class="easyui-textbox" id="parentName"  style="width:100%" data-options="label:'上级节点:',readonly:true">
        </div>
        <div style="margin-bottom:5px">
            <input class="easyui-textbox" id="layer" name="layer" style="width:100%" data-options="label:'当前层级:',readonly:true">
        </div>
        <div style="margin-bottom:5px">
            <input class="easyui-textbox" id="authName" name="authName" style="width:100%" data-options="label:'权限名称:',required:true">
        </div>
        <div style="margin-bottom:5px">
            <input class="easyui-textbox" id="authCode" name="authCode" style="width:100%;height:60px" data-options="label:'权限编码:'">
        </div>
        <div style="margin-bottom:5px">
            <input class="easyui-textbox" id="authURL" name="authURL" style="width:100%;height:60px" data-options="label:'URL:'">
        </div>
        <div style="margin-bottom:5px">
            <input class="easyui-textbox" id="orders" name="orders" style="width:100%;height:60px" data-options="label:'排序:'">
        </div>
        <div style="margin-bottom:20px">
            <select class="easyui-combobox" id="type" name="type" style="width:100%" data-options="label:'类型:',panelHeight:'50px',editable:false">
            <option value="1">模块</option>
            <option value="2">资源</option>
            </select>
        </div>
        <div style="margin-bottom:20px">
            <select class="easyui-combobox" id="valid" name="valid" style="width:100%"  data-options="label:'是否有效:',panelHeight:'50px',editable:false">
            <option value="1">有效</option>
            <option value="0">无效</option>
            </select>
        </div>
    </form>
    <div style="text-align:center;padding:5px 0">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" data-options="iconCls:'icon-ok'" style="width:80px">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" data-options="iconCls:'icon-cancel'" style="width:80px">关闭</a>
    </div>
</div>

</body>
</html>
