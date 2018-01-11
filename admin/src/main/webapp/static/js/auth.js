function submitForm() {
    //ajax提交表单
    //1.准备请求参数
    var formData = $("#authForm").form().serialize();
    console.log(formData);
    $.ajax({
        url:path+'/auth/update',
        method:'post',
        data:formData,
        success:function (res) {
            if(res.msg){
                //成功
                $("#authWindow").window("close");
                $("#auth-treegrid").treegrid("reload");
            }
        },
        error:function (res) {

        }
    });
}

function addOrUpdate(action){
    //获取treegrid中选中的行
    var row =  $("#auth-treegrid").treegrid("getSelected");
    var parent = $("#auth-treegrid").treegrid("getParent",row.dbid);
    var title = "添加权限";
    if(action == '修改'){
        title = "修改权限";
        $("#parentName").textbox("setValue",parent.authName);
        $("#layer").textbox("setValue",row.layer);
        $("#parentId").val(row.parentId);
        $("#dbid").val(row.dbid);
        $("#authName").textbox("setValue",row.authName);
        $("#authCode").textbox("setValue",row.authCode);
        $("#authURL").textbox("setValue",row.authURL);
        $("#orders").textbox("setValue",row.orders);
    }else {
        $("#parentId").val(row.dbid);
        $("#parentName").textbox("setValue",parent.authName);
        $("#layer").textbox("setValue",row.layer+1);
        $("#dbid").val(0);
    }
    $("#type").combobox("setValue",row.type);
    $("#valid").combobox("setValue",row.valid);
    $("#authWindow").window({
        modal:true,//灰色的隔层
        closed:true,//是否可以关闭
        iconCls:'icon-edit',//图标
        width:300,
        height:400,
        title:title,
        collapsible:false,//折叠
        minimizable:false,//最小化
        maximizable:false,//最大化
        resizable:false,//拉伸
        //关闭窗口时重置表单
        onBeforeClose:function () {
            //清空表单
            $("#authForm").form("reset");
        }
    }).window("open");
}
function refreshAuth() {
    //刷新权限列表
    $("#auth-treegrid").treegrid("reload");
}
function onContextMenu(e,row) {
    if(row){
        //响应右击事件
        e.preventDefault();//阻止浏览器的右键菜单弹出
        //选中指定的单元行
        $(this).treegrid('select', row.dbid);
        //显示右键菜单
        $('#mm').menu('show',{
            left: e.pageX,
            top: e.pageY
        });
    }
}
$(function () {
    $("#auth-treegrid").treegrid({
        url:path+"/auth/getAllAuth",
        idField:"dbid",//唯一字段
        method:"get",//请求方式
        fit:true,//填充
        rownumbers:true,//显示行号
        onContextMenu:onContextMenu,
        treeField:"authName",//需要显示为tree的字段
        columns:[[
            {title:"权限名称",field:"authName",width:"300px"},
            {title:"权限编码",field:"authCode",width:"200px"},
            {title:"URL",field:"authURL",width:"200px"},
            {title:"类型",field:"type",width:"200px",formatter:function (value,row,index) {
                if(value == '1'){
                    return '模块';
                }else {
                    return '资源';
                }
            }},
            {title:"排序",field:"orders",width:"200px"},
            {title:"是否有效",field:"valid",width:"200px",formatter:function (value,row,index) {
                if(value == '1'){
                    return '有效';
                }else {
                    return '<span style="color: red">无效</span>';
                }
            }},
            {title:"层级",field:"layer",width:"200px"}
        ]]
    })
});