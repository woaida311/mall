$(function () {
    initDataGrid();
});

function searchRole() {
    //两个输入框的内容，下拉列表的内容
    var userName = $("#userName").textbox("getValue");
    var realName = $("#realName").textbox("getValue");
    var valid = $("#valid").combobox("getValue");
    var formData = {
        userName: userName,
        realName:realName,
        valid: valid
    };
    console.log(formData);
    $("#user-datagrid").datagrid("load", formData);
}

function add(action) {
    var row =  $("#user-datagrid").datagrid("getSelected");
    if(action == '添加') {
        $("#dbid").val(0);
    }else {
        $("#dbid").val(row.dbid);
$("#name").textbox("setValue",row.userName);
$("#real").textbox("setValue",row.realName);
$("#pass").passwordbox("setValue",row.password);
$("#pass2").passwordbox("setValue",row.password2);
$("#val").combobox("setValue",row.valid);
    }
    $("#userWindow").window({
        modal: true,//灰色的隔层
        closed: true,//是否可以关闭
        iconCls: 'icon-edit',//图标
        width: 300,
        height: 400,
        title: '角色编辑窗口',
        collapsible: false,//折叠
        minimizable: false,//最小化
        maximizable: false,//最大化
        resizable: false,//拉伸
        //关闭窗口时重置表单
        onBeforeClose: function () {
            //清空表单
            $("#userForm").form("reset");
        }
    }).window("open");
};
function alert5(){
    $.messager.alert('添加失败','两次密码不一致','warning');
}
function submitForm() {
    //ajax提交表单
    //1.准备请求参数
    var password = $("#password").val();
    var password2 = $("#password2").val();
    if(password != password2){
        alert5();
    }else {
    var formData = $("#userForm").form().serialize();
    console.log(formData);
    $.ajax({
        url: path + '/user/update',
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
};
function onDblClickRow(e,row) {
if(row){
add();
}
}
function initDataGrid() {
    $("#user-datagrid").datagrid({
        rownumbers: true,//显示行号
        singleSelect: true,//单选
        autoRowHeight: false,//自动行高
        pagination: true,//是否分页
        pageSize: 5, //每页条数
        method: 'post',
        fitColumns: true,
        fit: true,
        onDblClickRow:onDblClickRow,//双击事件
        pageList: [3, 5, 10, 20],
        url: path + '/user/getAllUser',
        columns: [[
            {field: 'userName', title: '用户名称'},
            {field: 'realName', title: '真实姓名'},
            {
                field: 'valid', title: '用户状态',
                formatter: function (value, row, index) {
                    if (value == '1') {
                        return '正常';
                    } else {
                        return '<span style="color: red">冻结</span>';
                    }
                }
            },
            {field: 'dbid', title: '授予角色',
                formatter:function (value, row, index) {
                    return '<a href="javascript:void(0)" onclick="showGrantAuth2Role('+value+')">授予角色</a>';
                }}
        ]]
    });
}
function submitGrantForm() {
    var nodes = $("#grantuser2role").datagrid("getChecked");
    var roleIds = [];
    for(var i = 0;i<nodes.length;i++){
        console.log( nodes[i].dbid);
        roleIds.push(nodes[i].dbid);
    }
    var userId =  $("#userId").val();
    //console.log(roleIds);
  //  console.log(userId);
    // return;
    var formData = {
        userId:userId,
        roleIds:roleIds
    };
    $.ajax({
        url:path+"/user/grantRole",
        method:"post",
        data:formData,
        traditional:true,
        success:function (res) {
            if(res.msg){
                //关闭授权窗口
                $("#grantWindow").window(close);
            }
        }
    })
}
function showGrantAuth2Role(userId) {
    //显示授权的窗口
    //获取数据，打开窗口
    $("#userId").val(userId);
    $("#grantuser2role").datagrid({
        url: path + '/user/getAllRole?userId=' + userId,
        method: 'get',
        animate: true,
        rownumbers: true,//显示行号
        autoRowHeight: false,//自动行高
        fitColumns: true,
        onLoadSuccess:function (data) {
            var rows = data.rows;
            console.log(rows);
            //var rows = $(this).datagrid("getData").rows;
            for(var i = 0 ; i < rows.length;i++){
                if(rows[i].checked){
                    //此行应该被选中
                    $(this).datagrid("selectRow",i);
                   // $(this).getChecked()
                }
            }
        },
        columns: [[
            {checkbox:true,field:"checked"},
            {field: 'roleName', title: '角色名称', width: "100"},
            {field: 'roleCode', title: '角色编码', width: "100"}
        ]]
    })
    //   alert(roleId);
    $("#grantWindow").window({
        modal:true,//灰色的隔层
        closed:true,//是否可以关闭
        iconCls:'icon-edit',//图标
        width:300,
        height:400,
        title:'授予角色',
        collapsible:false,//折叠
        minimizable:false,//最小化
        maximizable:false,//最大化
        resizable:false,//拉伸
    }).window("open");
}
