<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
						<td class="td2">
						<input type="hidden" name="id" value="${contacts.id}"><input
							type="text" name="name" value="${ contacts.name }"
							class="easyui-textbox theme-textbox-radius"
							data-options="required:true">
							</td>
							
						<td class="td1">尊称：</td>
						<td class="td2"><input type="text" name="saltname" id="saltname"
							class="easyui-combobox" data-options="required:true"
							value="${contacts.saltname}">
					</tr>
					<tr>
						<td class="td1">所属客户：</td>
						<td class="td2"><input type="hidden"
							name="customerId" value="${contacts.customer.customerId }"> <input
							type="text" name="name" value="${contacts.customer.name }"></td>
						<td class="td1">电话：</td>
					     <td class="td2"> 
						<input type="text" name="telephone" value="${contacts.telephone}"
							class="easyui-combobox" data-options="required:true">
					
					</tr>
					<tr>
						 <td class="td1">qq：</td>
					     <td class="td2"> 
						<input type="text" name="qqNo" value="${contacts.qqNo}"
							class="easyui-textbox theme-textbox-radius">
						</td>
				         <td class="td1">Email：</td>
					     <td class="td2"> 
						<input type="text" name="email" value="${contacts.email}"
							class="easyui-textbox theme-textbox-radius">
						</td>
					</tr>
				<tr>
				       <td class="td1">创建者：</td>
						<td class="td2"><input type="text" name="creatorUserId"
							id="creatorUserId" class="easyui-combobox"
							data-options="required:true" value="${contacts.user.userName}"></td>
				        <td class="td1">创建时间：</td>
						 <td class="td2"> 
						<input name="createTime" id="createTime" class="easyui-datetimebox"
							value="<fmt:formatDate value='${contacts.createTime}' pattern='yyyy-MM-dd HH:mm:ss'/>">
							</td>
						
					</tr>			 
	            	<!--  <tr>
						<td id="other" colspan="4"><strong>附加信息</strong></td>
					</tr> 
					 <tr>
						<td class="td1">员工数：</td>
						<td colspan="3" class="td2"><select style="width: 175px" name="employees">
								<option>--请选择--</option>
								<option>9864321</option>
								<option>765431</option>
						</select></td>
					</tr>
					<tr>
						<td class="td1">备注：</td>
						<td colspan="3" class="td2"><textarea name="textarea" cols="80" rows="4"></textarea></td>
					</tr> -->
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
	$(".back-button").on("click", function() {
		parent.$("#topWindow").window("close");
	})
});
</script>
</html>