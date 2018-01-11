<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<%@include file="../../script.html"%>
<title>线索详情</title>
<style type="text/css">
.t1 {
	text-align: right;
	width: 100px;
	line-height: 30px;
	padding-left: 20px;
	padding-right: 10px;
	background-color: #f5f5f5;
}
.t2 {
	text-align: left;
	line-height: 30px;
	padding-left: 20px;
}
td {
	border: 1px #b0b8b8 solid;
	line-height: 30px;
}

table {
	width: 90%;
	margin: 10px;
	border:none;
	border-collapse: collapse;
	text-align: center;
}
</style>
</head>
<body>
	<div style="width: 100%; margin-top: 10px;margin-bottom: 10px;" align="center">

		<form id="saveForm">
			<div title="线索详细信息" class="easyui-panel"
				style="width: 90%; padding: 15px" align="center">
				<table>
					<tr>
						<td class="t1" class="text-title">负责人：</td>
						<td class="t2">${leads.ownerUser.userName}</td>
						<td class="t1" class="text-title">公司名：</td>
						<td class="t2">${leads.name}</td>
					</tr>
					<tr>
						<td class="t1" class="text-title">来源：</td>
						<td class="t2">${leads.source}</td>
						<td class="t1" class="text-title">联系人姓名：</td>
						<td class="t2">${leads.contactsName}</td>
					</tr>
					<tr>
						<td class="t1" class="text-title">职位：</td>
						<td class="t2">${leads.position }</td>
						<td class="t1" class="text-title">尊称：</td>
						<td class="t2" class="text-content">${leads.saltname}</td>
					</tr>
					<tr>
						<td class="t1" class="text-title">手机：</td>
						<td class="t2" class="text-content">${leads.mobile}</td>
						<td class="t1" class="text-title">邮箱：</td>
						<td class="t2" class="text-content">${leads.email}</td>
					</tr>
					<tr>
						<td class="t1" class="text-title">下次联系时间：</td>
						<td class="t2" class="text-content"><fmt:formatDate value="${leads.nextstepTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td class="t1" class="text-title">下次联系内容：</td>
						<td class="t2" class="text-content">${leads.nextstep}</td>
						
					</tr>
					<tr>
						<td class="t1" class="text-title">创建时间:</td>
						<td class="t2"><fmt:formatDate value="${leads.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td class="t1" class="text-title">修改时间:</td>
						<td class="t2"><fmt:formatDate value="${leads.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					
					</tr>
					<tr>
						<td class="t1" class="text-title">是否已转换：</td>
						<td class="t2">${leads.isTransformed==1?'否':'是' }</td>
						<td class="t1" class="text-title">转换人：</td>
						<td class="t2">${leads.transformUser.userName}</td>
					</tr>
					<tr>
						<td class="t1" class="text-title">地址：</td>
						<td class="t2" class="text-content">${leads.address}</td>
						<td class="t1" class="text-title">备注：</td>
						<td class="t2" class="text-content">${leads.leadnote}</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>