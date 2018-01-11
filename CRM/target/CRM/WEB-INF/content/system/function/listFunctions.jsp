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
<title>权限管理</title>
<%@include file="../../script.html"%>

</head>
<body>
	<div id="toolbar">
		<label>权限名称：</label><input type="text" name="funcName" id="funcName" class="easyui-textbox"> 
		<label>父权限：</label>
		<input type="text" name="parentId" value="--请选择--" id="parentId" class="easyui-combobox" data-options="width:100"> 
		<label>权限状态：</label>
		<input type="text" name="status" id="status" value="--请选择--" class="easyui-combobox" data-options="width:100"> 
		<a class="easyui-linkbutton" id="searchButton" data-options="iconCls:'icon-search',plain:true">查询</a> 
		<a class="easyui-linkbutton" id="resetButton"data-options="iconCls:'icon-undo',plain:true">重置</a> 
		<span id="operation" style="float:right;margin-right: 10px"> 
		<a class="easyui-linkbutton" id="addButton" data-options="iconCls:'icon-add',plain:true">新增</a> 
		<a class="easyui-linkbutton" id="editButton" data-options="iconCls:'icon-edit',plain:true">修改</a> 
		<a class="easyui-linkbutton" id="removeButton" data-options="iconCls:'icon-remove',plain:true">删除</a> 
		</span>
	</div>
	<table id="functionList" style='width: 100%'></table>
</body>
<script type="text/javascript">
$(function() {
	
	/* 按条件查询 */
	$("#searchButton").on("click", function(event) {
		//阻止原有的点击事件行为
		event.preventDefault();
		var funcName = $("#funcName").textbox("getText");
		var parentId = $("#parentId").combobox("getValue");
		var status = $("#status").combobox("getValue");
		parentId = (parentId == '--请选择--') ? null : parentId;
		status = (status == '--请选择--') ? null : status;
		$("#functionList").datagrid("load", {
				"condition" : {
					"funcName" : funcName,
					"parentId" : parentId,
					"status" : status
			}
		});
	});

	//添加权限信息
	$("#addButton").on("click", function(event) {
		//阻止原有的点击事件行为
		event.preventDefault();
		//打开新窗口，新窗口中展示角色列表页面
		parent.openTopWindow({
			width : 600,
			height : 360,
			title : "添加权限信息",
			url : "system/functions/addFunction",
			onClose : function() {
				$("#functionList").datagrid("reload");
				$("#functionList").datagrid("uncheckAll");
			}
		});

	});

	$("#editButton").on("click", function(event) {
		//阻止原有的点击事件行为
		event.preventDefault();
		//获取选中的权限，选中的是一整行数据
		var rows = $("#functionList").datagrid("getChecked");
		//没有选中某一种权限时进行提示
		if (!rows || rows.length < 1) {
			parent.$.messager.alert("警告", "必须选中要修改的权限！", "warning");
			return;
		}
		if (rows && rows.length > 1) {
			parent.$.messager.alert("警告", "只能选中一种权限！", "warning");
			return;
		}

		//获取到权限的id
		var funcId= rows[0].funcId;

		//打开新窗口，新窗口中展示权限修改页面
		parent.openTopWindow({
			width :600,
			height : 400,
			title : "修改权限信息",
			url : "system/functions/updateFunction?funcId=" + funcId,
			onClose : function() {
				$("#functionList").datagrid("reload");
				$("#functionList").datagrid("uncheckAll");
			}
		});

	});
	//删除的方法
	function removeFunction(url, funcIds) {
		parent.$.messager.confirm('操作提示', '确定要删除吗?', function(r) {
			if (r) {
				$.post(url, {
					"funcIds" : funcIds
				}, function(data) {
					if (data.success) {
						parent.$.messager.show({
							"title" : "提示",
							"msg" : data.message,
							"timeout" : 6000
						})
						$("#functionList").datagrid("reload");
						$("#functionList").datagrid("uncheckAll");
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
		var rows = $("#functionList").datagrid("getChecked");
		//没有选中某一个用户时进行提示
		if (!rows || rows.length < 1) {
			parent.$.messager.alert("警告", "必须选中要删除的用户！", "warning");
			return;
		}
		var funcIds = new Array();
		$.each(rows, function(index, obj) {
			if (obj) {
				funcIds.push(obj.funcId);
			}
		});

		removeFunction("system/functions/deleteFunction", funcIds.join(","))
	});
	/* 获取所有权限的父权限信息 */
	$('#parentId').combobox({
		"url" : "system/functions/listParent",
		"valueField" : 'funcId',
		"textField" : 'funcName',
		"loadFilter" : function(data) {
			if (data && data.success) {
				return data.result;
			}
			return null;
		}
	});

	$('#status').combobox({
		"url" : "system/dictionary/listStatus",
		"valueField" : 'value',
		"textField" : 'valueName',
		"loadFilter" : function(data) {
			if (data && data.success) {
				return data.result;
			}
			return null;
		}

	});

	
	
	$("#functionList").datagrid({
		url : "system/functions/listFunctions",
		toolbar : '#toolbar',
		pagination : true,
		fitColumns : true,
		idField : 'funcId',
		rownumbers : true,
		columns : [ [ 
		          		{field :'funcId',width : 80,align : 'right',checkbox : true},
						{field:'funcName',title:'权限名称',width:80},
						{field:'parentFunction',title:'父权限',width:80,align : 'center',formatter:function(value){
							if(value){
								return value.funcName;
							}else{
								return "";
							}
							
						}},
						{field:'funcType',title:'权限类型',width:80,align : 'center',formatter:function(value){
							if(value==1){
								return "菜单权限";	
							}else if(value==0){
								return "按钮权限";	
							}else{
								return "";
							}
							
						}},
						{field:'status',title:'权限状态',width:80,align : 'center',formatter:function(value){
							if(value == 1){
								return "正常";
							}else if(value == 0){
								return "已禁用";
							}else if(value == 2){
								return "已删除";
							}else{
								return "";
							}
						}},
						{field : 'createTime',title : '创建时间',align : 'center',width : 80}, 
						{field : 'updateTime',title : '更新时间',align : 'center',width : 80},
						{field : 'operation',title:'查看详情',align : 'center',width : 80,formatter:function(value,rowData,index){
		                    return "<a href='javascript:void(0)' onclick='detail("+rowData.funcId+")'>查看详情</a>"                   
		                    }}
					 	
					]],
					loadFilter: function(data){
						if(data && data.result){
							return data.result;
						}
						return null;
					}
	});
	
	
	$("#resetButton").on("click",function(event){
		
		event.preventDefault();
		$("#funcName").textbox("clear");
		$('#parentId').combobox("setValue","--请选择--");
		$('#status').combobox("setValue","--请选择--");
	})

});

function detail(funcId){
	//打开新窗口，新窗口中展示权限详情页面
	parent.openTopWindow({
		width : 650,
		height : 420,
		title : "权限信息",
		url : "system/functions/functionInfo?funcId="+funcId,
		onClose : function() {
			$("#functionList").datagrid("uncheckAll");
		}
	});
}

</script>
</html>