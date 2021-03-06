<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.zhidisoft.com/taglib/acl" prefix="acl"%>
<%
	String basePath = request.getContextPath();//获取应用程序的根路径
	//获取应用程序的全路径
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ basePath + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=path%>">
<meta charset="UTF-8">
<title>用户管理</title>
<%@include file="../../script.html"%>

</head>
<body>
	<div id="toolbar">
		<label>用户名：</label><input type="text" name="username" id="username"
			class="easyui-textbox"> <label>用户角色：</label> <input
			type="text" name="roleId" value="--请选择--" id="roleId"
			class="easyui-combobox" data-options="width:100"> <label>用户状态：</label>
		<input type="text" name="status" id="status" value="--请选择--"
			class="easyui-combobox" data-options="width:100"> <a
			class="easyui-linkbutton" id="searchButton"
			data-options="iconCls:'icon-search',plain:true">查询</a> <a
			class="easyui-linkbutton" id="resetButton"
			data-options="iconCls:'icon-undo',plain:true">重置</a> <span
			id="operation" style="float: right; margin-right: 10px"> 
			<acl:hasPermission code="system:user:create">
				<a class="easyui-linkbutton" id="addButton"
					data-options="iconCls:'icon-add',plain:true">新增</a>
			</acl:hasPermission> 
			<acl:hasPermission code="system:user:edit">
				<a class="easyui-linkbutton" id="editButton"
					data-options="iconCls:'icon-edit',plain:true">修改</a>
			</acl:hasPermission> 
			<acl:hasPermission code="system:user:delete">
				<a class="easyui-linkbutton" id="removeButton"
					data-options="iconCls:'icon-remove',plain:true">删除</a>
			</acl:hasPermission> 
			<acl:hasPermission code="system:user:grant">
				<a class="easyui-linkbutton" id="assignButton"
					data-options="iconCls:'icon-man',plain:true">分配角色</a>
			</acl:hasPermission>
		</span>
	</div>
	<table id="userList" style='width: 100%'></table>
