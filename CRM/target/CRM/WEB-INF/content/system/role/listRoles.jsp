<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath =request.getContextPath();//获取应用程序的根路径
	//获取应用程序的全路径
	String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+basePath+"/";	
%>
<!DOCTYPE html>
<html>
<head>
<base href=<%=path%>>
<meta charset="UTF-8">
<title>角色管理</title>
<%@include file="../../script.html"%>
<style type="text/css">

label{
font-size: 14px
}
</style>
</head>
<body>
	<div id="toolbar">
		<label>角色名：</label><input type="text" name="roleName" id="roleName" class="easyui-textbox">&nbsp;&nbsp;
		<label>角色权限：</label><input type="text" name="funcId" value="--请选择--"  id="funcId" class="easyui-combobox" data-options="width:100"> &nbsp;
		<label>角色状态：</label><input type="text" name="status"  id="status" value="--请选择--" class="easyui-combobox" data-options="width:100"> &nbsp;  
		<a class="easyui-linkbutton" id="searchButton"data-options="iconCls:'icon-search',plain:true">查询</a> 
		<a class="easyui-linkbutton" id="resetButton"data-options="iconCls:'icon-undo',plain:true">重置</a> 
		<span id="operation"style="float:right;margin-right: 10px"> 
		<a class="easyui-linkbutton"id="addButton" data-options="iconCls:'icon-add',plain:true">新增</a> 
		<a class="easyui-linkbutton" id="editButton" data-options="iconCls:'icon-edit',plain:true">修改</a> 
		<a class="easyui-linkbutton" id="removeButton" data-options="iconCls:'icon-remove',plain:true">删除</a> 
		<a class="easyui-linkbutton" id="assignButton" data-options="iconCls:'icon-man',plain:true">分配权限</a>
		</span>
	</div>
	<table id="roleList" style='width: 100%'></table>
</body>
<script type="text/javascript">
	$(function(){
		$("#assignButton").on("click", function(event) {
			//阻止原有的点击事件行为
			event.preventDefault();
			//获取选中的角色，选中的是一整行数据
			var rows = $("#roleList").datagrid("getChecked");
			//没有选中某一个角色时进行提示
			if (!rows || rows.length < 1) {
				parent.$.messager.alert("警告", "必须选中为其分配权限的角色！", "warning");
				return;
			}
			//获取到角色的id
			var roleIds = new Array();
			$.each(rows, function(index, obj) {
				if (obj) {
					roleIds.push(obj.roleId);
				}
			});

			//打开新窗口，新窗口中展示权限列表页面
			parent.openTopWindow({
				width : 800,
				height : 600,
				title : "分配权限",
				url : "system/roles/assign?roleIds=" + roleIds.join(","),
				onClose : function(){
					$("#roleList").datagrid("reload");
					$("#roleList").datagrid("uncheckAll");
				}
			});

		});
		
		/* 按条件查询 */
		$("#searchButton").on("click", function(event) {
			//阻止原有的点击事件行为
			event.preventDefault();
			var roleName = $("#roleName").textbox("getText");
			var funcId = $("#funcId").combobox("getValue");
			var status = $("#status").combobox("getValue");
			funcId = (funcId == '--请选择--') ? null : funcId;
			status = (status == '--请选择--') ? null : status;
			$("#roleList").datagrid("load", {
				"condition" : {
					"roleName" : roleName,
					"funcId" : funcId,
					"status" : status
				}
			});
		});
		/* 添加角色信息 */
		$("#addButton").on("click", function(event) {
			//阻止原有的点击事件行为
			event.preventDefault();
			//打开新窗口，新窗口中展示角色列表页面
			parent.openTopWindow({
				width : 600,
				height : 330,
				title : "添加角色信息",
				url : "system/roles/addRole",
				onClose : function() {
					$("#roleList").datagrid("reload");
					$("#roleList").datagrid("uncheckAll");
				}
			});

		});
		/* 修改角色信息 */
		$("#editButton").on("click", function(event) {
			//阻止原有的点击事件行为
			event.preventDefault();
			//获取选中的角色，选中的是一整行数据
			var rows = $("#roleList").datagrid("getChecked");
			//没有选中某一个角色时进行提示
			if (!rows || rows.length < 1) {
				parent.$.messager.alert("警告", "必须选中要修改的角色！", "warning");
				return;
			}
			if (rows && rows.length > 1) {
				parent.$.messager.alert("警告", "只能选中一位角色！", "warning");
				return;
			}

			//获取到角色的id
			var roleId= rows[0].roleId;

			//打开新窗口，新窗口中展示修改角色页面
			parent.openTopWindow({
				width : 600,
				height : 380,
				title : "修改角色信息",
				url : "system/roles/updateRole?roleId=" + roleId,
				onClose : function() {
					$("#roleList").datagrid("reload");
					$("#roleList").datagrid("uncheckAll");
				}
			});

		});
		
		//删除的方法
		function removeRole(url, roleIds) {
			parent.$.messager.confirm('操作提示', '确定要删除吗?', function(r) {
				if (r) {
					$.post(url, {
						"roleIds" : roleIds
					}, function(data) {
						if (data.success) {
							parent.$.messager.show({
								"title" : "提示",
								"msg" : data.message,
								"timeout" : 6000
							})
							$("#roleList").datagrid("reload");
							$("#roleList").datagrid("uncheckAll");
						} else {
							parent.$.messager.alert({
								title : "提示",
								msg : data.message
							})
						}
					}, "json")
				}
			});

		}

		/* 删除某一行或多行数据 */
		$("#removeButton").on("click", function(event) {
			//阻止原有的点击事件行为
			event.preventDefault();
			//获取选中的用户，选中的是一整行数据
			var rows = $("#roleList").datagrid("getChecked");
			//没有选中某一个用户时进行提示
			if (!rows || rows.length < 1) {
				parent.$.messager.alert("警告", "必须选中要删除的用户！", "warning");
				return;
			}
			var roleIds = new Array();
			$.each(rows, function(index, obj) {
				if (obj) {
					roleIds.push(obj.roleId);
				}
			});

			removeRole("system/roles/deleteRole", roleIds.join(","))
		});
		
		
	});

