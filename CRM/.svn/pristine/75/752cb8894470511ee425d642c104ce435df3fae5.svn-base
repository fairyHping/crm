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
<title>用户信息</title>
<style type="text/css">
.t1 {
	text-align: right;
	width: 100px;
	line-height: 30px;
	padding-left: 15px;
	padding-right: 20px;
	background-color: #f5f5f5;
}

.t2 {
	text-align: left;
	line-height: 30px;
	padding-left: 60px;
}
td {
	border: 1px solid #b0b8b8;
	text-align: center;
	line-height: 30px;
}

table {
	width: 90%;
	margin: 10px;
	border: 1px solid #b0b8b8;
	border-collapse: collapse;
	text-align: center;
}
</style>
</head>
<body style="max-width: 660px;">
	<div style="width: 100%; margin: 5px" align="center">


		<div title="用户详细信息" class="easyui-panel"
			style="width: 90%; padding: 20px" align="center">
			<table>
				<tr>
					<td class="t1" class="text-title">用户名:</td>
					<td class="t2" >${user.userName}</td>
				</tr>
				<tr>
					<td class="t1" class="text-title">联系电话:</td>
					<td class="t2" >${user.phone }</td>
				</tr>
				<tr>
					<td class="t1" class="text-title">电子邮箱:</td>
					<td class="t2" >${user.email}</td>
				</tr>
				<tr>
					<td class="t1" class="text-title">用户状态:</td>
					<td class="t2" >${user.status==1? '正常':user.status==0?'已禁用':'已删除'}</td>
				</tr>
				<tr>
					<td class="t1" class="text-title">创建时间:</td>
					<td class="t2" class="createTime"><fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				</tr>
				<tr>
					<td class="t1" class="text-title">修改时间:</td>
					<td class="t2" >
					<fmt:formatDate value="${user.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
				</tr>
				<tr>
					<td class="t1" class="text-title">描述信息:</td>
					<td class="t2"  class="text-content">${user.note}</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>