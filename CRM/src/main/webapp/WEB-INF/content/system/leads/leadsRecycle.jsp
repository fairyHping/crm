<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="acl" uri="http://www.zhidisoft.com/taglib/acl"%>
<%
	String basePath = request.getContextPath();//获取应用程序的根路径
	//获取应用程序的全路径
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ basePath + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href=<%=path%>>
<meta charset="UTF-8">
<title>线索回收站</title>
<%@include file="../../script.html"%>
</head>
<body>
	<div>
		<div id="toolbar">
			<span style=""> <select style="color: gray"
				class="easyui-combobox" name="source" id="source">
					<option value="">---请选择筛选条件---</option>
					<option value="name">公司名</option>
					<option value="contactsName">联系人</option>
					<option value="ownerName">负责人</option>
					<option value="creatorName">创建人</option>
			</select> 
			<input class="easyui-textbox" name="content" id="content"> 
			<a id="searchBtn" class="easyui-linkbutton"
				data-options="iconCls:'icon-search',plain:true">搜索</a>
			<a class="easyui-linkbutton" id="resetButton"
					data-options="iconCls:'icon-undo',plain:true">重置</a> 
			</span> <span style="float: right; margin-right: 20px"> 
			<acl:hasPermission code="system:leads:withdraw">
			<a id="withdraw" class="easyui-linkbutton"
				data-options="iconCls:'icon-undo',plain:true">撤回线索</a>
				</acl:hasPermission>
			</span>
		</div>
	</div>
	<table id="recycleList" style="width: 100%">
	</table>
</body>
<script type="text/javascript">
	$(function() {
		$("#withdraw").on("click", function(event) {
			//阻止原有的点击事件行为
			event.preventDefault();
			//获取选中的线索，选中的是一整行数据		  
			var rows = $("#recycleList").datagrid("getChecked");
			//没有选中某一个用户时进行提示
			if (!rows || rows.length < 1) {
				parent.$.messager.alert("警告", "必须选中线索！", "warning");
				return;
			}
			//获取选中的线索的id
			var leadsIds = new Array();
			$.each(rows, function(index, obj) {
				if (obj) {
					leadsIds.push(obj.leadsId);
				}
			});

			$.post("system/leads/withdrawLeads", {
				"leadsIds" : leadsIds.join(",")
			}, function(data) {
				if (data.success) {
					parent.$.messager.show({
						"title" : "提示",
						"msg" : data.message,
						"timeout" : 6000
					})
					$("#recycleList").datagrid("reload");
					$("#recycleList").datagrid("uncheckAll");
				} else {
					parent.$.messager.alert({
						title : "提示",
						msg : data.message
					})
				}
			}, "json");

		});
		
		/* 按条件查询*/
		$("#searchBtn").on("click", function(event) {
			//阻止原有的点击事件行为
			event.preventDefault();
			var source=$("#source").combobox("getValue");
			var content=$("#content").textbox("getText");
			$("#recycleList").datagrid("load",
				{
				"condition" : {
					"source" : source,
					"content" : content
				}
			});

		});

	});

	
	$(function() {
		$("#recycleList")
				.datagrid(
						{
							url : "system/leads/listLeadsRecycle",
							toolbar : "#toolbar",
							pagination : true,
							fitColumns : true,
							rownumbers : true,
							idField : "leadsId",
							columns : [ [
									{
										field : 'leadsId',
										width : 60,
										align : 'center',
										checkbox : true
									},
									{
										field : 'name',
										title : '公司名',
										width : 60
									},
									{
										field : 'contactsName',
										title : '联系人姓名',
										width : 60
									},
									{
										field : 'saltname',
										title : '尊称',
										width : 60
									},
									{
										field : 'mobile',
										title : '手机',
										width : 60
									},
									{
										field : 'nextstepTime',
										title : '下次联系时间',
										width : 60
									},
									{
										field : 'nextstep',
										title : '下次联系内容',
										width : 60
									},
									{
										field : 'ownerUser',
										title : '负责人',
										width : 60,
										formatter : function(value) {
											if (value) {
												return value.userName;
											} else {
												return "";
											}

										}
									},
									{
										field : 'creatorUser',
										title : '创建人',
										width : 60,
										formatter : function(value) {
											if (value) {
												return value.userName;
											} else {
												return "";
											}

										}
									},
									{
										field : 'createTime',
										title : '创建时间',
										width : 60
									}] ],
							loadFilter : function(data) {
								if (data && data.result) {
									return data.result;
								}
								return null;
							}
						});
		
		$("#resetButton").on("click", function(event) {

			event.preventDefault();
			$("#content").textbox("clear");
			$('#source').combobox("setValue", "--请选择筛选条件--");
		})
	});
</script>
</html>