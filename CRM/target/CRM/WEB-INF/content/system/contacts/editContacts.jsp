<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>编辑联系人</title>
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
	min-width: 90px
}

tr {
	height: 60px
}
</style>
</head>
<body>
	<div id="div">
		<form id="leadsForm">
			<div id="main" class="easyui-panel">
				<table style="text-align: center">
					<tr>
						<td colspan="4" id="other"><strong>主要信息</strong></td>
					</tr>
					<tr>
						<td class="td1">联系人名：</td>
						<td class="td2"><input type="hidden" name="id"
							value="${contacts.id}"> <input type="text" name="name"
							value="${ contacts.name }"
							class="easyui-textbox theme-textbox-radius"
							data-options="required:true"></td>

						<td class="td1">尊称：</td>
						<td class="td2"><input type="text" name="saltname"
							id="saltname" class="easyui-textbox"
							data-options="required:true" value="${contacts.saltname}">
					</tr>
					<tr>
						<td class="td1">所属客户：</td>
						<td class="td2"><select class="easyui-combobox "
							data-options="required:true" name="customerId" id="customerId" style="width:175px">
								<c:forEach items="${cus }" var="c">
									<c:if test="${contacts.customer.customerId eq c.customerId}">
										<option value="${c.customerId}" selected="selected">${c.name }</option>
									</c:if>
									<option value="${c.customerId}">${c.name }</option>
								</c:forEach>
						</select></td>
						<td class="td1">电话：</td>
						<td class="td2"><input type="text" name="telephone"
							value="${contacts.telephone}" class="easyui-textbox"
							data-options="required:true">
					</tr>
					<tr>
						<td class="td1">qq：</td>
						<td class="td2"><input type="text" name="qqNo"
							value="${contacts.qqNo}"
							class="easyui-textbox theme-textbox-radius"
							data-options="required:true"></td>
						<td class="td1">Email：</td>
						<td class="td2"><input type="text" name="email"
							value="${contacts.email}"
							class="easyui-textbox theme-textbox-radius"
							data-options="required:true"></td>
					</tr>
					<tr>
						<td class="td1">创建者：</td>
						<td class="td2"><input type="text" name="creatorUserId"
							id="creatorUserId" class="easyui-combobox"
							data-options="required:true" value="${contacts.user.userName}"></td>
						<td class="td1">创建时间：</td>
						<td class="td2"><input name="createTime" id="createTime"
							class="easyui-datetimebox"
							value="<fmt:formatDate value='${contacts.createTime}' pattern='yyyy-MM-dd HH:mm:ss'/>">
						</td>

					</tr>
					<tr>
						<td colspan="4" align="center"><a
							class="easyui-linkbutton save"
							data-options="iconCls:'icon-ok',plain:true">保存</a> <a
							class="easyui-linkbutton back-button" href="javascript:void(0);"
							data-options="iconCls:'icon-back',plain:true">返回</a></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(function() {

		/* 获取所有角色信息 */
		$('#ownerUserId').combobox({
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

	$(function() {
		//编辑客户信息
		$(".save").on(
				"click",
				function(event) {
					//阻止原有的点击事件行为
					event.preventDefault();
					$.post("system/customer/toedit", $("#leadsForm")
							.serialize(), function(data) {
						if (data.success) {
							parent.$.messager.show({
								"title" : "提示",
								"msg" : data.message,
								"timeout" : 6000
							});
							parent.$("#topWindow").window("close")

						} else {
							parent.$.messager.alert({
								title : "提示",
								msg : data.message
							})
						}
					}, "json")

					$(".back-button").on("click", function() {
						parent.$("#topWindow").window("close");
					})

				});
	});
</script>
</html>