/* 初始化页面 */
$(function() {

	/* 获取所有角色信息 */
	$('#funcId').combobox({
	    "url":"system/functions/listAll",
	    "valueField":'funcId',
	    "textField":'funcName',
	    "loadFilter" : function(data){
				if(data && data.success ){
					return data.result;
				}
				return null;
			}
	});


	$('#status').combobox({
	    "url":"system/dictionary/listStatus",
	   "valueField":'value',
	    "textField":'valueName',
	    "loadFilter" : function(data){
			if(data && data.success ){
				return data.result;
			}
			return null;
		}
		
	});
	
	$("#roleList").datagrid({
		url : "system/roles/listRoles",
		toolbar : '#toolbar',
		pagination : true,
		fitColumns : true,
		idField : 'roleId',
		rownumbers : true,
		columns : [[ 
			{field : 'roleId',width : 80,align : 'right',checkbox : true},
			{field : 'roleName',title : '角色名称',align : 'center',width : 80},
			{field : 'functions',title : '角色权限',align : 'center',width : 80,formatter : function(value) {
				if (value && value.length > 0) {
					var funcNames = new Array();
					$.each(value, function(index, obj) {
						if (obj) {
							funcNames.push(obj.funcName);
						}

					});
					return "<span title='" + funcNames.join(",") + "'>" + funcNames.join(",") + "</span>";
				}
				return "";
			}},
			{field : 'system',title : '是否为系统角色',align : 'center',width : 80,formatter : function(value) {
					if (value == 1) {
						return "是";
					}
					if (value == 0) {
						return "否";
					}
				}
			},
			{field : 'status',title : '角色状态',align : 'center',width : 60,formatter : function(value) {
				if (value == 1) {
					return "正常";
				}
				if (value == 0) {
					return "已被禁用";
				}
				if (value == 2) {
					return "已被删除";
				}
					return "";
			}}, 
			{field : 'note',title : '描述信息',align : 'center',width : 80}, 
			{field : 'createTime',title : '创建时间',align : 'center',width : 80}, 
			{field : 'updateTime',title : '更新时间',align : 'center',width : 80},
			{field : 'operation',title:'查看详情',align : 'center',width : 80,formatter:function(value,rowData,index){
                return "<a href='javascript:void(0)' onclick='detail("+rowData.roleId+")'>查看详情</a>"                   
                }}
			]],

		loadFilter : function(data) {
			if (data && data.result) {
				return data.result;
			} else {
				return null;
			}
		}
	});
	
	
	$("#resetButton").on("click",function(event){
		
		event.preventDefault();
		$("#roleName").textbox("clear");
		$('#funcId').combobox("setValue","--请选择--");
		$('#status').combobox("setValue","--请选择--");
	})

});

function detail(roleId){
	//打开新窗口，新窗口中展示角色详情页面
	parent.openTopWindow({
		width : 650,
		height : 400,
		title : "角色信息",
		url : "system/roles/roleInfo?roleId="+roleId,
		onClose : function() {
			$("#roleList").datagrid("uncheckAll");
		}
	});
}

</script>
</html>