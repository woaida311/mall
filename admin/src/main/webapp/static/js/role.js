$(function () {
    initDataGrid();
});

function searchRole() {
    //两个输入框的内容，下拉列表的内容
    var roleName = $("#roleName").textbox("getValue");
    var roleCode = $("#roleCode").textbox("getValue");
    var valid = $("#valid").combobox("getValue");
    var formData = {
        roleName: roleName,
        roleCode: roleCode,
        valid: valid
    };
    console.log(formData);
    $("#role-datagrid").datagrid("load", formData);
}

function add(action) {
    var row =  $("#role-datagrid").datagrid("getSelected");
    if(action == '添加') {
        $("#dbid").val(0);
    }else {
        $("#dbid").val(row.dbid);
$("#rolN").textbox("setValue",row.roleName);
$("#rolC").textbox("setValue",row.roleCode);
$("#or").textbox("setValue",row.orders);
$("#val").combobox("setValue",row.valid);
    }
    $("#roleWindow").window({
        modal: true,//灰色的隔层
        closed: true,//是否可以关闭
        iconCls: 'icon-edit',//图标
        width: 300,
        height: 400,
       title: '添加角色',
        collapsible: false,//折叠
        minimizable: false,//最小化
        maximizable: false,//最大化
        resizable: false,//拉伸
        //关闭窗口时重置表单
        onBeforeClose: function () {
            //清空表单
            $("#roleForm").form("reset");
        }
    }).window("open");
};
function closeForm2() {
    $("#grant-Window").window(close);
}
function submitForm2() {
    var nodes = $("#tt").tree("getChecked");
    var authIds = [];
    for(var i = 0;i<nodes.length;i++){
        authIds.push(nodes[i].id);
    }
    var roleId =  $("#roleId").val();
    console.log(nodes);
    console.log(authIds);
    console.log(roleId);
    // return;
    var formData = {
      roleId:roleId,
      authIds:authIds
    };
    $.ajax({
        url:path+"/role/grantAuth",
        method:"post",
        data:formData,
        traditional:true,
        success:function (res) {
            if(res.msg){
                //关闭授权窗口
                $("#grant-Window").window(close);
            }
        }
    })
}
function submitForm() {
    //ajax提交表单
    //1.准备请求参数
    var formData = $("#roleForm").form().serialize();
    console.log(formData);
    $.ajax({
        url: path + '/role/update',
        method: 'post',
        data: formData,
        tranditional:true,//解决传递数组参数时出现的问题
        success: function (res) {
            if (res.msg) {
                //成功
                $("#roleWindow").window("close");
                $("#role-datagrid").datagrid("reload");
            }
        },
        error: function (res) {

        }
    });
};
function onDblClickRow(e,row) {
    console.log("123");
    if(row){
        add();
    }
}
function initDataGrid() {
    $("#role-datagrid").datagrid({
        rownumbers: true,//显示行号
        singleSelect: true,//单选
        autoRowHeight: false,//自动行高
        pagination: true,//是否分页
        pageSize: 5, //每页条数
        method: 'post',
        pageNumber:1,
        fitColumns: true,
        fit: true,
        onDblClickRow:onDblClickRow,//双击事件
        pageList: [3, 5, 10, 20],
        url: path + '/role/getAllRole',
        columns: [[
            {field: 'roleName', title: '名字'},
            {field: 'roleCode', title: '编号'},
            {
                field: 'valid', title: '是否有效',
                formatter: function (value, row, index) {
                    if (value == '1') {
                        return '有效';
                    } else {
                        return '<span style="color: red">无效</span>';
                    }
                }
            },
            {field: 'orders', title: '排序'},
            {field: 'dbid', title: '授权',
            formatter:function (value, row, index) {
                return '<a href="javascript:void(0)" onclick="showGrantAuth2Role('+value+')">授权</a>';
            }}
        ]]
    });
}

function showGrantAuth2Role(roleId) {
    $("#roleId").val(roleId);
    //显示授权的窗口
    //窗口中权限前面的复选框是否选中应该通过角色id查询来决定
 //   alert(roleId);
    $("#tt").tree({
        url:path+'/role/getAuthName?roleId='+roleId,
        method:'get',
        checkbox:true,
        cascadeCheck:false
    });
    $("#grant-Window").window({
        modal:true,//灰色的隔层
        closed:true,//是否可以关闭
        iconCls:'icon-edit',//图标
        width:300,
        height:400,
        title:'授权',
        collapsible:false,//折叠
        minimizable:false,//最小化
        maximizable:false,//最大化
        resizable:false,//拉伸
    }).window("open");
}
