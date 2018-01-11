<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.zhidisoft.com/taglib/acl" prefix="acl" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<title>字典管理</title>
<%@include file="../../script.html" %>
</head>
<body>
<div id="toolbar">
		<label>字典名：</label><input type="text" name="valueName" id="valueName"
			class="easyui-textbox"> 
			<label>字典类型：</label> 
			<select name="type" id="type"
			class="easyui-combobox" data-options="width:100">
			<option value="--请选择--">--请选择--</option>
			 <c:forEach items="${types }" var="type">
			 	<option value="${type }">${type }</option>
			 </c:forEach>
			</select>
			
			<label>字典状态：</label>
		<input type="text" name="state" id="state" value="--请选择--"
			class="easyui-combobox" data-options="width:100"> <a
			class="easyui-linkbutton" id="searchButton"
			data-options="iconCls:'icon-search',plain:true">查询</a> <a
			class="easyui-linkbutton" id="resetButton"
			data-options="iconCls:'icon-undo',plain:true">重置</a> <span
			id="operation" style="float: right; margin-right: 10px"> 
			<acl:hasPermission code="system:dictionary:add">
				<a class="easyui-linkbutton" id="addButton"
					data-options="iconCls:'icon-add',plain:true">新增</a>
			</acl:hasPermission> 
			<acl:hasPermission code="system:dictionary:edit">
				<a class="easyui-linkbutton" id="editButton"
					data-options="iconCls:'icon-edit',plain:true">修改</a>
			</acl:hasPermission> 
			<acl:hasPermission code="system:dictionary:delete">
				<a class="easyui-linkbutton" id="removeButton"
					data-options="iconCls:'icon-remove',plain:true">删除</a>
			</acl:hasPermission> 
		</span>
	</div>
	<table id="dictionaryList" style='width: 100%'></table>
</body>
<script type="text/javascript">
$(function(){
	/* 添加字典 */
	$("#addButton").on("click", function(event) {
		//阻止原有的点击事件行为
		event.preventDefault();
		//打开新窗口，新窗口中展示字典页面
		parent.openTopWindow({
			width : 500,
			height : 300,
			title : "添加字典",
			url : "system/dictionary/addDictionary",
			onClose : function() {
				$("#dictionaryList").datagrid("reload");
				$("#dictionaryList").datagrid("uncheckAll");
			}

		});

	});

	/* 修改字典信息 */
	$("#editButton").on("click", function(event) {
		//阻止原有的点击事件行为
		event.preventDefault();
		//获取选中的字典，选中的是一整行数据
		var rows = $("#dictionaryList").datagrid("getChecked");
		//没有选中某一个角色时进行提示
		if (!rows || rows.length < 1) {
			parent.$.messager.alert("警告", "必须选中要修改的字典！", "warning");
			return;
		}
		if (rows && rows.length > 1) {
			parent.$.messager.alert("警告", "只能选中一位字典！", "warning");
			return;
		}

		//获取到角色的id
		var dicId= rows[0].dicId;

		//打开新窗口，新窗口中展示修改角色页面
		parent.openTopWindow({
			width : 600,
			height : 400,
			title : "修改字典",
			url : "system/dictionary/updateDictionary?dicId=" + dicId,
			onClose : function() {
				$("#dictionaryList").datagrid("reload");
				$("#dictionaryList").datagrid("uncheckAll");
			}
		});

	});
	
	$("#searchButton").on("click",function(e){
		e.preventDefault();
		var valueName=$("#valueName").textbox("getText");
		var type=$("#type").combobox("getValue");
		type=(type=="--请选择--")? null:type;
		var state=$("#state").combobox("getValue");
		state=(state=="--请选择--")? null:state;
		$("#dictionaryList").datagrid("load",{
			"condition":{
				"valueName":valueName,
				"type":type,
				"state":state
			}
			
		});
		
	});
	
	

	/* 批量删除 */
	$("#removeButton").on("click", function(event) {
		//阻止原有的点击事件行为
		event.preventDefault();
		//获取选中的字典，选中的是一整行数据		  
		var rows = $("#dictionaryList").datagrid("getChecked");
		//没有选中某一个用户时进行提示
		if (!rows || rows.length < 1) {
			parent.$.messager.alert("警告", "必须选中字典！", "warning");
			return;
		}
		//获取选中的字典的id
		var dicIds = new Array();
		$.each(rows, function(index, obj) {
			if (obj) {
				dicIds.push(obj.dicId);
			}
		});
		parent.$.messager.confirm('操作提示', '确定要删除吗?', function(r) {
			if (r) {
				$.post("system/dictionary/deleteBatch", {
					"dicIds" : dicIds.join(",")
				}, function(data) {
					if (data.success) {
						parent.$.messager.show({
							"title" : "提示",
							"msg" : data.message,
							"timeout" : 6000
						})
						$("#dictionaryList").datagrid("reload");
						$("#dictionaryList").datagrid("uncheckAll");
					} else {
						parent.$.messager.alert({
							title : "提示",
							msg : data.message
						})
					}
				}, "json")
			}
		});

	});
	
	/* 获取状态下拉列表 */
	$('#state').combobox({
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
	$("#dictionaryList")
	.datagrid(
			{
				url : "system/dictionary/listDictionary",
				toolbar : '#toolbar',
				pagination : true,
				fitColumns : true,
				idField : 'dicId',
				rownumbers : true,
				columns : [ [
						{
							field : 'dicId',
							width : 80,
							align : 'right',
							checkbox : true
						},
						{
							field : 'type',
							title : '字典类型',
							align : 'center',
							width : 80
						},
						{
							field : 'valueName',
							title : '字典名',
							align : 'center',
							width : 80
						},
						{
							field : 'value',
							title : '字典值',
							align : 'center',
							width : 80
						},
						{
							field : 'state',
							title : '字典状态',
							align : 'center',
							width : 60,
							formatter : function(value) {
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
							}
						},
						{
							field : 'createTime',
							title : '创建时间',
							align : 'center',
							width : 80
						},
						{
							field : 'updateTime',
							title : '更新时间',
							align : 'center',
							width : 80
						},
						{
							field : 'operation',
							title : '查看详情',
							align : 'center',
							width : 80,
							formatter : function(value, rowData,
									index) {
								return "<a href='javascript:void(0)' onclick='detail("
										+ rowData.dicId
										+ ")'>查看详情</a>"
							}
						}

				] ],

				loadFilter : function(data) {
					if (data && data.result) {
						return data.result;
					} else {
						return null;
					}
				}
			});
	
	
	$("#resetButton").on("click", function(event) {

		event.preventDefault();
		$("#valueName").textbox("clear");
		$('#type').combobox("setValue", "--请选择--");
		$('#state').combobox("setValue", "--请选择--");
	})
	
	
});

/* 字典详情 */
function detail(dicId) {
	//打开新窗口，新窗口中展示字典详情页面
	parent.openTopWindow({
		width : 650,
		height : 400,
		title : "字典信息",
		url : "system/dictionary/dictionaryInfo?dicId=" + dicId,
		onClose : function() {
			$("#dictionaryList").datagrid("uncheckAll");
		}
	});
}

</script>


</html>