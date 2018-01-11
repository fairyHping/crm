<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>新建联系人</title>
<%@include file="../../script.html"%>
<style type="text/css">
.td1 {
	background-color: #f5f5f5;
	width: 100;
}

table {
	border-collapse: collapse;
	border-color: #f5ffff;
	margin: 30px auto 0;
	background-color: white;
}

body {
	color: black;
	background-color: #f5f5f5;
}

td {
	min-width: 100px
}

tr {
	height: 50px
}
</style>
</head>
<body>
	<div id="div">
		<form id="addForm">
			<div id="main" class="easyui-panel">
				<table style="text-align: center">
					<tr>
						<td colspan="4" id="other"><strong>主要信息</strong></td>
					</tr>
					<tr>
						<td class="td1" align="right">联系人姓名：</td>
						<td><input 	class="easyui-combobox" data-options="required:true" name="name"></td>
						<td class="td1" align="right">尊称：</td>
						<td><input 	class="easyui-combobox" data-options="required:true" name="saltname"></td>
					</tr>
					<tr>
					<td class="td1" align="right">所属客户：</td>
						<td><input type="text" name="customerId"
							id="customerId"  class="easyui-textbox" data-options="required:true"></td>
					   <td class="td1" align="right">电话：</td>
						<td><input	class="easyui-textbox" data-options="required:true" name="telephone"></td>
					</tr>
					<tr>
						
						<td class="td1" align="right">qq：</td>
						<td><input 	class="easyui-textbox" data-options="required:true"  name="qqNo"></td>
						<td class="td1" align="right">Email：</td>
						<td><input 	class="easyui-combobox" data-options="required:true" name="email"></td>
					</tr>
					<tr>
					<td class="td1" align="right">创建人：</td>
						<td><input type="text" name="creatorUserId"
							id="creatorUserId" 	class="easyui-combobox" data-options="required:true"></td>
						<td class="td1" align="right">创建时间：</td>
						<td><input type="text" name="createTime" class="easyui-datebox" data-options="required:true"></td>
					</tr>
					<tr>
						<td colspan="4" align="center"><a
							class="easyui-linkbutton save"
							data-options="iconCls:'icon-ok',plain:true">保存</a> <a
							class="easyui-linkbutton saveAndSet"
							data-options="iconCls:'icon-add',plain:true">保存并新建</a> <a
							class="easyui-linkbutton back-button" href="javascript:void(0);"
							data-options="iconCls:'icon-back',plain:true">返回</a></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">

	
	/* 获取所有角色信息 */
	$(function(){
			
			/* 获取所有角色信息 */
			$('#creatorUserId').combobox({
				"url" : "system/users/listAll",
				"valueField" : 'userId',
				"textField" : 'userName',
				"loadFilter" : function(data) {
					if (data && data.success) {
						return data.result;
					}
					return null;
				}
			});

			
			});


$(function(){
	
	/* 获取所有客户信息 */
	$('#customerId').combobox({
		"url" : "system/customer/listAll",
		"valueField" : 'customerId',
		"textField" : 'name',
		"loadFilter" : function(data) {
			if (data && data.success) {
				return data.result;
			}
			return null;
		}
	});

	
	});


$(function() {
	$(".back-button").on("click", function() {
		parent.$("#topWindow").window("close");
	})

	//添加联系人
	$(".save").on(
			"click",
			function(event) {
				event.preventDefault();
				$.post("system/customer/add", $("#addForm").serialize(),
					function(data) {
					if (data.success) {
						parent.$.messager.alert({
							title : "提示",
							msg : data.message,
						})
						parent.$("#topWindow").window("close")
					} else {
						$.messager.alert({
							title : "提示",
							msg : data.message,
						})
					}
				}, "json")
			})
});
</script>

</html>