</body>
<script type="text/javascript">
	/* 为分配角色按钮添加事件 */

	$(function() {
		$("#assignButton").on("click", function(event) {
			//阻止原有的点击事件行为
			event.preventDefault();
			//获取选中的用户，选中的是一整行数据
			var rows = $("#userList").datagrid("getChecked");
			//没有选中某一个用户时进行提示
			if (!rows || rows.length < 1) {
				parent.$.messager.alert("警告", "必须选中为其分配角色的用户！", "warning");
				return;
			}
			//获取到用户的id
			var userIds = new Array();
			$.each(rows, function(index, obj) {
				if (obj) {
					userIds.push(obj.userId);
				}
			});

			//打开新窗口，新窗口中展示角色列表页面
			parent.openTopWindow({
				width : 600,
				height : 400,
				title : "分配角色",
				url : "system/users/assign?userIds=" + userIds.join(","),
				onClose : function() {
					$("#userList").datagrid("reload");
					$("#userList").datagrid("uncheckAll");
				}
			});

		});

		/* 按条件查询 */
		$("#searchButton").on("click", function(event) {
			//阻止原有的点击事件行为
			event.preventDefault();
			var userName = $("#username").textbox("getText");
			var roleId = $("#roleId").combobox("getValue");
			var status = $("#status").combobox("getValue");
			roleId = (roleId == '--请选择--') ? null : roleId;
			status = (status == '--请选择--') ? null : status;
			$("#userList").datagrid("load", {
				"condition" : {
					"userName" : userName,
					"roleId" : roleId,
					"status" : status
				}
			});
		});

		//删除的方法
		function removeUser(url, userIds) {
			parent.$.messager.confirm('操作提示', '确定要删除吗?', function(r) {
				if (r) {
					$.post(url, {
						"userIds" : userIds
					}, function(data) {
						if (data.success) {
							parent.$.messager.show({
								"title" : "提示",
								"msg" : data.message,
								"timeout" : 6000
							})
							$("#userList").datagrid("reload");
							$("#userList").datagrid("uncheckAll");
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
			var rows = $("#userList").datagrid("getChecked");
			//没有选中某一个用户时进行提示
			if (!rows || rows.length < 1) {
				parent.$.messager.alert("警告", "必须选中要删除的用户！", "warning");
				return;
			}
			var userIds = new Array();
			$.each(rows, function(index, obj) {
				if (obj) {
					userIds.push(obj.userId);
				}
			});

			removeUser("system/users/deleteUser", userIds.join(","))
		});

		$("#editButton").on("click", function(event) {
			//阻止原有的点击事件行为
			event.preventDefault();
			//获取选中的用户，选中的是一整行数据
			var rows = $("#userList").datagrid("getChecked");
			//没有选中某一个用户时进行提示
			if (!rows || rows.length < 1) {
				parent.$.messager.alert("警告", "必须选中要修改的用户！", "warning");
				return;
			}
			if (rows && rows.length > 1) {
				parent.$.messager.alert("警告", "只能选中一位用户！", "warning");
				return;
			}

			//获取到用户的id
			var userId = rows[0].userId;

			//打开新窗口，新窗口中展示角色列表页面
			parent.openTopWindow({
				width : 600,
				height : 400,
				title : "修改用户信息",
				url : "system/users/updateUser?userId=" + userId,
				onClose : function() {
					$("#userList").datagrid("reload");
					$("#userList").datagrid("uncheckAll");
				}
			});

		});

		$("#addButton").on("click", function(event) {
			//阻止原有的点击事件行为
			event.preventDefault();
			//打开新窗口，新窗口中展示角色列表页面
			parent.openTopWindow({
				width : 600,
				height : 450,
				title : "添加用户信息",
				url : "system/users/addUser",
				onClose : function() {
					$("#userList").datagrid("reload");
					$("#userList").datagrid("uncheckAll");
				}
			});

		});
	});

	$(function() {

		/* 获取所有角色信息 */
		$('#roleId').combobox({
			"url" : "system/roles/listAll",
			"valueField" : 'roleId',
			"textField" : 'roleName',
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

		$("#userList")
				.datagrid(
						{
							url : "system/users/listUsers",
							toolbar : '#toolbar',
							pagination : true,
							fitColumns : true,
							idField : 'userId',
							rownumbers : true,
							columns : [ [
									{
										field : 'userId',
										width : 80,
										align : 'right',
										checkbox : true
									},
									{
										field : 'userName',
										title : '用户名',
										align : 'center',
										width : 80
									},
									{
										field : 'roles',
										title : '用户角色',
										align : 'center',
										width : 80,
										formatter : function(value) {
											if (value && value.length > 0) {
												var roleNames = new Array();
												$
														.each(
																value,
																function(index,
																		obj) {
																	if (obj) {
																		roleNames
																				.push(obj.roleName);
																	}

																});
												return roleNames.join(",");
											}
											return "";
										}
									},
									{
										field : 'phone',
										title : '联系方式',
										align : 'center',
										width : 80
									},
									{
										field : 'email',
										title : '电子邮箱',
										align : 'center',
										width : 80
									},
									{
										field : 'status',
										title : '用户状态',
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
										field : 'note',
										title : '备注信息',
										align : 'center',
										width : 80
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
													+ rowData.userId
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
			$("#username").textbox("clear");
			$('#roleId').combobox("setValue", "--请选择--");
			$('#status').combobox("setValue", "--请选择--");
		})

	});

	function detail(userId) {
		//打开新窗口，新窗口中展示用户详情页面
		parent.openTopWindow({
			width : 650,
			height : 420,
			title : "用户信息",
			url : "system/users/userInfo?userId=" + userId,
			onClose : function() {
				$("#userList").datagrid("uncheckAll");
			}
		});
	}
</script>
</html>