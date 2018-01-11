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
<title>编辑客户</title>
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
				
						
						<td class="td1">客户名：</td>
						<td class="td2"><input type="hidden"
							name="customerId" value="${customer.customerId }"> <input
							type="text" name="name" value="${customer.name }"
							class="easyui-textbox theme-textbox-radius"
							data-options="required:true"></td>
								<td class="td1">联系地址：</td>
						  <td class="td2"> 
						<input type="text" name="address" value="${customer.address}"
							class="easyui-textbox theme-textbox-radius">
						</td>
					</tr>
					<tr>
						<td class="td1">客户行业：</td>
						<td class="td2"><input type="text" name="industry"
							value="${customer.industry }"
							class="easyui-textbox theme-textbox-radius"></td>
						<td class="td1">邮编：</td>
					     <td class="td2"> 
						<input type="text" name="zipCode" value="${customer.zipCode }"
							class="easyui-textbox theme-textbox-radius"
							data-options="width:100">
					
					</tr>
					<tr>
						<td class="td1">创建者：</td>
						<td class="td2"><input type="text" name="creatorUserId"
							id="creatorUserId" class="easyui-combobox"
							data-options="required:true" value="${customer.cUser.userName}"></td>
						 <td class="td1">评分：</td>
					     <td class="td2"> 
						<input type="text" name="rating" value="${customer.rating}"
							class="easyui-textbox theme-textbox-radius">
						</td>
				
					</tr>
				<tr>
				        <td class="td1">创建时间：</td>
						 <td class="td2"> 
						<input name="createTime" id="createTime" class="easyui-datetimebox"
							value="<fmt:formatDate value='${customer.createTime}' pattern='yyyy-MM-dd HH:mm:ss'/>">
							</td>
						
						<td class="td1">更新时间：</td>
						 <td class="td2"> 
						<input name="updateTime" id="updateTime" class="easyui-datetimebox"
							value="<fmt:formatDate value='${customer.updateTime}' pattern='yyyy-MM-dd HH:mm:ss'/>" >
						</td>
					</tr>
					<tr>
						<td colspan="4" align="center"><a
							class="easyui-linkbutton save"
							data-options="iconCls:'icon-ok',plain:true">重置</a> <a
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