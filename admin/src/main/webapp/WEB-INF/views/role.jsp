<%--
  Created by IntelliJ IDEA.
  User: hu
  Date: 2017/12/22
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common.jsp"%>
<script type="text/javascript" src="${path}/static/js/role.js"></script>
<html>
<head>
    <title>role.jsp</title>
</head>
<body class="easyui-layout">
<div data-options="region:'north',border:false" style="height:60px;padding:10px">
    <%--两个输入框，--%>
    <input class="easyui-textbox"  id="roleName" style="width:20%" data-options="prompt:'输入角色名称'">&nbsp;&nbsp;&nbsp;&nbsp;
    <input class="easyui-textbox" id="roleCode" style="width:20%" data-options="prompt:'输入角色编码'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <select class="easyui-combobox" id="valid" label="是否有效:" labelPosition="left" name="state" data-options="panelHeight:'70px',editable:false" style="width:20%">&nbsp;&nbsp;&nbsp;
        <option value="1">有效</option>
        <option value="0">无效</option>
    </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="javascript:void(0)" data-options="iconCls:'icon-search',width:80" class="easyui-linkbutton" onclick="searchRole()" >搜索</a>
    <a href="javascript:void(0)" data-options="iconCls:'icon-add',width:80" class="easyui-linkbutton" onclick="add('添加')" >添加</a>

</div>

<div data-options="region:'center'">
    <table id="role-datagrid">  </table>
    <div id="roleWindow"  style="padding:10px;">
        <div class="easyui-panel" style="width:100%;padding:30px 60px;" >
            <form id="roleForm" method="post">
                <input type="hidden" id="dbid" name="dbid"/>
                <div style="margin-bottom:20px">
                    <input class="easyui-textbox" id="rolN" name="roleName" style="width:100%" data-options="label:'角色名称:',required:true">
                </div>
                <div style="margin-bottom:20px">
                    <input class="easyui-textbox" id="rolC" name="roleCode"  style="width:100%" data-options="label:'角色编码:'">
                </div>
                <div style="margin-bottom:20px">
                    <input class="easyui-textbox" id="or" name="orders" idstyle="width:100%" data-options="label:'排序:'">
                </div>
                <div style="margin-bottom:20px">
                    <select class="easyui-combobox" id="val" data-options="panelHeight:'50px',editable:false" name="valid" label="是否有效" style="width:100%">
                        <option value="1" >有效</option>
                        <option value="0" >无效</option>
                    </select>
                </div>
            </form>
        </div>

        <br><br>
        <div style="text-align:center;padding:5px 0">
            <a href="javascript:void(0)" data-options="iconCls:'icon-ok'" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">提交</a>
            <a href="javascript:void(0)" data-options="iconCls:'icon-cancel'" class="easyui-linkbutton" onclick="closeForm()" style="width:80px">关闭</a>
        </div>
    </div>
    <div id="grant-Window"  style="padding:10px;">
        <input type="hidden" id="roleId"/>
        <ul id="tt" class="easyui-tree"></ul>
        <div style="text-align:center;padding:5px 0">
        <a href="javascript:void(0)" data-options="iconCls:'icon-ok'" class="easyui-linkbutton" onclick="submitForm2()" style="width:80px">提交</a>
        <a href="javascript:void(0)" data-options="iconCls:'icon-cancel'" class="easyui-linkbutton" onclick="closeForm2()" style="width:80px">关闭</a>
        </div>
        </div>
</div>
</body>
</html>